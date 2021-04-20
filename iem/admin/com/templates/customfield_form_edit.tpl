<script>
    Application.Page.CustomFieldEdit = {
        onFormSubmitFunction: {},

        eventDOMReady: function (event) {
            $(document.cfForm).submit(Application.Page.CustomFieldEdit.eventFormSubmit);
            $('.CancelButton', document.cfForm).click(Application.Page.CustomFieldEdit.eventFormCancel);
        },

        eventFormSubmit: function (event) {
            for (var i in Application.Page.CustomFieldEdit.onFormSubmitFunction) {
                try {
                    if (!Application.Page.CustomFieldEdit.onFormSubmitFunction[i]()) {
                        event.stopPropagation();
                        event.preventDefault();
                        return false;
                    }
                } catch (e) {
                }
            }

            // This function is called more than once so it's in javascript.js
            if (!ValidateCustomFieldForm('%%LNG_CustomField_NoFieldName%%', '%%LNG_CustomField_NoDefaultValue%%', '%%LNG_CustomFields_NoMultiValues%%')) {
                event.stopPropagation();
                event.preventDefault();
                return false;
            }
        },

        eventFormCancel: function (event) {
            if (confirm("%%GLOBAL_CancelButton%%"))
                document.location = "index.php?Page=CustomFields";
        }
    };

    Application.init.push(Application.Page.CustomFieldEdit.eventDOMReady);
</script>
<form name="cfForm" method="post" id="cfForm" action="index.php?Page=CustomFields&Action=%%GLOBAL_Action%%">
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
            <td>
                {* <input class="FormButton" type="submit" value="%%LNG_Next%%" />
                <input class="FormButton CancelButton" type="button" value="%%LNG_Cancel%%" />
                <br />
                &nbsp; *}
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel col-sm" id="customFieldsTable" style=" margin-top:10px ; border-bottom:none">
                    <tr >
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                           %%GLOBAL_CustomFieldDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_CustomFieldName%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="FieldName" id="FieldName" class="Field350 form-control" value="%%GLOBAL_FieldName%%">&nbsp;%%LNG_HLP_CustomFieldName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_CustomFieldRequired%%&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label for="FieldRequired"  class="customCheckBox"><input type="checkbox" class="form-control" id="FieldRequired" name="FieldRequired"%%GLOBAL_FieldRequired%%>%%LNG_CustomFieldRequiredExplain%%<span class="checkmark"></span></label>
                        </td>
                    </tr>
                    %%GLOBAL_SubForm%%
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                    <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%" />
                            <input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>
.radioLabelHelp > .HelpToolTip img:first-child {
    margin-top: 3px !important;
    margin-left: 3px !important;
    margin-bottom: -3px !important;
}
.radioSelectedOption {
    display:inline-flex;
}
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
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
.submitTableBtn{
    width:225px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:3px;
}
.Field350 {
    display:inline;
}
.width20Percent {
    width:16em;
}
.Panel td {
    font-size:14px;
}
.BodyContainer {
    width:98%;
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
        margin-left:3px !important;
        //margin-bottom:10px !important;
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
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
        margin-left:3px !important;
        //margin-bottom:10px !important;
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
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
        margin-left:3px !important;
        //margin-bottom:10px !important;
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
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
    .BodyContainer {
        width: 93.5% !important;
    }
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
    .BodyContainer {
        width: 93.5% !important;
    }
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
    .BodyContainer {
        width: 93.5% !important;
    }
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
    .BodyContainer {
        width: 93.5% !important;
    }
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:145px;
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
        width:11.5em !important;
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
    .BodyContainer {
        width: 93.5% !important;
    }
    .checkmark {
        top: 3px !important;
        left: 1px !important;
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
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:125px;
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
    .BodyContainer {
        width: 93.5% !important;
    }
    .checkmark {
        top: 3px !important;
        left: 1px !important;
    }
}
</style>
