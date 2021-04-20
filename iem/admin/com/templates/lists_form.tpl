<script src="includes/js/jquery.js"></script>
<script src="includes/js/jquery/form.js"></script>
<script src="includes/js/jquery/thickbox.js"></script>
<link rel="stylesheet" type="text/css" href="includes/styles/thickbox.css" />
<script>
    $(function () {
        $(document.frmListEditor).submit(function (event) {
            try {

                var fieldNames = ["Name", "OwnerName", "OwnerEmail", "ReplyToEmail", "BounceEmail"];
                var emptyToks = ["%%LNG_EnterListName%%", "%%LNG_EnterOwnerName%%", "%%LNG_EnterOwnerEmail%%", "%%LNG_EnterReplyToEmail%%", "%%LNG_EnterBounceEmail%%"];
                var invalidToks = ["%%LNG_ListNameIsNotValid%%", "%%LNG_ListOwnerNameIsNotValid%%", "%%LNG_ListOwnerEmailIsNotValid%%", "%%LNG_ListReplyToEmailIsNotValid%%", "%%LNG_ListBounceEmailIsNotValid%%"];
                var form = this;

                var fields = jQuery.map(fieldNames, function (el, i) {
                    return form.elements[el];
                });

                var error = false;
                jQuery.each(fields, function (i, el) {
                    if (el.value == '') {
                        error = emptyToks[i];
                        el.focus();
                        return false;
                    } else if (fieldNames[i].indexOf('Email') != -1 && !isValidEmail(el.value)) {
                        error = invalidToks[i];
                        el.focus();
                        return false;
                    }
                });

                if (error) {
                    alert(error);
                    return false;
                }

                var count = 0;
                for (var i = 0; i < $('#fields')[0].options.length; i++) {
                    if ($('#fields')[0].options[i].selected) {
                        count++;
                        break;
                    }
                }

                if (count == 0) {
                    alert("%%LNG_SelectFields%%");
                    $('#fields')[0].focus();
                    return false;
                }

                return true;

            } catch (e) {
                alert('Unable to validate');
                return false;
            }
        });

        $('.CancelButton', document.frmListEditor).click(function () {
            if (confirm("%%GLOBAL_CancelButton%%")) {
                document.location = "index.php?Page=Lists"
            }
        });

        $('.form_text', document.frmListEditor).focus(function () {
            this.select();
        });

        $('#availablefields').click(AvailableFieldsClicked);
    });

    function AvailableFieldsClicked() {
        var availableFields = $('#availablefields').get(0);
        var visibleFields = $('#fields').get(0);
        for (var i = 0, j = availableFields.options.length; i < j; ++i) {
            var currentValue = availableFields.options[i].value;
            var currentText = availableFields.options[i].text;
            var entryInVisibleFields = $('ul li input[@value=' + currentValue + ']', visibleFields).get(0);

            if (availableFields.options[i].selected) {
                if (entryInVisibleFields)
                    continue;

                var newIndex = document.frmListEditor['VisibleFields[]'].options.length;
                var newOption = new Option(currentText, currentValue);
                document.frmListEditor['VisibleFields[]'].options[newIndex] = newOption;
                $(ISSelectReplacement.add_option(document.frmListEditor['VisibleFields[]'], newOption, newIndex)).appendTo($('ul', visibleFields));
            } else {
                if (!entryInVisibleFields)
                    continue;

                $(entryInVisibleFields).parent().remove();
                $('option[@value=' + currentValue + ']', document.frmListEditor['VisibleFields[]']).remove();
            }
        }
    }
