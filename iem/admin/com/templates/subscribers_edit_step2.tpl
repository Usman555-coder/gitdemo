<link rel="stylesheet" href="includes/styles/ui.datepicker.css" type="text/css">
<link rel="stylesheet" href="includes/styles/timepicker.css" type="text/css">
<script src="includes/js/jquery/ui.js"></script>

<script>
    %%GLOBAL_CustomDatepickerUI%%
</script>
<script>
    var SegmentID = '%%GLOBAL_SegmentID%%';
    function CheckForm() {
        var f = document.frmSubscriberEditor;

        if (f.emailaddress.value == "") {
            alert("%%LNG_Subscribers_EnterEmailAddress%%");
            f.emailaddress.focus();
            return false;
        }

        %%GLOBAL_ExtraJavascript%%
        return true;
    }

    function Save() {
        if (CheckForm()) {
            var segment = (SegmentID == '' ? '' : '&SegmentID=' + SegmentID);
            $(document.frmSubscriberEditor).attr('action', 'index.php?Page=Subscribers&Action=Edit&SubAction=Save&List=%%GLOBAL_list%%' + segment + '&save');
            document.frmSubscriberEditor.submit();
        }
    }

    // Show the loading indicator
    $(document).ajaxSend(function () {
        $('#loading_indicator').css('display', 'block');
    });
    $(document).ajaxStop(function () {
        $('#loading_indicator').css('display', 'none');
    });

    $(function () {
        $(document.frmSubscriberEditor).submit(function (event) {
            if (this.emailaddress.value == "") {
                event.preventDefault();
                event.stopPropagation();

                alert("%%LNG_Subscribers_EnterEmailAddress%%");
                this.emailaddress.focus();
                return false;
            }

            var f = this;
                    %%GLOBAL_ExtraJavascript%%
            return true;
        });

        $('.CancelButton').click(function () {
            if (confirm("%%LNG_Subscribers_Edit_CancelPrompt%%"))
                document.location = "index.php?Page=Subscribers&Action=Manage&SubAction=Step3";
        });

        $('.CustomFieldDateInput_Row').each(function () {
            var anchor = $('.CustomFieldDateInput_DatepickerAnchor', this).get(0);
            var year = $('.CustomField_Date_Year', this).get(0);
            var minYear = year.options[1].value;
            var maxYear = year.options[year.options.length - 1].value;

            $(anchor).datepicker({
                yearRange: minYear + ':' + maxYear,
                beforeShow: function () {
                    var id = this.id.match(/CustomFiledDateInput_Anchor_(\d*)/);
                    if (id.length != 2)
                        return;

                    var day = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Day').get(0);
                    var month = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Month').get(0);
                    var year = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Year').get(0);

                    if (!day || !month || !year)
                        return;
                    $(this).val($(day).val() + '/' + $(month).val() + '/' + $(year).val());
                },
                onSelect: function (date) {
                    var id = this.id.match(/CustomFiledDateInput_Anchor_(\d*)/);
                    if (id.length != 2)
                        return;

                    var day = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Day').get(0);
                    var month = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Month').get(0);
                    var year = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Year').get(0);

                    if (!day || !month || !year)
                        return;

                    var temp = date.match(/(\d{2})\/(\d{2})\/(\d{4})/);
                    if (!temp || temp.length != 4)
                        temp = ['', '', '', ''];
                    $(day).val(temp[1]);
                    $(month).val(temp[2]);
                    $(year).val(temp[3]);
                }
            });
        });
    });
</script>

<link rel="stylesheet" href="includes/styles/timepicker.css" type="text/css">
<script>

</script>
<script src="includes/js/jquery/timepicker.js"></script>
<script src="includes/js/jquery/form.js"></script>
<style>
    .tdKey{
        font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; width:13em; font-size:14px ; padding-top:1.25rem; padding-left: 1.25rem ;  color: #000;
    }
    .tdValue{
        padding-top: 1.35rem;
    }
</style>
<div id="eventAddFormDiv" style="display:none;">
    %%GLOBAL_EventAddForm%%
</div>

