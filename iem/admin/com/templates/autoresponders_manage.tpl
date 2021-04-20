<script>
    Application.Page.AutoresponderManage = {
        eventDOMReady: function (event) {
            Application.Ui.CheckboxSelection('table#AutoresponderManageList',
                    'input.UICheckboxToggleSelector',
                    'input.UICheckboxToggleRows');

            $(document.ActionAutorespondersForm.cmdChangeType).click(Application.Page.AutoresponderManage.eventChangeType);
        },

        eventChangeType: function (event) {
            if ($(document.ActionAutorespondersForm.ChangeType).val() == '') {
                alert('{$lang.PleaseChooseAction}');
                event.stopPropagation();
                event.preventDefault();
                return;
            }

            if ($('input.UICheckboxToggleRows:checked').size() == 0) {
                alert('{$lang.ChooseAutoresponders}');
                event.stopPropagation();
                event.preventDefault();
                return;
            }
        }
    }
    Application.init.push(Application.Page.AutoresponderManage.eventDOMReady);
</script>
<div class="parentTableDiv">
<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">
            %%LNG_AutorespondersManage%%
        </td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP">%%LNG_Help_AutorespondersManage%%</p>
        </td>
    </tr>
    <tr>
        <td>%%GLOBAL_Message%%</td>
    </tr>
    <tr>
        <td>%%GLOBAL_CronWarning%%</td>
    </tr>
    <tr>
        <td class="body">
            <table width="100%" border="0" style="margin-top: 10px;">
                <tr>
                    <td valign="bottom">
                        <div class="shiftLeft">
                            %%GLOBAL_Autoresponders_AddButton%%
                        </div>
                        <form name="ActionAutorespondersForm" method="post" action="index.php?Page=Autoresponders&Action=Change&list=%%GLOBAL_List%%" onsubmit="return ConfirmChanges();" style="margin: 0px; padding: 0px;">
                            <div class="shiftRight">
                            <select name="ChangeType" class="form-control ChangeTypeSelect" style="width:344px; height:41px">
                                <option value="" selected="selected">%%LNG_ChooseAction%%</option>
                                %%GLOBAL_Option_DeleteAutoresponder%%
                                %%GLOBAL_Option_ActivateAutoresponder%%
                            </select>
                            <input type="submit" name="cmdChangeType" value="%%LNG_Go%%" class="goButton" />
                            </div>
                    </td>
                </tr>
            </table>
            <div class="thirdPartyTable">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text table" id="AutoresponderManageList">
                    <tr class="Heading3">
                        <td align="center">
                            <label class="customCheckBox">
                                <input type="checkbox" name="toggle" class="UICheckboxToggleSelector">
                                <span class="checkmark"></span>
                            </label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Name&Direction=Up'>
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Name&Direction=Down'>
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            %%LNG_Name%%
                        </td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Date&Direction=Up'>
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Date&Direction=Down'>
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            %%LNG_Created%%
                        </td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Hours&Direction=Up'>
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Hours&Direction=Down'>
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            %%LNG_SentWhen%%
                        </td>
                        <td>
                            <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Owner&Direction=Up'>
                                        <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                                <span>
                                    <a href='index.php?Page=%%GLOBAL_PAGE%%&SortBy=Owner&Direction=Down'>
                                        <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                    </a>
                                </span>
                            </div>
                            %%LNG_Owner%%
                        </td>
                        <td align="center">
                            %%LNG_Active%%
                        </td>
                        <td align="center">
                            %%LNG_Action%%
                        </td>
                    </tr>
                    %%TPL_Autoresponders_Manage_Row%%
                </table>
            </div>
            &nbsp;
            %%TPL_Paging%%
        </td>
    </tr>
</table>
</div>
<script>
    function ConfirmChanges() {
        formObj = document.ActionAutorespondersForm;
        if (formObj.ChangeType.selectedIndex == 0) {
            alert("%%LNG_PleaseChooseAction%%");
            formObj.ChangeType.focus();
            return false;
        }
        selectedValue = formObj.ChangeType[formObj.ChangeType.selectedIndex].value;
        autos_found = 0;
        for (var i = 0; i < formObj.length; i++) {
            fldObj = formObj.elements[i];
            if (fldObj.type == 'checkbox') {
                if (fldObj.checked) {
                    autos_found++;
                    break;
                }
            }
        }
        if (autos_found <= 0) {
            alert("%%LNG_ChooseAutoresponders%%");
            return false;
        }
        if (confirm("%%LNG_ConfirmChanges%%")) {
            return true;
        }
        return false;
    }
    function ConfirmDelete(AutoresponderID) {
        if (!AutoresponderID) {
            return false;
        }
        if (confirm("%%LNG_DeleteAutoresponderPrompt%%")) {
            document.location = 'index.php?Page=%%PAGE%%&Action=Delete&list=%%GLOBAL_list%%&id=' + AutoresponderID;
        }
    }
</script>
<style>
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.shiftLeft {
    padding-top:10px; padding-bottom:10px; float:left;
}
.shiftRight {
    float:right;padding-top: 5.5px;
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
.BodyContainer{
    width:98%;
    margin:10px 10px 10px 7px;
}
@media screen and (max-width:1024px){
    .shiftLeft {
        padding-top:10px; padding-bottom:10px; float:left;
    }
    .shiftRight {
        float:right;padding-top: 5.5px;
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
    .ChangeTypeSelect {
        width:150px !important;
    }
    .BodyContainer{
        width:98%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:925px !important;
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
    .shiftLeft {
        padding-top:10px; padding-bottom:10px; float:left;
    }
    .shiftRight {
        float:right;padding-top: 5.5px;
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
    .ChangeTypeSelect {
        width:150px !important;
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
    .shiftLeft {
        padding-top:10px; padding-bottom:10px; float:left;
    }
    .shiftRight {
        float:right;padding-top: 5.5px;
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
    .ChangeTypeSelect {
        width:150px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:705px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:710px !important;
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
    .shiftLeft {
        padding-top:10px; padding-bottom:10px; float:left;
    }
    .shiftRight {
        float:right;padding-top: 5.5px;
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
    .ChangeTypeSelect {
        width:70px !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:414px){
    .shiftLeft {
        float:left; padding-top: 0px; padding-bottom:10px;
    }
    .shiftRight {
        float:left; padding-bottom: 10px;
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
    .ChangeTypeSelect {
        width:150px !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:411px){
    .shiftLeft {
        float:left; padding-top: 0px; padding-bottom:10px;
    }
    .shiftRight {
        float:left; padding-bottom: 10px;
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
    .ChangeTypeSelect {
        width:150px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:335px !important;
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
    .shiftLeft {
        float:left; padding-top: 0px; padding-bottom:10px;
    }
    .shiftRight {
        float:left; padding-bottom: 10px;
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
    .ChangeTypeSelect {
        width:150px !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:360px){
    .shiftLeft {
        float:left; padding-top: 0px; padding-bottom:10px;
    }
    .shiftRight {
        float:left; padding-bottom: 10px;
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
    .ChangeTypeSelect {
        width:150px !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:320px){
    .shiftLeft {
        float:left; padding-top: 0px; padding-bottom:10px;
    }
    .shiftRight {
        float:left; padding-bottom: 10px;
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
    .ChangeTypeSelect {
        width:150px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:265px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:260px !important;
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
</style>
