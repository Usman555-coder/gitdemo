<script>
    Application.Page.NewslettersManage = {
        eventDOMReady: function (event) {
            Application.Ui.CheckboxSelection('table#NewsletterManageList',
                    'input.UICheckboxToggleSelector',
                    'input.UICheckboxToggleRows');
        }
    }

    Application.init.push(Application.Page.NewslettersManage.eventDOMReady);
</script>
<div class="parentTableDiv">
    <form name="ActionNewslettersForm" method="post" action="index.php?Page=Newsletters&Action=Change" onsubmit="return ConfirmChanges();" style="margin: 0px; padding: 0px;">
        <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
            <tr>
                <td class="Heading1 col-sm-4 Heading1New">%%LNG_NewslettersManage%%</td>
            </tr>
            <tr>
                <td class="body pageinfo internalAnchor" >
                    <p class="PageIntroP" >
                        %%LNG_Help_NewslettersManage%%%%GLOBAL_Newsletters_HasAccess%%
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    %%GLOBAL_Message%%
                </td>
            </tr>
            <tr>
                <td class="body">
                    <table width="100%" border="0">
                        <tr>
                            <td>
                                <div style=" float:left;padding-top:10px; padding-bottom:10px">
                                    %%GLOBAL_Newsletters_AddButton%%
                                    %%GLOBAL_Newsletters_ExtraButtons%%
                                </div>
                                <div class="selectField">
                                <select class="form-control ChangeTypeSelect" name="ChangeType" style="width:344px; display:inline-block; height:41px">
                                    <option value="" selected="selected">%%LNG_ChooseAction%%</option>
                                    %%GLOBAL_Option_DeleteNewsletter%%
                                    %%GLOBAL_Option_ArchiveNewsletter%%
                                    %%GLOBAL_Option_ActivateNewsletter%%
                                </select>
                                <input class="goButton" type="submit" name="cmdChangeType" value="%%LNG_Go%%" class="Text">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="thirdPartyTable">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%" style="" class="Text table" id="NewsletterManageList">
                            <tr class="Heading3">
                                <td nowrap align="center">
                                    <label class="customCheckBox">
                                        <input type="checkbox" name="toggle" class="UICheckboxToggleSelector" />
                                        <span class="checkmark"></span>
                                    </label>
                                </td>
                               <td>&nbsp;</td>
                                <td>
                                    <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Name&Direction=Up&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Name&Direction=Down&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                    </div>
                                    %%LNG_Name%%&nbsp;
                                </td>
                                <td>
                                    <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Subject&Direction=Up&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Subject&Direction=Down&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                    </div>
                                    %%LNG_Subject%%&nbsp;
                                </td>
                                <td>
                                    <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Date&Direction=Up&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Date&Direction=Down&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                    </div>
                                    %%LNG_Created%%&nbsp;
                                </td>
                                <td >
                                    %%LNG_LastSent%% &nbsp;
                                </td>
                                <td>
                                    <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Owner&Direction=Up&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                        <span>
                                            <a href='index.php?Page=%%PAGE%%&SortBy=Owner&Direction=Down&%%GLOBAL_SearchDetails%%'>
                                                <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                    </div>
                                    %%LNG_Owner%%&nbsp;
                                </td>
                                <td >
                                    <span class="HelpText" onMouseOut="HideHelp('active');" onMouseOver="ShowQuickHelp('active', '%%LNG_Active%%', '%%LNG_ActiveEmailCampaignHelp%%');">%%LNG_Active%%</span><br /><div style="font-weight:normal" id="active" style="display:none;" class="helptoolTipNewTh ActivehelpTooltip"></div>
                                </td>
                                <td >
                                    <span class="HelpText" onMouseOut="HideHelp('archive');" onMouseOver="ShowQuickHelp('archive', '%%LNG_Archive%%', '%%LNG_ArchiveHelp%%');">%%LNG_Archive%%</span><br /><div style="font-weight: normal" id="archive" style="display:none;" class="helptoolTipNewTh"></div>
                                </td>
                                <td >
                                    %%LNG_Action%%
                                </td>
                            </tr>
                            %%TPL_Newsletters_Manage_Row%%
                        </table>
                    </div>
                    &nbsp;
                    %%TPL_Paging%%
                </td>
            </tr>
        </table>
    </form>
</div>
<script>
    function ConfirmChanges() {
        formObj = document.ActionNewslettersForm;

        if (formObj.ChangeType.selectedIndex == 0) {
            alert("%%LNG_PleaseChooseAction%%");
            formObj.ChangeType.focus();
            return false;
        }

        selectedValue = formObj.ChangeType[formObj.ChangeType.selectedIndex].value;

        newsletters_found = 0;
        for (var i = 0; i < formObj.length; i++)
        {
            fldObj = formObj.elements[i];
            if (fldObj.type == 'checkbox')
            {
                if (fldObj.checked) {
                    newsletters_found++;
                    break;
                }
            }
        }

        if (newsletters_found <= 0) {
            alert("%%LNG_ChooseNewsletters%%");
            return false;
        }

        if (confirm("%%LNG_ConfirmChanges%%")) {
            return true;
        }

        return false;
    }

    function ConfirmDelete(NewsletterID) {
        if (!NewsletterID) {
            return false;
        }
        if (confirm("%%LNG_DeleteNewsletterPrompt%%")) {
            document.location = 'index.php?Page=%%PAGE%%&Action=Delete&id=' + NewsletterID;
            return true;
        }
    }
</script>

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
        padding-left:24px;
        padding-right:24px;
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
