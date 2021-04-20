<script>
    Application.Page.Subscriber_Manage = {
        _defaultIntroText: '%%LNG_SubscriberQuickSearch_Description%%',
        _stateIntro: false,

        _displayIntro: function () {
            var elm = document.ActionSearchContacts.emailaddress;
            if (elm.value.trim() == '') {
                $(elm).css('color', '#999999');
                elm.value = Application.Page.Subscriber_Manage._defaultIntroText;
                Application.Page.Subscriber_Manage._stateIntro = true;
            }
        },

        segmentID: '%%GLOBAL_Segment%%',

        eventDocumentReady: function () {
            Application.Ui.Menu.PopDown('.PopDownMenu_Resize', {maxHeight: 370});
            $(document.ActionMembersForm.cmdAddContact).click(Application.Page.Subscriber_Manage.eventAddContactCommandClick);
            $(document.ActionSearchContacts.emailaddress).focus(Application.Page.Subscriber_Manage.eventQuickSearchFocus);
            $(document.ActionSearchContacts.emailaddress).blur(Application.Page.Subscriber_Manage.eventQuickSearchBlur);

            Application.Ui.CheckboxSelection(
                'table#SubscribersManageAnylistList',
                'input.UICheckboxToggleSelector',
                'input.UICheckboxToggleRows');

            if (document.ActionSearchContacts.emailaddress.value.trim() != '')
                $('#AdvanceSearchClearLink').show();
            Application.Page.Subscriber_Manage._displayIntro();
            $(document.ActionSearchContacts.emailaddress).blur();
        },
        eventAddContactCommandClick: function (event) {
            document.location.href = '%%GLOBAL_AddButtonURL%%';
        },
        eventQuickSearchFocus: function (event) {
            if (Application.Page.Subscriber_Manage._stateIntro) {
                this.value = '';
            }
            $(this).css('color', '');
            this.select();
            Application.Page.Subscriber_Manage._stateIntro = false;
        },
        eventQuickSearchBlur: function (event) {
            Application.Page.Subscriber_Manage._displayIntro();
        }
    };

    Application.init.push(Application.Page.Subscriber_Manage.eventDocumentReady);
</script>
<link rel="stylesheet" href="includes/styles/ui.datepicker.css" type="text/css">
<link rel="stylesheet" href="includes/styles/timepicker.css" type="text/css">
<script src="includes/js/jquery/ui.js"></script>
<script>
    %%GLOBAL_DatePickerJavascript%%
</script>
<script src="includes/js/jquery/timepicker.js"></script>
<script src="includes/js/jquery/form.js"></script>
<script>%%GLOBAL_EventJavascript%%</script>
<div id="eventAddFormDiv" style="display:none;">
    %%GLOBAL_EventAddForm%%
</div>

