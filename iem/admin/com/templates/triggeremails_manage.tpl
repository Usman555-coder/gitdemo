<script>
    Application.Page.TriggerEmailsManage = {
        eventDOMReady: function (event) {
            $(document.frmPageAction).submit(Application.Page.TriggerEmailsManage.eventSubmitBulkAction);

            if (document.frmPageAction.cmdAddList)
                $(document.frmPageAction.cmdAddList).click(Application.Page.TriggerEmailsManage.eventAddList);

            if (document.frmPageAction.cmdAddNewsletter)
                $(document.frmPageAction.cmdAddNewsletter).click(Application.Page.TriggerEmailsManage.eventAddNewsletter);

            if (document.frmPageAction.cmdAddTrigger)
                $(document.frmPageAction.cmdAddTrigger).click(Application.Page.TriggerEmailsManage.eventAddTrigger);

            if ($('#triggeremails_record_list').size() != 0) {
                Application.Ui.CheckboxSelection('table#triggeremails_record_list',
                        'input.UICheckboxToggleSelector',
                        'input.UICheckboxToggleRows');

                $('#triggeremails_record_list .TriggerEmails_Row_Action_DisableTrigger'
                        + ', #triggeremails_record_list .TriggerEmails_Row_Action_EnableTrigger'
                        + ', #triggeremails_record_list .TriggerEmails_Row_Action_Delete'
                        + ', #triggeremails_record_list .TriggerEmails_Row_Action_Copy').click(Application.Page.TriggerEmailsManage.eventActionRow);
            }
        },

        eventAddList: function (event) {
            document.location.href = 'index.php?Page=Lists&Action=Create';
        },

        eventAddNewsletter: function (event) {
            document.location.href = 'index.php?Page=Newsletters&Action=Create';
        },

        eventAddTrigger: function (event) {
            document.location.href = 'index.php?Page=TriggerEmails&Action=Create';
        },

        eventActionRow: function (event) {
            event.stopPropagation();
            event.preventDefault();

            var id = this.href.match(/id=(\d+)$/)[1];
            var url = this.href.replace(/&{0,1}id=(\d+)$/, '');
            var action = this.href.match(/Action=(\w+)/)[1];

            if (action == 'Delete') {
                if (!confirm('{$lang.TriggerEmails_Manage_PromptDelete_One}'))
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
            var selectedRows = $('#triggeremails_record_list input.UICheckboxToggleRows').filter(':checked');
            var action = $(this.ChangeType).val();
            for (var i = 0, j = selectedRows.size(); i < j; ++i)
                selectedIDs.push(selectedRows.get(i).value);

            if (selectedIDs.length == 0) {
                alert("{$lang.TriggerEmails_Manage_PromptChoose}");
                return false;
            }

            if (action == 'delete') {
                if (!confirm('{$lang.TriggerEmails_Manage_PromptDelete}'))
                    return;
            }

            Application.Util.submitPost(this.action, {'Which': action,
                'IDs': selectedIDs});
        }
    };

    Application.init.push(Application.Page.TriggerEmailsManage.eventDOMReady);
</script>
<div class="PageBodyContainer">
    <div class="Page_Header">
        <div class="Heading1 col-sm-4 Heading1New">{$lang.TriggerEmails_Manage}</div>
        <div class="body pageinfo internalAnchor"><p class="PageIntroP">{$lang.TriggerEmails_Intro}<p></div>
        {if trim($PAGE.messages) != ''}
            <div>{$PAGE.messages}</div>
        {/if}
        <div class="Page_Action" {if trim($PAGE.messages) != ''} style="margin-top: 15px !important;"{/if}>
            <div style="{if trim($PAGE.messages) == ''}padding-top: 10px;{/if} padding-bottom: 10px;float:left; padding-top: 5px;">
                {* Contact Lists and Campaigns are available, print the "Add Trigger" button *}
                {if $listCount != 0 && $newsletterCount != 0}
                    {if $permissions.create}
                        <form name="frmCreateTrigger" action="index.php" method="GET">
                            <input type="hidden" name="Page" value="TriggerEmails" />
                            <input type="hidden" name="Action" value="Create" />
                            <input type="submit" value="{$lang.TriggerEmails_Manage_AddButton}" class="SmallButton FormButton SaveAddButton btn save-btn SubmitButton" style="width:auto;" />
                        </form>
                    {/if}
                    {* Either/Both Contact Lists and Campaigns are NOT available, print buttons for these if user have the correct permissions *}
                {else}
                    {if $listCount == 0 && $permissions.createList}
                        <form name="frmCreateList" action="index.php" method="GET">
                            <input type="hidden" name="Page" value="Lists" />
                            <input type="hidden" name="Action" value="Create" />
                            <input type="submit" value="{$lang.TriggerEmails_Manage_AddListButton}" class="SmallButton FormButton SaveAddButton btn save-btn SubmitButton"  style="width:auto;" />
                        </form>
                    {/if}
                    <br />
                    {if $newsletterCount == 0 && $permissions.createNewsletter}
                        <form name="frmCreateNewsletter" action="index.php" method="GET">
                            <input type="hidden" name="Page" value="Newsletters" />
                            <input type="hidden" name="Action" value="Create" />
                            <input type="submit" value="{$lang.TriggerEmails_Manage_AddCampaignButton}" class="SmallButton FormButton SaveAddButton btn save-btn SubmitButton"  style="width:auto;" />
                        </form>
                    {/if}
                {/if}
            </div>
            <form name="frmPageAction" action="index.php?Page=TriggerEmails&Action=BulkAction">
                <div class="Page_Action_Top"></div>
                {* Bulk Action and pagination -- Only print if records are available *}
                {if count($records) != 0}
                    {* ----- Bulk Action ----- *}
                    <div class="chooseAction">
                        <select name="ChangeType" class="form-control selectBoxTrigger ">
                            <option value="" selected="selected">{$lang.ChooseAction}</option>
                            {if $permissions.delete}<option value="delete">{$lang.TriggerEmails_Manage_BulkAction_Delete}</option>{/if}
                            {if $permissions.activate}
                                <option value="activate">{$lang.TriggerEmails_Manage_BulkAction_Activate}</option>
                                <option value="deactivate">{$lang.TriggerEmails_Manage_BulkAction_Deactivate}</option>
                            {/if}
                        </select>
                        <input type="submit" name="cmdChangeType" class="goButton" value="{$lang.Go}" />
                    </div>
                    {* ----- *}
                {/if}
                <div class="Page_Action_Bottom"></div>
            </form>
        </div>
    </div>
    <div class="Page_Contents">
        {if count($records) != 0}
            {* Tabular records *}
            <div class="thirdPartyTable">
                <table id="triggeremails_record_list" border="0" cellspacing="0" cellpadding="2" width="100%" class="table">
                    <tr class="Heading3">
                        <td align="center">
                            <label class="customCheckBox">
                                <input type="checkbox" class="UICheckboxToggleSelector" />
                                <span class="checkmark"></span>
                            </label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=Name&Direction=Up">
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=Name&Direction=Down">
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            {$lang.TriggerEmails_Manage_Column_TriggerName}
                        </td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=CreateDate&Direction=Up">
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=CreateDate&Direction=Down">
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            {$lang.TriggerEmails_Manage_Column_CreateDate}
                        </td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=TriggerType&Direction=Up">
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=TriggerType&Direction=Down">
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            {$lang.TriggerEmails_Manage_Column_TriggeredBy}
                        </td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=TriggerHours&Direction=Up">
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=TriggerHours&Direction=Down">
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            {$lang.TriggerEmails_Manage_Column_TriggerHours}
                        </td>
                        <td align="center">
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-75px";">
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=Active&Direction=Up">
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href="index.php?Page=TriggerEmails&SortBy=Active&Direction=Down">
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            {$lang.TriggerEmails_Manage_Column_Status}
                        </td>
                        <td align="center">{$lang.Action}</td>
                    </tr>
                    {foreach from=$records item=each}
                        {capture name=recordID}{$each.triggeremailsid|intval}{/capture}
                        {capture name=recordName}{$each.name|htmlspecialchars, ENT_QUOTES, SENDSTUDIO_CHARSET}{/capture}
                        <tr class="GridRow">
                            <td align="center">
                                <label class="customCheckBox">
                                    <input type="checkbox" class="UICheckboxToggleRows" value="{$recordID}" title="{$recordName}" />
                                    <span class="checkmark"></span>
                                </label>
                            </td>
                            <td><img src="images/m_triggeremails.gif" /></td>
                            <td>{$recordName}</td>
                            <td>{$each.procstr_createdate}</td>
                            <td>
                                {if $each.triggertype == 'f'}
                                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_CustomField}
                                {elseif $each.triggertype == 'n'}
                                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_CampaignOpen}
                                {elseif $each.triggertype == 'l'}
                                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_LinkClicked}
                                {elseif $each.triggertype == 's'}
                                    {$lang.TriggerEmails_Manage_Column_TriggeredBy_StaticDate}
                                {else}
                                    -
                                {/if}
                            </td>
                            <td>
                                {capture name=temp}{$each.triggerhours|abs}{/capture}
                                {if $each.triggerhours == 0}
                                    {$lang.TriggerEmails_Manage_Column_TriggerDays_Immediate}
                                {elseif $each.triggerhours == -1}
                                    {$lang.TriggerEmails_Manage_Column_TriggerDays_OneHourBefore}
                                {elseif $each.triggerhours < -1}
                                    {$lang.TriggerEmails_Manage_Column_TriggerDays_HoursBefore|sprintf, $temp}
                                {elseif $each.triggerhours == 1}
                                    {$lang.TriggerEmails_Manage_Column_TriggerDays_OneHourAfter}
                                {elseif $each.triggerhours > 1}
                                    {$lang.TriggerEmails_Manage_Column_TriggerDays_HoursAfter|sprintf, $temp}
                                {else}
                                    {$lang.N/A}
                                {/if}
                            </td>
                            <td align="center">
                                {if $each.active == 1}
                                    {if $permissions.activate}<a href="index.php?Page=TriggerEmails&Action=Disable&id={$recordID}" class="TriggerEmails_Row_Action_DisableTrigger" title="{$lang.TriggerEmails_Manage_Tips_DisableTrigger}">{/if}
                                        <img src="images/tick.gif" alt="{$lang.Status_Active}" alt="{$lang.TriggerEmails_Manage_Tips_DisableTrigger}" border="0" />
                                        {if $permissions.activate}</a>{/if}
                                    {else}
                                        {if $permissions.activate}<a href="index.php?Page=TriggerEmails&Action=Enable&id={$recordID}" class="TriggerEmails_Row_Action_EnableTrigger" title="{$lang.TriggerEmails_Manage_Tips_EnableTrigger}">{/if}
                                        <img src="images/cross.gif" alt="{$lang.Status_Inactive}" alt="{$lang.TriggerEmails_Manage_Tips_EnableTrigger}" border="0" />
                                        {if $permissions.activate}</a>{/if}
                                {/if}
                            </td>
                            <td align="center">
                                <div class="dropdown ml-1">
                                    <button class="btn p-0" type="button" id="dropdownMenuButton{$recordID}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
                                    </button>
                                    <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton{$recordID}" >
                                        {if $permissions.edit}<a style="padding: 0.25rem 1.5rem; display:block;" href="index.php?Page=TriggerEmails&Action=Edit&id={$recordID}">{$lang.Edit}</a>{/if}
                                        {if $permissions.create}<a style="padding: 0.25rem 1.5rem; display:block;" href="index.php?Page=TriggerEmails&Action=Copy&id={$recordID}" class="TriggerEmails_Row_Action_Copy">{$lang.Copy}</a>{/if}
                                        {if $permissions.delete}<a style="padding: 0.25rem 1.5rem; display:block;" href="index.php?Page=TriggerEmails&Action=Delete&id={$recordID}" class="TriggerEmails_Row_Action_Delete">{$lang.Delete}</a>{/if}
                                    </div>
                                </div>
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
        {/if}
    </div>
    <div class="Page_Footer">
        {* Bottom pagination -- Only print if records are available *}
        {if count($records) != 0}{template="Paging_Bottom"}{/if}
    </div>
