<script>
	var PAGE = {
		init: function() {
				Application.Ui.CheckboxSelection(
					'table#SplittestManageList',
					'input.UICheckboxToggleSelector',
					'input.UICheckboxToggleRows'
				);

			$('#DeleteSplitTestButton').click(function() {
				PAGE.deleteSelected();
			});

		},

		deleteSelected: function() {
			var selected = 	$('.splitTestSelection').filter(function() { return this.checked; });

			if (selected.length < 1) {
				alert("{$lang.Addon_splittest_Delete_SelectFirst}");
				return false;
			}

			if (!confirm("{$lang.Addon_splittest_Delete_ConfirmMessage}")) {
				return;
			}

			var selectedIds = [];
			for(var i = 0, j = selected.length; i < j; ++i) {
				selectedIds.push(selected[i].value);
			}

			Application.Util.submitPost('{$AdminUrl}&Action=Delete', {splitids: selectedIds});
		}
	};

	$(function() {
		PAGE.init();
	});

	function DelSplitTest(id, status)
	{
		if (id < 1) {
			return false;
		}

		if (status == 'i' || status == 'r') {
			alert('{$lang.Addon_splittest_Manage_Delete_Disabled_Alert}');
			return false;
		}

		if (!confirm('{$lang.Addon_splittest_DeleteOne_Confirm}')) {
			return false;
		}

		Application.Util.submitPost('{$AdminUrl}&Action=Delete', {splitid: id});
		return true;
	}
</script>
<div class="parentTableDiv">
<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
	<tr>
		<td class="Heading1 col-sm-4 Heading1New" colspan="2">{$lang.Addon_splittest_Heading}</td>
	</tr>
	<tr>
		<td class="body pageinfo internalAnchor" colspan="2"><p class="PageIntroP" >{$lang.Addon_splittest_Intro}</p></td>
	</tr>
	<tr>
		<td colspan="2">
			{$FlashMessages}
		</td>
	</tr>
	<tr>
		<td class="body" colspan="2">
		<div style=" float:left;padding-top:10px; padding-bottom:10px">
			{$SplitTest_Create_Button}
			{if $ShowDeleteButton}
				<input class="SmallButton btn cancel-btn" type="button" style="width: 170px;" value="{$lang.Addon_splittest_DeleteButton}" name="DeleteSplitTestButton" id="DeleteSplitTestButton"/>
			{/if}
		</div>
		</td>
	</tr>