<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
    <tr>
        <td class="headingSearch">
            <div style="margin: 10px 5px 0 0; float: right;">
                <div style="text-align: left;">
                    <form class="d-flex" name="ActionSearchContacts" method="post" action="index.php?Page=Subscribers&Action=Manage&SubAction=SimpleSearch%%GLOBAL_URLQueryString%%">
                        <input type="text" class="Field250 form-control" size="20" value="%%GLOBAL_Search%%" name="emailaddress" title="%%LNG_Subscribers_SimpleSearch_Title%%" />
                        <input type="image" border="0" src="images/search.svg" id="SearchButton" style="vertical-align: top; margin-left:5px;" name="SearchButton" />
                    </form>
                    <a href="index.php?Page=Subscribers&Action=Manage&SubAction=AdvancedSearch">%%LNG_AdvancedSearch%%</a>
                    &nbsp;
                    <a href="index.php?Page=Subscribers&Action=Manage&Lists=any" id="AdvanceSearchClearLink" style="display:none;font-family:"Roboto",>%%LNG_SubscriberQuickSearch_ClearSearch%%</a>
                </div>
            </div>
            <div class="Heading1 col-sm-4 Heading1New" style="margin-top:14px">
                %%LNG_View%%:
                <a href="#" style="text-decoration: none;" id="SubscriberViewPickerButton" class="PopDownMenu_Resize">
                    <span class="Heading1New" style="color: #279ccb;" id="SubscriberViewPicker_Caption">%%GLOBAL_SubscribersManage%%</span>
                    <img width="8" height="5" border="0" src="images/arrow_blue.gif" style="margin-bottom: 3px;" />
                </a>
            </div>
        </td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor"><p  style="padding-top: 10px;">%%LNG_Help_SubscribersManage%%</p></td>
    </tr>
    <tr>
        <td style="font-size:14px;color: #212529; border-bottom: 1px solid rgba(204, 204, 204, 0.35);" >%%GLOBAL_Message%%</td>
    </tr>
    <tr>
        <td class="body"></td>
    </tr>
    <tr>
        <td class="body" valign="bottom">
            <form name="ActionMembersForm" method="post" action="index.php?Page=Subscribers&Action=Manage&SubAction=Change&Lists[]=%%GLOBAL_List%%" onsubmit="return ConfirmChanges();">
                <table width="100%" border="0" style="margin-top:25px ;">
                    <tr>
                        <td style="display:%%GLOBAL_AddButtonDisplay%%">
                            <img style="height: 21px;"src="images/upLink.svg">
                            <input class="customButtonLink" name="cmdAddContact" value="%%LNG_Subscribers_Add_Button%%"/>                        
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <div style="display: flex;align-items: flex-end;margin-top:10px">
                                <select class="form-control ChangeTypeSelect" name="ChangeType" style="width:344px; height:41px">
                                    <option value="" SELECTED>%%LNG_ChooseAction%%</option>
                                    <option value="Delete">%%LNG_Delete%%</option>
                                    <option value="ChangeFormat_Text">%%LNG_ChangeFormat_Text%%</option>
                                    <option value="ChangeFormat_HTML">%%LNG_ChangeFormat_HTML%%</option>
                                    <option value="ChangeStatus_Confirm">%%LNG_ChangeStatus_Confirm%%</option>
                                    <option value="ChangeStatus_Unconfirm">%%LNG_ChangeStatus_Unconfirm%%</option>
                                </select>
                                <input class="goButton" type="submit" name="cmdChangeType" value="%%LNG_Go%%" class="Text" />
                            </div>     
                        </td>
                    </tr>
                </table>
                <span>%%GLOBAL_SubscribersReport%%</span>
                
                <div class="thirdPartyTable">
                    <table border="0" cellspacing="0" cellpadding="0" style="margin-top:25px;" class="table" id="SubscribersManageAnylistList">
                        <tr class="Heading3">
                            <td nowrap align="center">
                            <label class="customCheckBox">
                                <input type="checkbox" name="toggle" class="UICheckboxToggleSelector">
                                <span class="checkmark"></span></label>
                            </td>
                             <td>
                        <div>
                        &nbsp;
                        &nbsp;
                           &nbsp;
                           &nbsp;
                           &nbsp;
                        </div>
                        </td>
                            %%GLOBAL_Columns%%
                            <td >
                                <span class="sorting position-relative pl-1">
                                    <a href='index.php?Page=Subscribers&Action=Manage&SubAction=Step3&SortBy=ListName&Direction=Up&'><i class="fa fa-caret-up position-absolute" style="bottom: 6px;color: #d5d5d5;margin-left:-10px" aria-hidden="true"></i></a>
                                    <a href='index.php?Page=Subscribers&Action=Manage&SubAction=Step3&SortBy=ListName&Direction=Down'> <i class="fa fa-caret-down position-absolute" style="top: 4px;color: #d5d5d5;margin-left:-10px" aria-hidden="true"></i></a>
                                    %%LNG_MailingList%%&nbsp;
                                    <span class="sorting position-relative pl-1"></span
                                </span>
                                <a href='index.php?Page=Subscribers&Action=Manage&SubAction=Step3&SortBy=ListName&Direction=Up&'></a>&nbsp;<a href='index.php?Page=Subscribers&Action=Manage&SubAction=Step3&SortBy=ListName&Direction=Down'></a>
                            </td>
                            <td>
                                %%LNG_Action%%
                            </td>
                        </tr>
                        %%TPL_Subscribers_Manage_AnyList_Row%%
                    </table>
                </div>
                &nbsp;
            </form>
            %%TPL_Paging%%
        </td>
    </tr>