</script>
<form name="frmListEditor" id="frmListEditor" method="post" action="index.php?Page=Lists&Action=%%GLOBAL_Action%%">
    <table cellspacing="0" cellpadding="0" width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%GLOBAL_Heading%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%GLOBAL_Intro%%
                </p>
            </td>
        </tr>
        <tr>
            <td style="font-size:13px;color: #212529;">
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr>
            {* <td>
                <input class="FormButton SubmitButton" type="submit" value="%%LNG_Save%%">
                <input class="FormButton CancelButton" type="button" value="%%LNG_Cancel%%" />
                <br />&nbsp; *}
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style="margin-top:10px ; border-bottom:0px">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%GLOBAL_ListDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_ListName%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 15px;  color: #000;">
                            <input type="text" name="Name" class="form-control Field350" value="%%GLOBAL_Name%%">&nbsp;%%LNG_HLP_ListName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_ListOwnerName%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 15px;  color: #000;">
                            <input type="text" name="OwnerName" class="form-control Field350" value="%%GLOBAL_OwnerName%%">&nbsp;%%LNG_HLP_ListOwnerName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_ListOwnerEmail%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 15px;  color: #000;">
                            <input type="text" name="OwnerEmail" class="form-control Field350" value="%%GLOBAL_OwnerEmail%%">&nbsp;%%LNG_HLP_ListOwnerEmail%%
                        </td>
                    </tr>
                    <tr  class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_ListReplyToEmail%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 15px;  color: #000;">
                            <input type="text" name="ReplyToEmail" class="form-control Field350" value="%%GLOBAL_ReplyToEmail%%">&nbsp;%%LNG_HLP_ListReplyToEmail%%
                        </td>
                    </tr>
                    <tr style="display: %%GLOBAL_ShowBounceInfo%%" class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_ListBounceEmail%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 15px;  color: #000;">
                            <input type="text" name="BounceEmail" class="form-control Field350" value="%%GLOBAL_BounceEmail%%">&nbsp;%%LNG_HLP_ListBounceEmail%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_NotifyOwner%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 15px;  color: #000;">
                            <label for="NotifyOwner" class="customCheckBox"><input type="checkbox" class="form-control" name="NotifyOwner" id="NotifyOwner" value="1" %%GLOBAL_NotifyOwner%%>%%LNG_NotifyOwnerExplain%%<span class="checkmark"></span></label> %%LNG_HLP_NotifyOwner%%
                        </td>
                    </tr>

                    <tr %%GLOBAL_ShowCustomFields%%>
                        <td class="EmptyRow" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr %%GLOBAL_ShowCustomFields%% >
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_Add_Customfields_To_List%%
                        </td>
                    </tr>
                    <tr %%GLOBAL_ShowCustomFields%% class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            %%LNG_AddTheseFields%%:
                        </td>
                        <td class="secondTd" style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;">
                            <select id="availablefields" name="AvailableFields[]" multiple="multiple" class=" ISSelectDiv ISSelectReplacement form-control" style="%%GLOBAL_VisibleFields_Style%%" onClick="AvailableFieldsClicked();">
                                %%GLOBAL_AvailableFields%%
                            </select>&nbsp;%%LNG_HLP_AddTheseFields%%
                        </td>
                    </tr>

                    <tr>
                        <td class="EmptyRow" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_VisibleFields%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            %%LNG_ShowTheseFields%%:
                        </td>
                        <td class="secondTd" style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;">
                            <select id="fields" name="VisibleFields[]" multiple="multiple" class="ISSelectDiv ISSelectReplacement form-control" style="%%GLOBAL_VisibleFields_Style%%">
                                %%GLOBAL_VisibleFields%%
                            </select>&nbsp;%%LNG_HLP_VisibleFields%%
                        </td>
                    </tr>
                    <tr>
                        <td class="EmptyRow" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_PredefinedCustomFields%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_CompanyName%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 10px;  color: #000;">
                            <input type="text" name="CompanyName" class="form-control Field350" value="%%GLOBAL_CompanyName%%">&nbsp;%%LNG_HLP_CompanyName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_CompanyAddress%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 10px;  color: #000;">
                            <input type="text" name="CompanyAddress" class="form-control Field350" value="%%GLOBAL_CompanyAddress%%">&nbsp;%%LNG_HLP_CompanyAddress%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_CompanyPhone%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 10px;  color: #000;">
                            <input type="text" name="CompanyPhone" class="form-control Field350" value="%%GLOBAL_CompanyPhone%%" maxlength="20">&nbsp;%%LNG_HLP_CompanyPhone%%
                        </td>
                    </tr>
                    {template="bounce_details"}
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                    <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton btn save-btn SubmitButton" type="submit" value="%%LNG_Save%%" />
                            <input class="FormButton btn cancel-btn CancelButton" type="button" value="%%LNG_Cancel%%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>
