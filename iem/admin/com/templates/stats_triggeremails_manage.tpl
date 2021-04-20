<script>
    Application.Page.StatsTriggerEmailsManage = {
        eventDOMReady: function (event) {
            if ($('#triggeremails_statistics_list').size() != 0) {
                Application.Ui.CheckboxSelection('table#triggeremails_statistics_list',
                        'input.UICheckboxToggleSelector',
                        'input.UICheckboxToggleRows');

                $(document.frmPageAction).submit(Application.Page.StatsTriggerEmailsManage.eventSubmitBulkAction);

                $('#triggeremails_statistics_list .StatsTriggerEmails_Row_Action_Delete').click(Application.Page.StatsTriggerEmailsManage.eventActionRow);
            }

            if (document.frmPageAction.cmdAddTrigger) {
                $(document.frmPageAction.cmdAddTrigger).click(Application.Page.StatsTriggerEmailsManage.eventAddTrigger);
            }
        },

        eventActionRow: function (event) {
            event.stopPropagation();
            event.preventDefault();

            var id = this.href.match(/id=(\d+)$/)[1];
            var url = this.href.replace(/&{0,1}id=(\d+)$/, '');
            var action = this.href.match(/SubAction=(\w+)/)[1];

            if (action == 'Delete') {
                if (!confirm('{$lang.TriggerEmails_Stats_PromptDelete}'))
                    return;
            }

            Application.Util.submitPost(url, {'id':id});
        },

        eventSubmitBulkAction: function (event) {
            event.stopPropagation();
            event.preventDefault();

            if (this.ChangeType.selectedIndex == 0) {
                alert("{$lang.PleaseChooseAction}");
                return false;
            }

            var selectedIDs = [];
            var selectedStatsIDs = [];
            var selectedRows = $('#triggeremails_statistics_list input.UICheckboxToggleRows').filter(':checked');

            if (selectedRows.size() == 0) {
                alert('{$lang.TriggerEmails_Stats_PromptChoose}');
                return false;
            }

            var action = $(this.ChangeType).val();
            for (var i = 0, j = selectedRows.size(); i < j; ++i) {
                var temp = selectedRows.get(i).value.split(':');
                selectedIDs.push(temp[0]);
                selectedStatsIDs.push(temp[1]);
            }

            switch (action) {
                case 'print':
                    var idstring = 'triggerid[]=' + selectedIDs.join('&triggerid[]=');
                    var statidstring = 'stats[]=' + selectedStatsIDs.join('&stats[]=');

                    tb_show('{$lang.TriggerEmails_Stats_Print}',
                            'remote_stats.php?height=420&width=420&overflow=none&statstype=t&Action=print&' + idstring + '&' + statidstring);
                    break;

                case 'delete':
                    if (!confirm('{$lang.TriggerEmails_Stats_BulkAction_Delete}'))
                        break;
                    Application.Util.submitPost('index.php?Page=Stats&Action=TriggerEmails&SubAction=bulkAction&bulkAction=delete',
    {'id':selectedStatsIDs});
                    break;

                default:
                    alert("{$lang.PleaseChooseAction}");
                    break;
            }
        },

        eventAddTrigger: function (event) {
            event.stopPropagation();
            event.preventDefault();

            document.location.href = 'index.php?Page=TriggerEmails&Action=Create';
        }
    };

    Application.init.push(Application.Page.StatsTriggerEmailsManage.eventDOMReady);