<form name="frmSubscriberEditor" method="post" action="index.php?Page=Subscribers&Action=Edit&SubAction=Save&List=%%GLOBAL_list%%">
    <input type="hidden" name="subscriberid" value="%%GLOBAL_subscriberid%%"/>
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr class="whiteBackground">
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Subscribers_Edit%%
            </td>
        </tr>
        <tr class="whiteBackground">
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Subscribers_Edit_Intro%%
                </p>
            </td>
        </tr>
        <tr class="whiteBackground">
            <td>
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr class="whiteBackground">
            <td>
                <input class="TopFormButton FormButton btn save-btn" type="button" value="%%LNG_SaveAndKeepEditing%%" style="width:150px" onclick='Save();'>
                <input class="TopFormButton FormButton_wide  btn save-btn" type="submit" value="%%LNG_SaveAndExit%%">
                <input class="TopFormButton FormButton CancelButton btn save-btn" type="button" value="%%LNG_Cancel%%"/>
                &nbsp;
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground parentTable col-sm" style="border-bottom:none">
                    <tr class="whiteBackground">
                        <td colspan="4" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_EditSubscriberDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent tdFirst col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Required"}
                            %%LNG_Email%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            <input type="text" name="emailaddress" value="%%GLOBAL_emailaddress%%" class="form-control Field350 tdInputFirst">
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Required"}
                            %%LNG_Format%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            <select name="format" class="Field350 form-control ">
                                %%GLOBAL_FormatList%%
                            </select>%%LNG_HLP_Format%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Required"}
                            %%LNG_ConfirmedStatus%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            <select name="confirmed" class="Field350 form-control ">
                                %%GLOBAL_ConfirmedList%%
                            </select>%%LNG_HLP_ConfirmedStatus%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Required"}
                            %%LNG_SubscriberStatus%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            <select name="status" class="Field350 form-control ">
                                %%GLOBAL_StatusList%%
                            </select>%%LNG_HLP_SubscriberStatus%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Not_Required"}
                            %%LNG_SubscribeRequestDate%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            %%GLOBAL_requestdate%%%%LNG_HLP_SubscribeRequestDate%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Not_Required"}
                            %%LNG_SubscribeRequestIP%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            %%GLOBAL_requestip%%%%LNG_HLP_SubscribeRequestIP%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Not_Required"}
                            %%LNG_SubscribeConfirmDate%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            %%GLOBAL_confirmdate%%%%LNG_HLP_SubscribeConfirmDate%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Not_Required"}
                            %%LNG_SubscribeConfirmIP%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            %%GLOBAL_confirmip%%%%LNG_HLP_SubscribeConfirmIP%%
                        </td>
                    </tr>
                    <tr style='display: %%GLOBAL_ShowUnsubscribeInfo%%'>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Not_Required"}
                            %%LNG_UnsubscribeTime%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            %%GLOBAL_unsubscribetime%%%%LNG_HLP_UnsubscribeTime%%
                        </td>
                    </tr>
                    <tr style='display: %%GLOBAL_ShowUnsubscribeInfo%%'>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                            {template="Not_Required"}
                            %%LNG_UnsubscribeIP%%:&nbsp;
                        </td>
                        <td class="tdValue">
                            %%GLOBAL_unsubscribeip%%%%LNG_HLP_UnsubscribeIP%%
                        </td>
                    </tr>
                    %%GLOBAL_CustomFieldInfo%%
                </table>
            </td>
        </tr>
    </table>
</form>
<table cellspacing="0" cellpadding="0" width="100%" align="center" style="border-collapse: collapse; border-bottom:none">
    <tr class="whiteBackground">
        <td class="Heading1 col-sm-4 Heading1New" style="padding: 20px 0px; border-top :1px solid rgba(204, 204, 204, 0.35);border-bottom :1px solid rgba(204, 204, 204, 0.35);">
            %%LNG_SubscriberEvents%%
        </td>
    </tr>
    <tr class="whiteBackground">
        <td class="body pageinfo internalAnchor" style="padding-top: 1.2rem;">
            <p class="PageIntroP">
                %%GLOBAL_SubscriberEvents_Intro%%
            </p>
        </td>
    </tr>
    <tr class="whiteBackground">
        <td>
            <div id="eventsTable">
            </div>
        </td>
    </tr>
</table>

<script>
    {template="subscribers_events_table_javascript"}