</table>
%%GLOBAL_SubscriberViewPickerMenu%%
<script>
    function ConfirmDelete(EmailID, List, SegmentID) {
        if (!EmailID) {
            return false;
        }
        if (confirm("%%LNG_DeleteSubscriberPrompt%%")) {
            var temp = 'index.php?Page=Subscribers&Action=Manage&SubAction=Delete&List=' + List + '&id=' + EmailID;
            if (SegmentID && SegmentID != 0)
                temp += '&SegmentID=' + SegmentID
            document.location = temp;
            return true;
        }
    }

    function ConfirmChanges() {
        var found_members = false;

        formObj = document.ActionMembersForm;

        if (formObj.ChangeType.selectedIndex == 0) {
            alert("%%LNG_PleaseChooseAction%%");
            formObj.ChangeType.focus();
            return false;
        }

        for (var i = 0; i < formObj.length; i++)
        {
            fldObj = formObj.elements[i];
            if (fldObj.type == 'checkbox')
            {
                if (fldObj.checked) {
                    found_members = true;
                    break;
                }
            }
        }

        if (!found_members) {
            alert("%%LNG_ChooseSubscribers%%");
            return false;
        }

        if (confirm("%%LNG_ConfirmSubscriberChanges%%")) {
            return true;
        }
        return false;
    }
</script>


<style>
#TB_window {
    top:0;
    margin-top:210px;
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
.thirdPartyTable {
    width:94.5vw;
    overflow-x:scroll;
}
.paginationTable{
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
#TB_window {
    top:0;
    margin-top:210px;
}
.BodyContainer {
    width:98.4%;
}
.Heading3 TD:not(:first-child):not(:last-child):not(:nth-child(2)) {
    padding-right:35px;
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
    .BodyContainer{
        width:98.4%;
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
        width:93.5vw !important;
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
    .ChangeTypeSelect{
        width:250px !important;
    }
    .paginationTable{
        width:100% !important;
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
    .ChangeTypeSelect{
        width:250px !important;
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
    .ChangeTypeSelect{
        width:250px !important;
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
    .ChangeTypeSelect{
        width:150px !important;
    }
    .headingSearch {
        display:flex;
        flex-direction:column-reverse;
    }
    #SearchButton {
        margin-left:5px;
    }
    #SubscriberViewPicker {
        top:26px !important;
        left:12px !important;
        width:270px !important;
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
    .ChangeTypeSelect{
        width:150px !important;
    }
    .headingSearch {
        display:flex;
        flex-direction:column-reverse;
    }
    #SearchButton {
        margin-left:5px;
    }
    #SubscriberViewPicker {
        top:26px !important;
        left:12px !important;
        width:270px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
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
    .ChangeTypeSelect{
        width:150px !important;
    }
    .headingSearch {
        display:flex;
        flex-direction:column-reverse;
    }
    #SearchButton {
        margin-left:5px;
    }
    #SubscriberViewPicker {
        top:26px !important;
        left:12px !important;
        width:270px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
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
    .ChangeTypeSelect{
        width:150px !important;
    }
    .headingSearch {
        display:flex;
        flex-direction:column-reverse;
    }
    #SearchButton {
        margin-left:5px;
    }
    #SubscriberViewPicker {
        top:26px !important;
        left:12px !important;
        width:270px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
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
    .ChangeTypeSelect{
        width:150px !important;
    }
    .headingSearch {
        display:flex;
        flex-direction:column-reverse;
    }
    #SearchButton {
        margin-left:5px;
    }
    #SubscriberViewPicker {
        top:26px !important;
        left:12px !important;
        width:270px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
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
    .ChangeTypeSelect{
        width:150px !important;
    }
    .headingSearch {
        display:flex;
        flex-direction:column-reverse;
    }
    #SearchButton {
        margin-left:5px;
    }
    #SubscriberViewPicker {
        top:26px !important;
        left:12px !important;
        width:270px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
    }
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