</table>
<div class="thirdPartyTable">
<form name="splittestlist" id="splittestlist">
<table border="0" cellspacing="0" cellpadding="0" width="100%" style="" class="Text table" id="SplittestManageList">
	<tr class="Heading3">
		<td nowrap align="center">
		<label class="customCheckBox">
			<input class="UICheckboxToggleSelector" type="checkbox" name="toggle"/>
			<span class="checkmark"></span>
		</label>
		</td>
		<td>&nbsp;</td>
		<td>
		<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
			<span>
			<a href="{$AdminUrl}&SortBy=splitname&Direction=asc">
			<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
			</a>
			</span>
			<span>
			<a href="{$AdminUrl}&SortBy=splitname&Direction=desc">
			<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
			</a>
			</span>
			</div>
			{$lang.Addon_splittest_Manage_SplitName}
		</td>
		<td>
			{$lang.Addon_splittest_Manage_SplitCampaigns}
		</td>
		<td><div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
			<span>
			<a href="{$AdminUrl}&SortBy=splittype&Direction=asc">
			<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
			</a>
			</span>
			<span>
			<a href="{$AdminUrl}&SortBy=splittype&Direction=desc">
			<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
			</a>
			</span>
			</div>
			{$lang.Addon_splittest_Manage_SplitType}
		</td>
		<td class="tdpadding">
		<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
			<span>
			<a href="{$AdminUrl}&SortBy=createdate&Direction=asc">
			<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
			</a>
			</span>
			<span>
			<a href="{$AdminUrl}&SortBy=createdate&Direction=desc">
			<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
			</a>
			</span>
			</div>
			{$lang.Addon_splittest_Manage_SplitCreated}
		</td>
		<td class="tdpadding"><div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
			<span>
			<a href="{$AdminUrl}&SortBy=lastsent&Direction=asc">
			<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
			</a>
			</span>
			<span>
			<a href="{$AdminUrl}&SortBy=lastsent&Direction=desc">
			<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
			</a>
			</span>
			</div>
			{$lang.Addon_splittest_Manage_SplitLastSent}
		</td>
		<td>
			{$lang.Addon_splittest_Manage_SplitAction}
		</td>
	</tr>
	{foreach from=$splitTests key=k item=splittestEntry}
		<tr class="GridRow" id="{$splittestEntry.splitid}">
			<td align="center">
			
        <label class="customCheckBox">
				<input class="UICheckboxToggleRows splitTestSelection" type="checkbox" name="splitids[]" value="{$splittestEntry.splitid}">
			<span class="checkmark"></span></label></td>
			<td>
					<img src="images/Split_Test_Statistics_image.svg" border="0"/>
			</td>
			<td>
				{$splittestEntry.splitname}
			</td>
			<td>
				{$splittestEntry.campaign_names}
			</td>
			<td>
				<span class="HelpText" onMouseOut="HideHelp('splitDisplay{$splittestEntry.splitid}');" onMouseOver="ShowQuickHelp('splitDisplay{$splittestEntry.splitid}', '{$splittestEntry.tipheading}', '{$splittestEntry.tipdetails}');">
				{if $splittestEntry.splittype == 'distributed'}
					{$lang.Addon_splittest_Manage_SplitType_Distributed}
				{elseif $splittestEntry.splittype == 'percentage'}
					{$lang.Addon_splittest_Manage_SplitType_Percentage}
				{/if}
				</span><br /><div id="splitDisplay{$splittestEntry.splitid}" style="display: none;" class="splitTestTipMessage Z-index HelpToolTip_Placeholder"></div>
			</td>
			<td>
				{$splittestEntry.createdate|dateformat,$DateFormat}
			</td>
			<td>
				{if $splittestEntry.lastsent == 0}
					{$lang.Addon_splittest_Manage_LastSent_Never}
				{else}
					{$splittestEntry.lastsent|dateformat,$DateFormat}
				{/if}
			</td>
			<td>
			
		<div class="dropdown ml-1">
		<button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
                
				{if $SendPermission}
					{if $splittestEntry.jobstatus == 'i'}
						<a class="dropdown-item" href="{$AdminUrl}&Action=Send&id={$splittestEntry.splitid}&Step=20">{$lang.Addon_splittest_Pause}</a>
					{elseif $splittestEntry.jobstatus == 'p'}
						<a class="dropdown-item" href="{$AdminUrl}&Action=Send&id={$splittestEntry.splitid}&Step=30">{$lang.Addon_splittest_Resume}</a>
					{elseif $splittestEntry.jobstatus == 'w'}
						{if $ScheduleSendPermission}
							<a class="dropdown-item" href="{$ApplicationUrl}index.php?Page=Schedule">{$lang.Addon_splittest_WaitingToSend}</a>
						{else}
							<a class="dropdown-item" href="{$AdminUrl}&Action=Send&id={$splittestEntry.splitid}&Step=20">{$lang.Addon_splittest_WaitingToSend}</a>
						{/if}
					{elseif $splittestEntry.jobstatus == 't'}
						<span class="HelpText" onMouseOut="HideHelp('splitDisplayTimeout{$splittestEntry.splitid}');"
						onMouseOver="ShowQuickHelp('splitDisplayTimeout{$splittestEntry.splitid}', '{$splittestEntry.TimeoutTipHeading}', '{$splittestEntry.TimeoutTipDetails}');">
							{if $ScheduleSendPermission}
								{$lang.Addon_splittest_TimeoutMode}
							{else}
								<a class="dropdown-item" href="{$AdminUrl}&Action=Send&id={$splittestEntry.splitid}&Step=20">{$lang.Addon_splittest_TimeoutMode}</a>
							{/if}
						</span><div id="splitDisplayTimeout{$splittestEntry.splitid}" style="display: none;"></div>
					{else}
						<a class="dropdown-item" href="{$AdminUrl}&Action=Send&id={$splittestEntry.splitid}">{$lang.Addon_splittest_Manage_Send}</a>
					{/if}
				{/if}
				{if $EditPermission}
					{if $splittestEntry.jobstatus == 'i' || $splittestEntry.jobstatus == 'r'}
						<a class="dropdown-item" href="#" onClick="alert('{$lang.Addon_splittest_Manage_Edit_Disabled_Alert}'); return false;" title="{$lang.Addon_splittest_Manage_Edit_Disabled}">{$lang.Addon_splittest_Manage_Edit}</a>
					{else}<a class="dropdown-item" href="{$AdminUrl}&Action=Edit&id={$splittestEntry.splitid}">{$lang.Addon_splittest_Manage_Edit}</a>
					{/if}
				{/if}
				{if $CopyPermission}<a class="dropdown-item" href="{$AdminUrl}&Action=Create&Copy={$splittestEntry.splitid}">{$lang.Addon_splittest_Manage_Copy}</a>
				{/if}
				{if $DeletePermission}<a class="dropdown-item" href="#" {if $splittestEntry.jobstatus == 'i' || $splittestEntry.jobstatus == 'r'} title="{$lang.Addon_splittest_Manage_Delete_Disabled}"{/if} onClick="return DelSplitTest({$splittestEntry.splitid}, '{$splittestEntry.jobstatus}');">{$lang.Addon_splittest_Manage_Delete}</a>
				{/if}</div>
        </div>
			</td>
		</tr>
	{/foreach}</table></div>
		{$Paging}
		</td>
	</tr>
