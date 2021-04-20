<script>
	var PAGE = {
		init: function() {
			Application.Ui.CheckboxSelection(
				'table#SplittestStatisticList',
				'input.UICheckboxToggleSelector',
				'input.UICheckboxToggleRows'
			);

			$('.disabledlink').click(function() {
				alert('{$lang.Addon_splittest_Stats_NotFinished}');
				return false;
			});

			$('.StatsDisplayDeleteStat').click(PAGE.deleteSplittestStat);
			$('.StatsDisplayExportStat').click(PAGE.exportSplittestStat);
			$('#StatsForm').submit(PAGE.selectSplittestAction);
		},

		selectSplittestAction: function(e) {
			var subAction = $('#SelectAction').val();
			var selected = 	$('.statsSelection:checked');

			if (selected.length < 1) {
				alert("{$lang.Addon_splittest_Multi_SelectFirst}");
				return false;
			}

			switch (subAction) {
				case 'MultiDelete':
					if (!confirm('{$lang.Addon_splittest_Delete_ConfirmMessage}')) {
						return false;
					}
					// flow through to standard form submission
					break;

				case 'MultiPrint':
					var jobids = $('.jobid:checked').map(function() {
						return 'jobids[]=' + $(this).val();
					});
					var statids = $('.jobid:checked').map(function() {
						return 'statids[]=' + $(this).next('.statid').val();
					});
					var job_stats = $.makeArray(jobids).join('&') + '&' + $.makeArray(statids).join('&');
					var url = 'addons/splittest/print_stats_options.php?height=270&width=420&overflow=none&path=addons/splittest/&statstype=splittest&Action=printsubaction=print&' + job_stats + '&options[]=snapshot&options[]=open&options[]=click&options[]=bounce&options[]=unsubscribe';
					tb_show('{$lang.Addon_splittest_PrintSplitTestStatistics}', url, '');
					return false;
					break;

				case 'MultiExport':
					// flow through to standard form submission
					break;

				default :
					alert('{$lang.PleaseChooseAction}');
					return false;
					break;
			}
		},

		deleteSelected: function() {
			var selected = 	$('.statsSelection:checked');

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

			Application.Util.submitPost('{$AdminUrl}&Action=Stats&Step=40', {statids: selectedIds});
			e.stopPropagation();
			e.preventDefault();
		},

		deleteSplittestStat: function(e) {
			if (confirm('Are you sure you want to delete the selected Split Test Statistics?')) {
				var jobID = $(this).attr('id').match(/hrefStatsDisplayDeleteJob_(\d*)/);
				var splitID = $(this).attr('splitid').match(/hrefStatsDisplayDeleteJob_(\d*)/);
				Application.Util.submitPost('index.php?Page=Addons&Addon=splittest&Action=Stats',
					{SubAction : 'Delete', jobid: jobID[1], splitid: splitID[1]}
				);
			}
			e.stopPropagation();
			e.preventDefault();
		},

		exportSplittestStat: function(e) {
			var jobID = $(this).attr('id').match(/hrefStatsDisplayExportJob_(\d*)/);
			var splitID = $(this).attr('splitid').match(/hrefStatsDisplayExportJob_(\d*)/);
			Application.Util.submitPost('index.php?Page=Addons&Addon=splittest&Action=Stats',
				{SubAction : 'Export', jobid: jobID[1], splitid: splitID[1]}
			);
			e.stopPropagation();
			e.preventDefault();
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

		Application.Util.submitPost('{$AdminUrl}&Action=Stats&Step=40', {statid: id});
		return true;
	}
</script>


<table width="100%" border="0">
	<tr>
		<td class="Heading1 Heading1New">{$lang.Addon_splittest_Stats_Heading}</td>
	</tr>
	<tr>
		<td class="body pageinfo internalAnchor"><p class="PageIntroP">{$lang.Addon_splittest_Stats_Intro}</p></td>
	</tr>
	<tr>
		<td>{$FlashMessages}</td>
	</tr>
	<tr>
		<td class="body">
			<form name="StatsForm" id="StatsForm" method="post" action="{$AdminUrl}&Action=Stats">
				<table width="100%" border="0">
					<tr>
						<td valign="top">
							<select id="SelectAction" name="SubAction" class="form-control selectBoxTrigger">
								<option value="" selected="selected">{$lang.Addon_splittest_Stats_ChooseAction}</option>
								<option value="MultiDelete">{$lang.Addon_splittest_Stats_DeleteSelected}</option>
								<option value="MultiPrint">{$lang.Addon_splittest_Stats_PrintSelected}</option>
								<option value="MultiExport">{$lang.Addon_splittest_Stats_ExportSelected}</option>
							</select>
							<input type="submit" name="cmdChangeType" class="goButton Text" value="{$lang.Go}" />
						</td>
					</tr>
				</table>
				<div class="thirdPartyTable"> 
				<table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text table" id="SplittestStatisticList">
					<tr class="Heading3">
						<td style="padding-left: 12px;">
						    <label class="customCheckBox">
                            	<input type="checkbox" name="toggle" class="UICheckboxToggleSelector" />
                                <span class="checkmark"></span>
                            </label>
						</td>
						<td>&nbsp;</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px;">
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=splitname&Direction=asc'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=splitname&Direction=desc'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>
							{$lang.Addon_splittest_Stats_SplitName}</a>
						</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px;">
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=splittype&Direction=asc'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=splittype&Direction=desc'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>
							{$lang.Addon_splittest_Stats_SplitType}
						</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px;">
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=list&Direction=asc'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=list&Direction=desc'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>
							{$lang.Addon_splittest_Stats_ListNames}
						</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px;">
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=list&Direction=asc'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=list&Direction=desc'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>
							{$lang.Addon_splittest_Stats_CampaignNames}
						</td>
						<td>
							{$lang.Addon_splittest_Winner}
						</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px;">
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=finishtime&Direction=asc'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&Action=Stats&SortBy=finishtime&Direction=desc'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>
							{$lang.Addon_splittest_Stats_DateFinished}
						</td>
						<td>
							%%LNG_Action%%
						</td>
					</tr>
					{foreach from=$Statistics key=statid item=statsDetails}
						<tr class="GridRow">
							<td>
                                <label class="customCheckBox">
                                    <input type="checkbox" value="{$statsDetails.jobid}" name="jobids[]" class="UICheckboxToggleRows statsSelection jobid" />
                                    <span class="checkmark"></span>
                                </label>
								<input type="hidden" id="statid_{$statsDetails.jobid}" name="statids[]" value="{$statsDetails.splitid}" class="statid" />
							</td>
							<td style="padding:0px;">
								<img src="{$ApplicationUrl}addons/splittest/images/Split_Test_Statistics_image.svg" height="20" width="20" border="0" />
							</td>
							<td>
								{$statsDetails.splitname}
							</td>
							<td>
								{if $statsDetails.splittype == 'distributed'}
									{$lang.Addon_splittest_Manage_SplitType_Distributed}
								{elseif $statsDetails.splittype == 'percentage'}
									{$lang.Addon_splittest_Manage_SplitType_Percentage}
									{*
									({$statsDetails.splitdetails.openrate}% / {$statsDetails.splitdetails.clickrate}%)
									*}
								{/if}
							</td>
							<td>
								{foreach from=$statsDetails.lists item=list id=sequence}
									{$list.name}{if !$sequence.last}, {/if}
								{/foreach}
							</td>
							<td>
								{$statsDetails.campaign_names}
							</td>
							<td>
								{if $statsDetails.finishtime > 0}
									{if $statsDetails.campaign_winner_type == 'None'}
										<span class="HelpToolTip HelpText">
											<span class="HelpToolTip_Title" style="display:none;">{$lang.Addon_splittest_Stats_WinningCampaign}</span>
											<span class="HelpToolTip_Contents" style="display:none;">{$lang.Addon_splittest_WonNone} {$lang.Addon_splittest_ViewMore}</span>
											{$lang.Addon_splittest_None}
										</span>
									{else}
										<span class="HelpToolTip HelpText">
											<span class="HelpToolTip_Title" style="display:none;">{$lang.Addon_splittest_Stats_WinningCampaign}</span>
											<span class="HelpToolTip_Contents" style="display:none;">{$statsDetails.winner_message} {$lang.Addon_splittest_ViewMore}</span>
											{$statsDetails.campaign_winner_name}
										</span>
									{/if}
								{else}
									<span class="HelpToolTip HelpText">
										<span class="HelpToolTip_Title" style="display:none;">{$lang.Addon_splittest_Stats_StillSending}</span>
										<span class="HelpToolTip_Contents" style="display:none;">{$lang.Addon_splittest_Stats_StillSending_Tip}</span>
										{$lang.Addon_splittest_Stats_StillSending}
									</span>
								{/if}
								<div style="font-weight:normal" id="active_{$statid}" style="display:none;"></div>
							</td>
							<td>
								{if $statsDetails.finishtime == 0}
									{$lang.Addon_splittest_Stats_FinishTime_NotFinished}
								{else}
									{$statsDetails.finishtimeprint}
								{/if}
							</td>
							<td nowrap="nowrap" align="center">
								<div class="dropdown ml-1">
								    <!-- actions here -->
								    <button class="btn p-0" type="button" id="dropdownMenuButton{$statsDetails.jobid}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                				        <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            					    </button>
								    <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton{$statsDetails.jobid}" >
                                        {if $statsDetails.finishtime == 0}
                                            {capture name=active_status}disabledlink{/capture}
                                        {/if}
                                        <a class="{$active_status} dropdown-item" href="index.php?Page=Addons&Addon=splittest&Action=Stats&splitid={$statsDetails.splitid}&jobid={$statsDetails.jobid}">{$lang.Addon_splittest_Stats_View}</a>
                                        <a class="{$active_status} dropdown-item StatsDisplayExportStat" id="hrefStatsDisplayExportJob_{$statsDetails.jobid}" splitid="hrefStatsDisplayExportJob_{$statsDetails.splitid}" href="#">{$lang.Addon_splittest_Stats_Export}</a>
                                        <a class="{$active_status} thickbox dropdown-item" href="addons/splittest/print_stats_options.php?height=290&width=420&overflow=none&statstype=splittest&Action=print&statids={$statsDetails.splitid}&jobids={$statsDetails.jobid}&path=addons/splittest/" title="{$lang.Addon_splittest_PrintSplitTestStatistics}">{$lang.Addon_splittest_Stats_Print}</a>
                                        <a id="hrefStatsDisplayDeleteJob_{$statsDetails.jobid} " splitid="hrefStatsDisplayDeleteJob_{$statsDetails.splitid}" class="StatsDisplayDeleteStat dropdown-item" href="#">{$lang.Addon_splittest_Stats_Delete}</a>
                                        {capture name=active_status}{/capture}
								    </div>
								</div>
							</td>
						</tr>
					{/foreach}
				</table>
                </div>
			</form>
		</td>
	</tr>
	<tr>
		<td align="left">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td align="left">
			{$Paging}
		</td>
	</tr>
</table>
<style>
.button_div .FormButton
{
	width:106px;
}
#TB_window {
    position: fixed;
    background: #ffffff;
    z-index: 102;
    color: #000000;
    display: none;
    border: 4px solid #525252;
    text-align: left;
    top: 50% !important;
    left: 50% !important;
     transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);
    -ms-transform:: translate(-50%, -50%);
    -webkit: translate(-50%, -50%);
    -moz-transform:: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    -webkit-transform: -webkit-translate(-50%, -50%);
    margin-left: auto !important;
    margin-top: auto !important;
}
.printDiv {
	padding:8px;
	font-size:14px;
	font-family: 'Roboto', Arial, Tahoma, sans-serif;
}
.customCheckBox {
    padding-bottom: 13px;
}
.HelpToolTip_Placeholder {
    z-index: 5;
}
.Heading3 TD {
    padding: 0.75rem;
    padding-right: 16px;
	padding-left: 16px;
}
.form-control {
	height:40px;
	display: initial;
    width: 130px;
}