input {
  filter: none !important;
}
.bounceAdvSetting {
    padding-left: 0px !important;
}
*{
    box-sizing:border-box;
}
.ISSelectDiv{
    height:150px !important;
}
.ISSelectSearch {
    height:30px;
    width:450px !important;
}
.ContentContainer {
    width:100% !important;
}
.secondTd{
    padding:15px 10px 0px 0px;
}
.width20Percent {
    font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem; padding-left:18px;  color: #000;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
.nextCancelButton {
    margin-top:1.5%;
}
.ISSelectDiv{
    height:150px !important;
    width:450px !important;
}
.submitTableBtn{
    width:225px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:3px;
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
.Field350 {
    display:inline;
}
.width20Percent {
    width:16em;
}
.Panel td {
    font-size:14px;
    padding-top: 28px;
    vertical-align: middle;
}
@media screen and (max-width: 1366px) {
    .ISSelectDiv {
        height: auto !important;
        max-height: 150px !important;
        width: 380px !important;
    }
}
@media screen and (max-width:1024px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:15em !important;
    }
    .secondTd{
    padding:15px 10px 0px 0px;
}
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:270px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:350px !important;
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
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:328px;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:15em !important;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:270px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .input.ISSelectSearch {
        width:400px;
    }
}
@media screen and (max-width:768px){
    .extramail_others_value {
        display: flex;
        margin-bottom: 10px;
        margin-left: 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:15em !important;
    }
    .secondTd{
    padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:270px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:350px !important;
    }
}
@media screen and (max-width:568px){
    .submitTableBtn {
        width: 0 !important;
        min-width: 0 !important;
        max-width: 0 !important;
    }
    .Panel td {
        padding-top: 17px;
    }
    .extramail_others_value {
        display: flex;
        margin-bottom: 10px;
        margin-left: 0px;
    }
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
    }
    .customCheckBox {
        width:210px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:155px;
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
    }
    .Field250 {
        width:210px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    select {
        width:210px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 210px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
}
@media screen and (max-width:414px){
    .extramail_others_value {
        display: flex;
        margin-bottom: 10px;
        margin-left: 0px;
    }
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
    }
    .customCheckBox {
        width:210px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:155px;
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
    }
    .secondTd{
    padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:210px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    select {
        width:210px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 210px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:180px !important;
    }
    .extramail_others_value {
        margin-top:10px !important;
        margin-bottom: 0px !important;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
}
@media screen and (max-width:411px){
    .extramail_others_value {
        display: flex;
        margin-bottom: 10px;
        margin-left: 0px;
    }
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
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:153px;
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
    }
    .secondTd{
    padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    select {
        width:180px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:180px !important;
    }
    .extramail_others_value {
        margin-top:10px !important;
        margin-bottom: 0px !important;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
}
@media screen and (max-width:375px){
    .extramail_others_value {
        display: flex;
        margin-bottom: 10px;
        margin-left: 0px;
    }
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
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:155px;
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
    }
    .secondTd{
    padding:15px 10px 0px 0px;
}
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    select {
        width:180px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:160px !important;
    }
    .extramail_others_value {
        margin-top:10px !important;
        margin-bottom: 0px !important;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
}
@media screen and (max-width:360px){
    .extramail_others_value {
        display: flex;
        margin-bottom: 10px;
        margin-left: 0px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:160px;
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
        width:15em !important;
    }
    .secondTd{
    padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:140px !important;
    }
    .Field350 {
        width:140px !important;
        padding-right:0px;
    }
    select {
        width:140px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:135px !important;
    }
    .extramail_others_value {
        margin-top:10px !important;
        margin-bottom: 0px !important;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
}
@media screen and (max-width:320px){
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .extramail_others_value {
        display: flex;
        margin-bottom: 10px;
        margin-left: 0px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:135px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:123px;
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
        width:15em !important;
    }
    .secondTd{
    padding:15px 10px 0px 0px;
}
    .Field250 {
        width:140px !important;
    }
    .Field350 {
        width:135px !important;
        padding-right:0px;
    }
    select {
        width:140px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:135px !important;
    }
    .extramail_others_value {
        margin-top:10px !important;
        margin-bottom: 0px !important;
    }
    .nodeImg {
        display: none;
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