</script>
<div class="PageBodyContainer">
    <div class="Page_Header">
        <div class="Heading1 Heading1New">{$lang.TriggerEmails_Stats_Title}</div>
        <div class="Intro PageIntroP">{$lang.TriggerEmails_Stats_Intro}</div>
        {if trim($PAGE.messages) != ''}
            <div style="margin-top: 5px;">{$PAGE.messages}</div>
        {/if}

        <div class="Page_Action">
            <div style="{if trim($PAGE.messages) == ''}padding-top: 10px;{/if} float:left;">
                {* Contact Lists and Campaigns are available, print the "Add Trigger" button *}
                {if $listCount != 0 && $newsletterCount != 0}
                    {if $permissions.create}
                        <form name="frmCreateTrigger" action="index.php" method="GET">
                            <input type="hidden" name="Page" value="TriggerEmails" />
                            <input type="hidden" name="Action" value="Create" />
                            <input type="submit" value="{$lang.TriggerEmails_Manage_AddButton}" class="SmallButton btn save-btn" style="width:150px;" />
                        </form>
                    {/if}

                    {* Either/Both Contact Lists and Campaigns are NOT available, print buttons for these if user have the correct permissions *}
                {else}
                    {if $listCount == 0 && $permissions.createList}
                        <form name="frmCreateList" action="index.php" method="GET">
                            <input type="hidden" name="Page" value="Lists" />
                            <input type="hidden" name="Action" value="Create" />
                            <input type="submit" value="{$lang.TriggerEmails_Manage_AddListButton}" class="SmallButton btn save-btn" style="width:150px;" />
                        </form>
                    {/if}
                    <br />
                    {if $newsletterCount == 0 && $permissions.createNewsletter}
                        <form name="frmCreateNewsletter" action="index.php" method="GET">
                            <input type="hidden" name="Page" value="Newsletters" />
                            <input type="hidden" name="Action" value="Create" />
                            <input type="submit" value="{$lang.TriggerEmails_Manage_AddCampaignButton}" class="SmallButton btn save-btn" style="width:150px;" />
                        </form>
                    {/if}
                {/if}
            </div>
            <div class="select-div" style="float:right; margin-bottom: 12px;">
                <form name="frmPageAction" method="POST" action="index.php?Page=Stats&Action=TriggerEmails&SubAction=BulkAction">
                <div class="Page_Action_Top"></div>
                {* Bulk Action and pagination -- Only print if records are available *}
                {if count($records) != 0}
                    {* ----- Bulk Action ----- *}
                    <div style="display: flex;">
                        <select name="ChangeType" class="form-control selectBoxTrigger">
                            <option value="" selected="selected">{$lang.ChooseAction}</option>
                            <option value="delete">{$lang.Delete}</option>
                            <option value="print">{$lang.Print_Stats_Selected}</option>
                        </select>
                        <input type="submit" name="cmdChangeType" class="goButton Text" value="{$lang.Go}" />
                    </div>
                    {* ----- *}

                    
                {/if}

                <div class="Page_Action_Bottom"></div>
            </form>
            </div>
        </div>
    </div>
    <div class="thirdPartyTable" style="padding-top:1px;">
    <div class="Page_Contents">
        {if count($records) != 0}
            {* Tabular records *}
            <table id="triggeremails_statistics_list" border="0" cellspacing="0" cellpadding="2" width="100%" class="Text table">
                <tr class="Heading3">
                    <td align="center">
                        <label class="customCheckBox">
                            <input type="checkbox" class="UICheckboxToggleSelector" />
                            <span class="checkmark"></span>
                        </label
                    </td>
                    <td>&nbsp;</td>
                    <td style="width: 45%;">
                        <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                            <span>
                                <a href="index.php?Page=Stats&Action=TriggerEmails&SortBy=Name&Direction=Up">
                                    <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                </a>
                            </span>
                            <span>
                                <a href="index.php?Page=Stats&Action=TriggerEmails&SortBy=Name&Direction=Down">
                                    <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                </a>
                            </span>
                        </div>
                        {$lang.TriggerEmails_Manage_Column_TriggerName}
                    </td>

                    <td>
                        <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                            <span>
                                <a href="index.php?Page=Stats&Action=TriggerEmails&SortBy=TriggerType&Direction=Up">
                                    <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                </a>
                            </span>
                            <span>
                                <a href="index.php?Page=Stats&Action=TriggerEmails&SortBy=TriggerType&Direction=Down">
                                    <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                </a>
                            </span>
                        </div>
                        {$lang.TriggerEmails_Manage_Column_TriggeredBy}
                    </td>

                    <td>
                        <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                            <span>
                                <a href="index.php?Page=Stats&Action=TriggerEmails&SortBy=TriggerHours&Direction=Up">
                                    <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                </a>
                            </span>
                            <span>
                                <a href="index.php?Page=Stats&Action=TriggerEmails&SortBy=TriggerHours&Direction=Down">
                                    <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                </a>
                            </span>
                        </div>                    
                        {$lang.TriggerEmails_Manage_Column_TriggerHours}
                    </td>

                    <td>{$lang.Action}</td>
                </tr>
                {foreach from=$records item=each}
                {capture name=recordID}{$each.triggeremailsid|intval}{/capture}
            {capture name=statID}{$each.statid|intval}{/capture}
        {capture name=recordName}{$each.triggeremailsname|htmlspecialchars, ENT_QUOTES, SENDSTUDIO_CHARSET}{/capture}
        <tr class="GridRow">
            <td align="center">
                <label class="customCheckBox">
                    <input type="checkbox" class="UICheckboxToggleRows" value="{$recordID}:{$statID}" title="{$recordName}" />
                    <span class="checkmark"></span>
                </label
            </td>
            <td style="width: 40px;"><img src="images/Trigger_Statistics_Arrows.svg" style="width:20px;height:20px;" /></td>
            <td>{$recordName}</td>
            <td>
                {if $each.triggeremailstype == 'f'}
                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_CustomField}
                {elseif $each.triggeremailstype == 'n'}
                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_CampaignOpen}
                {elseif $each.triggeremailstype == 'l'}
                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_LinkClicked}
                {elseif $each.triggeremailstype == 's'}
                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_StaticDate}
                {else}
                    -
                {/if}
            </td>
            <td>
            {capture name=temp}{$each.triggeremailshours|abs}{/capture}
            {if $each.triggeremailshours == 0}
                {$lang.TriggerEmails_Manage_Column_TriggerDays_Immediate}
            {elseif $each.triggeremailshours == -1}
                {$lang.TriggerEmails_Manage_Column_TriggerDays_OneHourBefore}
            {elseif $each.triggeremailshours < -1}
                {$lang.TriggerEmails_Manage_Column_TriggerDays_HoursBefore|sprintf, $temp}
            {elseif $each.triggeremailshours == 1}
                {$lang.TriggerEmails_Manage_Column_TriggerDays_OneHourAfter}
            {elseif $each.triggeremailshours < 1}
                {$lang.TriggerEmails_Manage_Column_TriggerDays_HoursAfter|sprintf, $temp}
            {else}
                {$lang.N/A}
            {/if}
        </td>
        <td style="white-space:nowrap;">
            <div class="dropdown ml-1">
                <button class="btn p-0" type="button" id="dropdownMenuButton{$statsDetails.jobid}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
                </button>
                <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton{$statsDetails.jobid}" >
                        <a href="index.php?Page=Stats&Action=TriggerEmails&SubAction=view&id={$recordID}" class="dropdown-item" >{$lang.ViewSummary}</a>
                        <a href="remote_stats.php?height=420&width=420&overflow=none&statstype=t&Action=print&stats[]={$statID}&triggerid[]={$recordID}" class="thickbox dropdown-item" title="{$lang.TriggerEmails_Stats_Print}">{$lang.Print_Stats_Selected}</a>
                        <a href="index.php?Page=Stats&Action=TriggerEmails&SubAction=Delete&id={$statID}" title="{$lang.TriggerEmails_Stats_Delete}" class="StatsTriggerEmails_Row_Action_Delete dropdown-item">{$lang.Delete}</a>
                </div>
            </div>
        </td>
    </tr>
{/foreach}
</table>
{else}
    {* No records, not printing anything? *}
{/if}
</div>
</div>