.BodyContainer {
    width: 98.5%;
    margin: 10px 10px 10px 7px;
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
TR.GridRow TD {
    font-size: 14px !important;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    vertical-align: middle;
    font-size: 100%;
    border-bottom: solid 1px #edecec;
    word-break: break-word;
}
.thirdPartyTable {
    margin-top:25px;
}
.GridRow TD:not(:first-child):(:last-child) {
    padding-left: 20px;
    padding-right: 0px;
}
.GridRow TD {
    padding-right: 0px !important;
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
    #SelectAction {
        width:140px !important;
    }
    .BodyContainer{
        width:98.5%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:100% !important;
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
@media screen and (max-width:945px){
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
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:905px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:895px !important;
        overflow-x:scroll !important;
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
@media screen and (max-width:830px){
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
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:795px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:780px !important;
        overflow-x:scroll !important;
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
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:720px !important;
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
}
@media screen and (max-width:768px){
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
        width:98%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:720px !important;
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
    .HelpToolTip_Placeholder {
        margin:26px -150px !important;
    }
}
@media screen and (max-width:568px){
	.HelpToolTip_Placeholder{
		margin-left:-90px!important;
	}
	#TB_window
	{
        margin-left: 4px !important;
        left: 0% !important;
        width: 98vw !important;
	}
	#TB_ajaxContent
	{
		width: 100% !important;
        height:100% !important;
        font-family: "Roboto", Arial, Tahoma, sans-serif;
        font-size: 14px;
	}
    #TB_title {
        padding-bottom:0px;
    }
    #TB_ajaxWindowTitle {
        padding-bottom:7px;
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
    .SmallButton {
        width:10.5rem !important;
    }

}
@media screen and (max-width:414px){
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-525px!important;
	}

}
@media screen and (max-width:411px){
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-575px!important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-550px!important;
	}
}
@media screen and (max-width:360px){
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
        width:95%;
        margin:10px 10px 10px 8px;
    }
    .parentTableDiv{
        width:290px !important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-590px!important;
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
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:285px !important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-620px!important;
	}

}
</style>



<style>
#TB_window, .ui-window {
    margin-left: auto !important;
    margin-top: auto !important;
    top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: : translate(-50%, -50%);
	-webkit: translate(-50%, -50%);
	-moz-transform: : translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	-webkit-transform: -webkit-translate(-50%, -50%);
}
</style>