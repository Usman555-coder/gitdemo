<form method="post" id="cfForm" action="index.php?Page=CustomFields&Action=%%GLOBAL_Action%%" onsubmit="return CheckForm()">
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
                <table border="0" cellspacing="0" cellpadding="2" width="100%"  class="Panel col-sm" style=" margin-top:10px ; border-bottom:none" id="customFieldsTable" >
                    <tr >
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                           %%LNG_CustomFieldDetails%%
                        </td>
                    </tr>
                    %%GLOBAL_SubForm%%
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                    <td class="submitTableBtn FieldLabel">&nbsp;</td>
                    <td valign="top" height="30">
                            <input class="FormButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%" />
                            <input class="FormButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%GLOBAL_CancelButton%%")) {
                                        document.location = "index.php?Page=CustomFields"
                                    }' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script>

    function CheckForm() {
        // This function is called more than once so it's in javascript.js
        return ValidateCustomFieldForm('%%LNG_CustomField_NoFieldName%%', '%%LNG_CustomField_NoDefaultValue%%', '%%LNG_CustomFields_NoMultiValues%%');
    }

</script>
<style>
.Message {
    background-color: #EBF5FA;
    margin-bottom: 10px;
    padding: 8px;
    margin-top: 16px;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
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
        width:94% !important;
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
        width:94% !important;
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
        width:94% !important;
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
        width:8em !important;
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
        width:94% !important;
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
        width:110px;
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
        width:140px !important;
    }
    .Field350 {
        width:180px !important;
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
        width:94% !important;
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
        width:110px;
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
        width:93.5% !important;
    }
}
</style>