<div class="Page_Footer">
    {* Bottom pagination -- Only print if records are available *}
{if count($records) != 0}{template="Paging_Bottom"}{/if}
</div>
</div>

<style>
#TB_window {
    top: 10% !important;
}
#TB_ajaxContent {
    height:auto !important;
    width:auto !important;
}
.Heading3 TD:nth-child(2) {
    padding: 0px 24px !important;
}
.GridRow td {
    word-break: break-all;
}
.form-control {
    height: 40px;
    width: 145px;
}
    .selectField{
        float:right;
        margin-top: 5.5px;
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
TR.GridRow TD:nth-child(2) {
    padding-top:16px;
}
#TB_window, .ui-window {
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
@media screen and (max-width:1024px){
    Heading3 TD:nth-child(2) {
    padding: 0px 22px;
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
}
@media screen and (max-width:568px){
    #TB_ajaxContent {
        height:auto !important;
    }
    #TB_window {
        top:10%;
        width: 533px !important;
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
        width:500px !important;
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
    .select-div {
        float: left !important;
        margin: 12px 0px 11px 1px;
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
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
}
@media screen and (max-width:411px){
    .select-div {
        float: left !important;
        margin: 12px 0px 11px 1px;
    }
    .Page_Contents {
        width: 700px;
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
    #TB_window {
        width: auto !important;
        margin-left: -190px !important;
    }
}
@media screen and (max-width:375px){
    .select-div {
        float: left !important;
        margin: 12px 0px 11px 1px;
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
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }

}
@media screen and (max-width:360px){
    .select-div {
        float: left !important;
        margin: 12px 0px 11px 1px;
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
    #TB_window {
        width: auto !important;
        margin-left: -170px !important;
    }
}
@media screen and (max-width:320px){
    .select-div
    {
        float: left !important;
        margin: 12px 0px 11px 1px;
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
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
}
.printChildLabel {
    width:77%;
}
.parentChildLabel {
    vertical-align:top;
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
    max-height: 400px !important;
    overflow-y: scroll !important;
    overflow-x: hidden !important;
}
</style>