</script>
<style>
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.parentTable {
    margin-top: 20px;
}
.nextCancelButton {
    margin-top:15px;
} 
.FormButton{
    margin-top:4px;   
}
.customRadio {
    padding-bottom:7px;
    width:46%;
    left:-3px;
    margin-top: 0px;
    vertical-align: top;
}
.customCheckBox {
    width:46%;
    margin-top: 0px;
    vertical-align: top;
}
.submitTableBtn{
    width:96px;
}
.HelpToolTip_Placeholder{
    margin:20px -125px;
}
.HelpToolTip img:first-child{
    margin-top:2px;
    margin-left:1px;
    //margin-bottom:10px;
}
.Panel {
    margin-bottom: 0px;
}
.tableContainer {
    margin-bottom:2.5%;
}
.tdValue {
    padding-top: 1.35rem;
    display: inline;
    //flex-direction: column;
}
.width20Percent{
    width:15em;
    font-size:14px;
}
.Field250 {
    width:300px;
}
.Field350 {
    width:300px;
    padding-right:0px;
    margin-top: 0px;
    display: inline !important;
}
.FieldLabel{
    padding-left:0px;
    color: #000;
}
.fileFormat360{
    padding-bottom:10px;
}
.opentypeImg, .linktypeImg, .dateTypeImg {
    display:none;
}
.openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
    width:10rem;
}
.dateFieldTd {
    display:inline;
} 
.ISSelectDiv{
    height:150px;
    width:150px;
}
.datefield {
    width: 80px;
    padding: 5px 0px;
    margin: 0px 5px 0px 0px
}
.thirdPartyTable{
    width:100%;
    //overflow-x:scroll;
}
.buttons {
    padding-left: 0px;
}
.Heading3 TD:not(:first-child) {
    padding-right:20px;
}
.Panel td {
    height: fit-content;
    padding-top: 5px;
    vertical-align:top;
    padding-bottom:15px;
}
.TopFormButton:nth-child(2) {
    //margin-top:15px;
}
.twoColumns td {
    width:8.5rem;
}
.customLabel {
    padding-left:0px;
    padding-right:10px;
}
.customTextArea, .customText, .customNumber, .customSelect {
    width:15.5rem;
}
.customTextArea {
    height:70px;
}
.twoColumns {
    //display:flex;
    //flex-direction:column;
}
.twoColumns td:nth-child(1) {
    padding-right:20px;
}
.twoColumns td:nth-child(2) {
    padding-left:20px;
}.tdFirst {
        padding-bottom:20px !important
    }
    .tdInputFirst {
        margin-top:5px !important
    }

#TB_window {
    top:0;
    margin-top:210px;
}
@media screen and (max-width:1024px){
    #TB_window {
        margin-top:255px !important;
    }
    .tdFirst {
        padding-bottom:20px !important
    }
    .tdInputFirst {
        margin-top:5px !important
    }
    .parentTable {
        margin-top: 20px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
        vertical-align: top;
    }
    .customCheckBox {
        width:100px;
        margin-top: 0px;
        vertical-align: top;
    }
    .submitTableBtn{
        width:96px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:2px !important;
        margin-left:1px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:2.5% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: inline;
        //flex-direction: column;
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
        display: inline !important;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 80px !important;
        padding: 5px 0px !important;
        margin: 0px 5px 0px 0px !important
    }
    .thirdPartyTable{
        width:920px !important;
        //overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:0px !important;
    }
    .twoColumns td {
        width:50% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:15.5rem !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
}
@media screen and (max-width:823px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:100px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:96px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:690px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:0px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
    .twoColumns td {
        width:9rem !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
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
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:100px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:96px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:690px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:0px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
    .twoColumns td {
        width:9rem !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
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
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:90px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
        margin-bottom: 4px;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
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
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:96px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
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
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:96px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:13em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:330px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
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
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:96px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
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
        padding-bottom:7px;
        width:180px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:180px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:96px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:180px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:180px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
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
        padding-bottom:7px;
        width:150px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:150px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:96px;
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
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:150px !important;
    }
    .Field350 {
        width:150px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
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
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 42px !important;
        padding: 5px 0px !important;
        margin: 0px 1px 0px 0px !important;
    }
    .thirdPartyTable{
        width:260px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
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
.FormButton {
    margin-top: 0px !important;
}
</style>