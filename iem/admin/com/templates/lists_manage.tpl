<script src="includes/js/jquery/interface.js"></script>
<script src="includes/js/jquery/inestedsortable.js"></script>
<script>
    Application.Page.ListsManage = {

        updatingSortables: false,
        updateTimeout: null,

        eventDOMReady: function (event) {
            var mode = '%%GLOBAL_Mode%%';
            if (mode == 'Folder') {
                Application.Ui.Folders.CreateSortableList('l');
            }
            Application.Ui.CheckboxSelection('table#SubscriberListManageList',
                    'input.UICheckboxToggleSelector',
                    'input.UICheckboxToggleRows');
        }
    }

    Application.init.push(Application.Page.ListsManage.eventDOMReady);

</script>
<table cellspacing="0" cellpadding="0" align="center" width="100%">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New" style="margin-top:14px">%%LNG_ListsManage%%</td>
    </tr>
    <tr>
        <td class="Intro pageinfo"><p>%%LNG_Help_ListsManage%%</p></td>
    </tr>
    <tr>
        <td style="font-size:14px;color: #212529; border-bottom: 1px solid rgba(204, 204, 204, 0.35);">
            %%GLOBAL_Message%%
        </td>
    </tr>
    <tr>
        <td class="body">
            <span class="body">%%GLOBAL_ListsReport%%</span>
            <form name="ActionListsForm" method="post" action="index.php?Page=Lists&Action=Change" onsubmit="return ConfirmChanges();" style="margin-top:20px;padding: 0px;">
                <table width="100%" border="0">
                    <tr>
                        <td valign="bottom">
                            %%GLOBAL_Lists_AddButton%%
                            <br />
                            <div class="mt-3 optionsList">
                            <select class="form-control Field350" name="ChangeType">
                                <option value="" SELECTED>%%LNG_ChooseAction%%</option>
                                %%GLOBAL_Option_DeleteList%%
                                %%GLOBAL_Option_DeleteSubscribers%%
                                <option value="ChangeFormat_Text">%%LNG_ChangeFormat_Text%%</option>
                                <option value="ChangeFormat_HTML">%%LNG_ChangeFormat_HTML%%</option>
                                <option value="ChangeStatus_Confirm">%%LNG_ChangeStatus_Confirm%%</option>
                                <option value="ChangeStatus_Unconfirm">%%LNG_ChangeStatus_Unconfirm%%</option>
                                <option value="MergeLists">%%LNG_MergeLists%%</option>
                            </select>
                            
                            <input style="height: 35px;" class="goButton" type="submit" name="cmdChangeType" value="%%LNG_Go%%" class="Text">
                            {template="folder_viewpicker"}
                            </div>
                        </td>
                        
                    </tr>
                </table>

                <div class="thirdPartyTable">
                    <table border="0" cellspacing="0" cellpadding="0" class="Text mt-3 tableRows" id="SubscriberListManageList">
                        <tr class="Heading3">
                            <td width="30" style="padding-left:0px" nowrap align="center">
                                <label class="customCheckBox mmleft">
                                <input type="checkbox" name="toggle" class="UICheckboxToggleSelector">
                                <span class="checkmark"></span>
                                </label>
                            </td>
                            <td width="44" nowrap="nowrap"><img src="images/blank.gif" width="44" height="1" /></td>
                            <td class="rtb-head-one">
                            <span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=Name&Direction=Up&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-up position-absolute" style="bottom: 6px;color: #d5d5d5;margin-left:-14px;margin-bottom: 2px" aria-hidden="true"></i></a></span><span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=Name&Direction=Down&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-down position-absolute" style="bottom: -1px;color: #d5d5d5;margin-left:-14px ; margin-bottom: 2px" aria-hidden="true"></i></a></span>%%LNG_ListName%%&nbsp;
                            </td>
                            <td class="rtb-head-two">
                                <span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=Date&Direction=Up&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-up position-absolute" style="bottom: 6px;color: #d5d5d5;margin-left:-10px;margin-bottom: 2px" aria-hidden="true"></i></a></span>&nbsp;<span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=Date&Direction=Down&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-down position-absolute" style="bottom: -1px;color: #d5d5d5;margin-left:-14px ;margin-bottom: 2px" aria-hidden="true"></i></a></span>%%LNG_Created%%&nbsp;
                            </td>
                            <td class="rtb-head-three">
                            <span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=Subscribers&Direction=Up&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-up position-absolute" style="bottom: 6px;color: #d5d5d5;margin-left:-10px;margin-bottom: 2px" aria-hidden="true"></i></a></span>&nbsp;<span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=Subscribers&Direction=Down&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-down position-absolute" style="bottom: -1px;color: #d5d5d5;margin-left:-14px;margin-bottom: 2px" aria-hidden="true"></i></a></span>%%LNG_Subscribers%%&nbsp;
                            </td>
                            <td class="rtb-head-four">
                                <span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=fullname&Direction=Up&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-up position-absolute" style="bottom: 6px;color: #d5d5d5;margin-left:-10px;margin-bottom: 2px" aria-hidden="true"></i></a></span>&nbsp;<span style="position:relative"><a href='index.php?Page=%%PAGE%%&SortBy=fullname&Direction=Down&%%GLOBAL_SearchDetails%%'><i class="fa fa-caret-down position-absolute" style="bottom: -1px;color: #d5d5d5;margin-left:-14px;margin-bottom: 2px" aria-hidden="true"></i></a></span>%%LNG_ListOwner%%&nbsp;
                            </td>
                            <td class="rtb-head-five">
                                %%LNG_ArchiveLists%%
                            </td>
                            <td class="rtb-head-six">
                                %%LNG_Action%%
                            </td>
                        </tr>
                    </table>
                    <div id="PlaceholderParent" style="margin:0; padding:0;" class="tableRows">
                        <ul id="PlaceholderSortable" class="SortableList Folder SortableList Folder">
                            %%TPL_Lists_Manage_Row%%
                        </ul>
                    </div>
                </div>
            </form>

            %%TPL_Paging_Bottom%%

        </td>                    
    </tr>