</table>
</form>
</div>
<style>
.SmallButton {
    white-space: nowrap !important;
}
.splitTestTipMessage{
    font-family: Roboto, Arial, Tahoma, sans-serif ; 
    font-size:13px; 
    display:inline;
     position: absolute; 
    width: 240px;
     background-color: #ffffff;
      webkit-border-radius: 0;
    -moz-border-radius: 0;
    -ms-border-radius: 0;
    border-radius: 0; 
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); 
    border: none !important; padding: 10px; 
    margin: 10px -50px;
}
    .selectField{
        float:right;
        margin-top: 5.5px;
    }
    .HelpTextspan {
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: none !important;
    }
    .helptoolTipNew{
        margin:-75px 20px !important;
        padding:10px;
        width:225px;
        z-index:99 !important;
        border:0px !important;
        font-size: 13px;
        display: inline;
        position: absolute;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: none;
        padding: 10px;
    }
    .helptoolTipNewTh{
        margin:15px -175px !important;
        padding:10px;
        width:280px !important;
        z-index:99 !important;
        border:0px !important;
        font-size: 13px;
        position: absolute;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: none;
        padding: 10px;
        white-space: normal !important;
        display: contents;
    }
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}

element.style {
}
.Heading3 TD {
    vertical-align: middle;
    height: 44px;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    padding: 0.75rem;
    border-top: 1px solid #dee2e6;
    background-repeat: repeat-x;
    padding-top: 4px;
    padding-right: 5px;
    padding-bottom: 4px;
    padding-left: 5px;
    font-size: 15px;
    cursor: pointer;
    white-space: nowrap;
    color: #000000;
    border-bottom-width: 1px;
    border-bottom-style: solid;
    border-bottom-color: #dddddd;
}
.HelpToolTip_Placeholder {
        margin:5px
    }
