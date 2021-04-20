<script>
    Application.Page.SubscribersBannedManage = {
        eventDOMReady: function (event) {
            Application.Ui.CheckboxSelection(
                'table#SubscribersBannedManageList',
                'input.UICheckboxToggleSelector',
                'input.UICheckboxToggleRows');
        }
    }
    Application.init.push(Application.Page.SubscribersBannedManage.eventDOMReady);
</script>
<div class="parentTableDiv">
<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">
            %%GLOBAL_SubscribersBannedManage%%
        </td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP">%%LNG_Manage_Banned_Intro%%</p>
        </td>
    </tr>
    <tr>
        <td>
            %%GLOBAL_Message%%
        </td>
    </tr>
    <tr>
        <td class=body height="10">
            %%GLOBAL_Subscribers_AddButton%%
        </td>
    </tr>
    <tr>
        <td class=body>
            <form name="bannedform" method="post" action="index.php?Page=Subscribers&Action=Banned&SubAction=Delete&list=%%GLOBAL_List%%" onsubmit="return DeleteSelectedBans(this);">
                <table width="100%" border="0" cellspacing="0">
                    <tr class="twoButtons">
                        <td valign="top">
                            <div style="padding-bottom:10px">
                                <input type="button" name="AddCustomFieldButton" value="%%LNG_BannedAddButton%%" class="SmallButton btn save-btn" style="width:16rem" onclick="javascript: document.location = 'index.php?Page=Subscribers&Action=Banned&SubAction=add';" />
                            </div>
                        </td>
                        <td valign="top" align="right">
                            <div style="padding-bottom:10px;padding-right: 10px;">
                                <input type="submit" name="DeleteBannedButton" value="%%LNG_Delete_Banned_Selected%%" class="SmallButton FormButton btn save-btn" style="width:8rem" />
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="thirdPartyTable">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text table" id="SubscribersBannedManageList">
                        <tr class="Heading3" >
                            <td nowrap align="center">
                                <label class="customCheckBox">
                                <input type="checkbox" name="toggle" class="UICheckboxToggleSelector">
                                <span class="checkmark"></span></label>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Subscribers&Action=Banned&SubAction=Step2&SortBy=EmailAddress&Direction=Up&list=%%GLOBAL_List%%'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Subscribers&Action=Banned&SubAction=Step2&SortBy=EmailAddress&Direction=Down&list=%%GLOBAL_List%%'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_BannedSubscriberEmail%%&nbsp;
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Subscribers&Action=Banned&SubAction=Step2&SortBy=BanDate&Direction=Up&list=%%GLOBAL_List%%'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Subscribers&Action=Banned&SubAction=Step2&SortBy=BanDate&Direction=Down&list=%%GLOBAL_List%%'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_BannedDate%%&nbsp;
                            </td>
                            <td>
                                %%LNG_Action%%
                            </td>
                        </tr>
                        %%TPL_Subscribers_Banned_Manage_Row%%
                    </table>
                </div>
                &nbsp;
                %%TPL_Paging%%
            </form>
        </td>
    </tr>
</table>
</div>
<script>
    function DeleteSelectedBans(formObj) {
        bans_found = 0;
        for (var i = 0; i < formObj.length; i++)
        {
            fldObj = formObj.elements[i];
            if (fldObj.type == 'checkbox')
            {
                if (fldObj.checked) {
                    bans_found++;
                    break;
                }
            }
        }
        if (bans_found <= 0) {
            alert("%%LNG_ChooseBannedSubscribers%%");
            return false;
        }
        if (confirm("%%LNG_ConfirmRemoveBannedSubscribers%%")) {
            return true;
        }
        return false;
    }

    function ConfirmDelete(EmailID) {
        var List = '%%GLOBAL_List%%';
        if (!EmailID) {
            return false;
        }
        if (confirm("%%LNG_DeleteBannedSubscriberPrompt%%")) {
            document.location = 'index.php?Page=Subscribers&Action=Banned&SubAction=Delete&list=' + List + '&id=' + EmailID;
            return true;
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
.BodyContainer {
    width: 98.7%;
    margin: 0 10px 10px 10px;
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
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 98.2 % !important;
        margin: 0 10px 10px 10px;
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
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 97.5% !important;
        margin: 0 10px 10px 10px;
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
        
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 97.5% ​!important;
        margin: 0 10px 10px 10px;
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
       
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 98.5% !important;
        margin: 0 10px 10px 10px;
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
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
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
      
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
    }
    .parentTableDiv{
        width:337px !important;
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
        margin: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
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
       
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
    }
    .parentTableDiv{
        width:292px !important;
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
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
        width: 93% !important;
        margin: 0 10px 10px 10px;
    }
    .parentTableDiv{
        width:270px !important;
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
}
</style>