</table>
<table style="width:100%">
<tr style="d-flex justify-content-between align-items-center pagingNew">
 <td align="right" valign="bottom">
                            %%TPL_Paging%%
    </td>
  </tr>                      
</table>

<script>

    function closePopup() {
        tb_remove();
    }

    function ConfirmDelete(ListID) {
        if (!ListID) {
            return false;
        }
        if (confirm("%%LNG_DeleteListPrompt%%")) {
            document.location = 'index.php?Page=%%PAGE%%&Action=Delete&id=' + ListID;
            return true;
        }
    }

    function ConfirmDeleteAllSubscribers(ListID) {
        if (!ListID) {
            return false;
        }
        if (confirm("%%LNG_DeleteAllSubscribersPrompt%%")) {
            document.location = 'index.php?Page=%%PAGE%%&Action=DeleteAllSubscribers&id=' + ListID;
            return true;
        }
    }

    function ConfirmChanges() {
        formObj = document.ActionListsForm;

        if (formObj.ChangeType.selectedIndex == 0) {
            alert("%%LNG_PleaseChooseAction%%");
            formObj.ChangeType.focus();
            return false;
        }

        selectedValue = formObj.ChangeType[formObj.ChangeType.selectedIndex].value;

        lists_found = 0;
        for (var i = 0; i < formObj.length; i++)
        {
            fldObj = formObj.elements[i];
            if (fldObj.type == 'checkbox')
            {
                if (fldObj.checked) {
                    lists_found++;
                    // check for more than 2 lists found already
                    // as merging lists together requires more than one being selected.
                    if (lists_found > 2) {
                        break;
                    }
                }
            }
        }

        if (lists_found <= 0) {
            alert("%%LNG_ChooseList%%");
            return false;
        }

        if (selectedValue == 'MergeLists') {
            if (lists_found < 2) {
                alert("%%LNG_ChooseMultipleLists%%");
                return false;
            }
        }

        if (confirm("%%LNG_ConfirmChanges%%")) {
            return true;
        }

        return false;
    }

</script>
<style>
.mmleft {
    margin-left: 5px;
}
td.rtb-head-one {
    width: 28%;
}
td.rtb-head-two {
    width: 13%;
}
td.rtb-head-three {
    width: 13%;
}
td.rtb-head-four {
    width: 21%;
}
td.rtb-head-five {
    width: 9%;
}

.thirdPartyTable ul li:nth-child(2n+1) {
   background-color: #fbfbfb;
}

.tableRows {
    width:100%;
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
.optionsList{
        display:flex;
        
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
.BodyContainer {
    width: 98.5%;
    margin: 0px 10px 10px;
}
TR.GridRow TD {
    word-break:break-word;
}
#TB_window {
    top:0;
    margin-top:210px;
    height: 190px;
    width: 298px !important;
    margin-left:-170px !important;
}
#TB_iframeContent{
    width:290px !important;
    height:140px !important;
}
@media screen and (max-width:1024px){
    .tableRows {
        width:920px !important;
    }
    .thirdPartyTable {
        width: 920px !important;
        overflow-x: auto !important;
    }
    .optionsList{
        display:flex;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 98.5%;
        margin: 0px 10px 10px 7px;
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
    .pagingNew {
        //flex-direction: column !important;
        //padding:10px 0px;
        //align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .paginationTable {
        width:100% !important;
    }
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
    }
}
@media screen and (max-width:823px){
    .thirdPartyTable {
    width: 720px !important;
    overflow-x: scroll !important;
     }
     .optionsList{
        display:flex;
        flex-wrap:wrap;
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
        margin:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
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
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
    }
}
@media screen and (max-width:768px){
    .thirdPartyTable {
     width: 720px !important; 
     overflow-x: scroll !important; 
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
        margin:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
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
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
    }
}
@media screen and (max-width:568px){
    .thirdPartyTable {
        width: 375px !important; 
        overflow-x: scroll !important; 
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
        margin:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
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
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
    }
}
@media screen and (max-width:414px){
     .thirdPartyTable {
     width: 375px !important; 
     overflow-x: scroll !important; 
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
        margin:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
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
    .folderIcons {
        margin-top: 20px;
    }
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
    }
}
@media screen and (max-width:411px){
   .thirdPartyTable {
        width: 335px !important; 
        overflow-x: scroll !important; 
    }
     .optionsList{
        display:flex;
        flex-wrap:wrap;
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
        margin:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
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
    .folderIcons {
        margin-top: 20px;
    }
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
    }
}
@media screen and (max-width:375px){
    .thirdPartyTable {
        width: 335px !important; 
        overflow-x: scroll !important; 
    }
     .optionsList{
        display:flex;
        flex-wrap:wrap;
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
        margin:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
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
    .folderIcons {
        margin-top: 20px;
    }
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
    }
}
@media screen and (max-width:360px){
    .thirdPartyTable {
        width: 295px !important; 
        overflow-x: scroll !important;
    }
    .optionsList{
        display: block;
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
        margin:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 10px;
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
    .folderIcons {
        margin-top: 20px;
    }
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
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
        margin:0px
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
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
    .folderIcons {
        margin-top: 20px;
    }
    #TB_window {
        margin-left: -150px !important;
        width: 298px !important;
        height: 190px;
    }
    #TB_iframeContent{
        width:290px !important;
        height:140px !important;
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