.multiselectTd{
    display:flex;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
.parentTableDiv {
    width:100%;
}
.nextCancelButton {
    margin-top:11.5%;
}
.submitTableBtn{
    width:180px;
}
.Field250{
    width:410px;
    margin-right:0px;
}
.Field350 {
    width:410px !important;
    padding-right:0px;
}
.form-control {
    display:inline;
}
.createCamp {
    width:12rem !important;
}
.BodyContainer {
    width: 98.5%;
}
#NewsletterManageList td:nth-child(3) {
    word-break:break-word !important;
}
.Z-index {
    z-index: 1;
}
TR.GridRow TD {
    font-size: 14px !important;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    vertical-align: middle;
    font-size: 100%;
    border-bottom: solid 1px #edecec;
    word-break: break-word;
}
.Heading3 TD:nth-child(1) {
    padding: 12px !important;
    width: 60px;
}
.Heading3 TD:nth-child(2) {
    padding: 12px !important;
    width: 60px;
    text-align: center;
}
.Heading3 TD:nth-child(3), .Heading3 TD:nth-child(4) {
    padding: 12px !important;
    width: 27%;
}
.Heading3 TD:nth-child(5) {
    padding: 12px !important;
    width: 130px;
}
.Heading3 TD:nth-child(6), .Heading3 TD:nth-child(7) {
    padding: 12px !important;
    width: 105px;
}
.Heading3 TD:nth-child(8) {
    padding: 12px !important;
    width: 75px;
}
@media screen and (max-width:1024px){
    .HelpToolTip_Placeholder {
        margin:5px
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .BodyContainer{
        width:100;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width: 920px !important;
        margin-left: 0px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:920px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        //flex-direction: column !important;
        //padding:10px 0px;
        //align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 TD:nth-child(2) {
        padding-left:24px !important;
        padding-right:24px !important;
    }
}
@media screen and (max-width:823px){
    .HelpToolTip_Placeholder {
        margin:5px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .ChangeTypeSelect  {
        width:170px !important;
    }
    .selectField{
        clear:both;
        float:left;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
}
@media screen and (max-width:768px){
    #NewsletterManageList{
        margin-bottom: 0px;
        margin-top: 15px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .ChangeTypeSelect  {
        width:170px !important;
    }
    .BodyContainer{
        width:98%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .HelpToolTip_Placeholder {
        margin:5px;
    }
}

@media screen and (max-width:568px){
    .HelpToolTip_Placeholder{
		margin-left:-90px!important;
	}
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .ChangeTypeSelect  {
        width:170px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:scroll !important;
    }
    .helptoolTipNewTh{
        margin:15px -368px !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
     #DeleteSplitTestButton{
        margin-top:6px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    
}
@media screen and (max-width:414px){
    .HelpTextspan{
        margin: auto -273px;
    }
    .HelpToolTip_Placeholder{
		margin-left:-214px!important;
	}
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .ChangeTypeSelect  {
        width:170px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .helptoolTipNewTh{
        margin:15px -432px !important;
    }
    #DeleteSplitTestButton{
        margin-top:6px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:411px){
    .HelpToolTip_Placeholder{
		margin-left:-214px!important;
	}
    #DeleteSplitTestButton{
        margin-top:6px;
        width:170px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .ChangeTypeSelect  {
        width:190px !important;
    }
    .selectField {
        margin-top:-2.5px;
    }
    .BodyContainer{
        width:96%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:340px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }

}
@media screen and (max-width:375px){
    .HelpToolTip_Placeholder{
		margin-left:-214px!important;
	}
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .ChangeTypeSelect   {
        width:170px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:345px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .helptoolTipNewTh{
        margin:15px -432px !important;
    }
    .PageIntroP{
        width:100%;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:360px){
    .tdpadding{
        padding-right: 35px !important;
    }
    .HelpToolTip_Placeholder{
		margin-left:-235px!important;
	}
    #DeleteSplitTestButton{
        margin-top:6px;
        width:170px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .selectField {
        margin-top: -3.5px !important;
    }
    .ChangeTypeSelect   {
        width:190px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 8px;
    }
    .parentTableDiv{
        width:295px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .helptoolTipNewTh{
        margin:15px -467px !important;
    }
    .ActivehelpTooltip{
        margin:15px -420px !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:320px){
    .HelpToolTip_Placeholder{
		margin-left:-253px!important;
	}
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .ChangeTypeSelect  {
        width:190px !important;
    }
    .selectField {
        margin-top:-2.5px;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:265px  !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:265px  !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .helptoolTipNewTh{
        margin:15px -469px !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
</style>