</div>
<style>
.infoTipNewCustom {
    margin-top:0px !important;
}
.selectBoxTrigger {
    width: 250px;
    display:inline;
    height:40px;
}
.Page_Header {
    padding-bottom: 25px;
}
.PageBodyContainer {
    padding-bottom: 20px;
}
.chooseAction {
    float:right;
    padding-bottom: 10px;
}
</style>
<style>
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
.nextCancelButton {
    margin-top:11.5%;
} 
.ISSelectDiv{
    height:150px !important;
    width:450px !important;
}
.submitTableBtn{
    width:180px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:-2px;
}
.FieldLabel{
    color:#000;
}
input.ISSelectSearch {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.form-control {
    display:inline;
}
#triggeremails_record_list Td .customCheckBox {
    width:auto !important;
}
#triggeremails_record_list Td:nth-child(2) {
    width:40px !important;
    vertical-align:middle !important;
}
#triggeremails_record_list Td:nth-child(3) {
    word-break:break-word !important;
}
#triggeremails_record_list Td:nth-child(4) {
    width:110px !important;
}
@media screen and (max-width:1024px){
    .multiselectTd{
        display:inline;
    }
    .form-control {
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:410px !important;
        overflow-x: auto;
        margin-top: 10px;
    }
    .nextCancelButton {
        margin-top:0%;
    } 
    .HelpToolTipDiv{
        margin-left:10px !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:410px;
    }
    .customCheckBox {
        width:405px;
        margin-left:0px;
    }
    .submitTableBtn{
        width:182px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -130px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:11px;
        margin-left:2px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    input.ISSelectSearch {
        width:410px;
    }
    .width20Percent{
        width:13em !important;
    }
    .Field250{
        width:410px;
        margin-right:0px;
    }
    .Field350 {
        width:410px !important;
        padding-right:0px;
    }
    #triggeremails_record_list Td:nth-child(4) {
        width:110px !important;
    }
}
@media screen and (max-width:823px){
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:400px !important;
        overflow-x: scroll;
    }
    .nextCancelButton {
        margin-top:0%
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:180px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    input.ISSelectSearch {
        width:400px;
    }
    .width20Percent{
        width:13em !important;
    }
}
@media screen and (max-width:768px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:320px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:320px;
    }
    .submitTableBtn{
        width:168px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:12em !important;
        padding-top: 20px;
    }
    .Field250 {
        width:320px !important;
        margin-right:5px;
    }
    .Field350 {
        width:320px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    }
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .table {
        width: 900px;
    }
    .thirdPartyTable {
        overflow-x: scroll;
        width:725px;
    }
}
@media screen and (max-width:568px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:210px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:210px;
    }
    .submitTableBtn{
        width:156px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:12em !important;
        padding-top: 20px;
    }
    .Field250 {
        width:210px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    }
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    }
    .BodyContainer {
        width: 98%;
        margin: 0px 5px 0px 3px;
    }
    .thirdPartyTable {
        width:100%;
        overflow-x:auto;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .selectBoxTrigger {
        width: 216px;
    }
    .chooseAction {
        float:left;
        padding-bottom: 10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:414px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:210px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:210px;
    }
    .submitTableBtn{
        width:156px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:12em !important;
        padding-top: 20px;
    }
    .Field250 {
        width:210px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    }
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    }
    .BodyContainer {
        width: 98%;
        margin: 0px 5px 0px 3px;
    }
    .thirdPartyTable {
        width:100%;
        overflow-x:auto;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .selectBoxTrigger {
        width: 216px;
    }
    .chooseAction {
        float:left;
        padding-bottom: 10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:411px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:185px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:185px;
    }
    .submitTableBtn{
        width:135px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:12em !important;
        padding-top: 20px;
    }
    .Field250 {
        width:185px !important;
    }
    .Field350 {
        width:185px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    }
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    }
    .BodyContainer {
        width: 98%;
        margin: 0px 5px 0px 3px;
    }
    .thirdPartyTable {
        width:100%;
        overflow-x:auto;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .selectBoxTrigger {
        width: 216px;
    }
    .chooseAction {
        float:left;
        padding-bottom: 10px;
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
    .customRadio {
        padding-bottom:3px;
        width:180px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:156px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:12em !important;
        padding-top: 20px;
    }
    .Field250 {
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    }
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    }
    .BodyContainer {
        width: 98%;
        margin: 0px 5px 0px 3px;
    }
    .thirdPartyTable {
        width:100%;
        overflow-x:auto;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .selectBoxTrigger {
        width: 216px;
    }
    .chooseAction {
        float:left;
        padding-bottom: 10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:200px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:200px;
    }
    .submitTableBtn{
        width:98px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    }
    .BodyContainer {
        width: 98%;
        margin: 0px 5px 0px 3px;
    }
    .thirdPartyTable {
        width:100%;
        overflow-x:auto;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .selectBoxTrigger {
        width: 240px;
    }
    .chooseAction {
        float:left;
        padding-bottom: 10px;
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
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:89px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .Field250 {
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    }
    .BodyContainer {
        width: 98%;
        margin: 0px 5px 0px 3px;
    }
    .thirdPartyTable {
        width:100%;
        overflow-x:auto;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .selectBoxTrigger {
        width: 216px;
    }
    .chooseAction {
        float:left;
        padding-bottom: 10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
</style>
<style>
input.ISSelectSearch {
	margin-top: 15px;
	 display: initial;
	 font-size: 14px;
	 padding: 0 10px;
}
</style>