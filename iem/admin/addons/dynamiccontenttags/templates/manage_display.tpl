<script>
	var PAGE = {
		init: function() {
				Application.Ui.CheckboxSelection(
					'table#DynamiccontenttagManageList',
					'input.UICheckboxToggleSelector',
					'input.UICheckboxToggleRows'
				);

			$('#DeleteDynamiccontenttagButton').click(function() {
				PAGE.deleteSelected();
			});

		},

		deleteSelected: function() {
			var selected = 	$('.dynamicContentTagSelection').filter(function() { return this.checked; });

			if (selected.length < 1) {
				alert("{$lang.Addon_dynamiccontenttags_Delete_SelectFirst}");
				return false;
			}

			if (!confirm("{$lang.Addon_dynamiccontenttags_Delete_ConfirmMessage}")) {
				return;
			}

			var selectedIds = [];
			for(var i = 0, j = selected.length; i < j; ++i) {
				selectedIds.push(selected[i].value);
			}

			Application.Util.submitPost('{$AdminUrl}&Action=Delete', {tagids: selectedIds});
		}
	};

	$(function() {
		PAGE.init();
	});

	function DelDynamicTag(id)
	{
		if (id < 1) {
			return false;
		}

		if (!confirm('{$lang.Addon_dynamiccontenttags_DeleteOne_Confirm}')) {
			return false;
		}

		Application.Util.submitPost('{$AdminUrl}&Action=Delete', {tagids: id});
		return true;
	}
</script>
<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
	<tr>
		<td class="Heading1 col-sm-4 Heading1New">{$lang.Addon_dynamiccontenttags_ViewHeading}</td>
	</tr>
	<tr>
		<td class="body pageinfo internalAnchor" >
			<p class="PageIntroP" >
				{$lang.Addon_dynamiccontenttags_Form_Intro}
			</p>
		</td>
	</tr>
	<tr>
		<td >
			{$FlashMessages}
		</td>
	</tr>
	<tr style="height:15px;"></tr>
	<tr>
		<td class="body" colspan="2">
			{$Tags_Create_Button}
			{if $ShowDeleteButton}
				<input class="SmallButton btn save-btn buttonFix" type="button" style="width: 205px;" value="{$lang.Addon_dynamiccontenttags_DeleteSelected}" name="DeleteDynamiccontenttagButton" id="DeleteDynamiccontenttagButton"/>
			{/if}
		</td>
	</tr>
</table>
<div class="thirdPartyTable" style="padding-top:15px;">
<form name="dynamiccontenttag" id="dynamiccontenttag">
<table border="0" cellspacing="0" cellpadding="0" width="100%" style="" class="Text table" id="DynamiccontenttagManageList">
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
                <a href="{$AdminUrl}&SortBy=name&Direction=asc">
                    <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                </a>
            </span>
            <span>
                <a href="{$AdminUrl}&SortBy=name&Direction=desc">
                    <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                </a>
            </span>
			</div>
			{$lang.Addon_dynamiccontenttags_Manage_TagName}&nbsp;
		</td>
		<td>
		<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
			<span>
                <a href="{$AdminUrl}&SortBy=username&Direction=asc">
                    <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                </a>
            </span>
            <span>
                <a href="{$AdminUrl}&SortBy=username&Direction=desc">
                    <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                </a>
            </span>
		</div>
			{$lang.Addon_dynamiccontenttags_Manage_TagOwner}&nbsp;
		</td>
		<td >
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
			{$lang.Addon_dynamiccontenttags_Manage_TagCreated}&nbsp;
		</td>
		<td >
			{$lang.Addon_dynamiccontenttags_Manage_TagAction}
		</td>
	</tr>
	{foreach from=$tags key=k item=tagsEntry}
		<tr class="GridRow" id="{$tagsEntry.tagid}">
			<td align="center">
				<label class="customCheckBox">
				<input class="UICheckboxToggleRows dynamicContentTagSelection" type="checkbox" name="tagids[]" value="{$tagsEntry.tagid}">
				<span class="checkmark"></span>
				</label>
			</td>
			<td>
				<img src="{$ApplicationUrl}addons/dynamiccontenttags/images/dct_add.svg" />
			</td>
			<td>
				{$tagsEntry.name}
			</td>
			<td>
				{$tagsEntry.ownerusername}
			</td>
			<td>
				{$tagsEntry.createdate|dateformat,$DateFormat}
			</td>
			<td>
				<div class="dropdown ml-1">
				<button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            	</button>
				<div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
				{if $EditPermission}
					<a class="dropdown-item" href="{$AdminUrl}&Action=Edit&id={$tagsEntry.tagid}">{$lang.Addon_dynamiccontenttags_Manage_Edit}</a>
				{/if}
				{if $DeletePermission}
					<a class="dropdown-item" href="#" onClick="return DelDynamicTag({$tagsEntry.tagid});">{$lang.Addon_dynamiccontenttags_Manage_Delete}</a>
				{/if}
				</div>
				</div>
			</td>
		</tr>
	{/foreach}
</table>
</form>
</div>
<tr>
		<td valign="bottom">
			&nbsp;
		</td>
		<td align="right">
			<div align="right">
				{$Paging}
			</div>
		</td>
	</tr>
<style>
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
.Heading3 TD, TR.GridRow TD {
    word-break:break-all;
}
.Heading3 TD:nth-child(1) {
    padding:12px !important;
    width:60px;
}
.Heading3 TD:nth-child(2) {
    padding:12px !important;
    width:60px;
    text-align:center;
}
.Heading3 TD:nth-child(3), .Heading3 TD:nth-child(4) {
    padding:12px !important;
    width:30%;
}
.Heading3 TD:nth-child(5) {
    padding:12px !important;
    width:150px;
}
.Heading3 TD:nth-child(6) {
    padding:12px !important;
    width:85px;
}
#DeleteDynamiccontenttagButton, #CreateTagButton {
    width:210px !important;
}
@media screen and (max-width:1024px){
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
        width: 900px !important;
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
        width:100% !important;
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
}
@media screen and (max-width:823px){
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
}

@media screen and (max-width:568px){
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
     #AddSplitTestButton{
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
	.buttonFix{
		margin-top:6px;
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
    #AddSplitTestButton{
        margin-top:6px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
	.Heading3 td+td+td,.Heading3 td+td+td{
		padding-right:35px;
	}
}
@media screen and (max-width:411px){
    #AddSplitTestButton{
        margin-top:6px;
        width:190px !important;
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
        width:100%%;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:360px){
    #AddSplitTestButton{
        margin-top:6px;
        width:190px !important;
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
        width:280px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:255px !important;
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