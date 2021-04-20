<form method="post" action="index.php?Page=Newsletters&Action=%%GLOBAL_Action%%" onsubmit="return CheckForm()">
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
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="margin-top:10px ; border-bottom:0px">
                    <tr>
                        <td colspan="3" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%GLOBAL_NewsletterDetails%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_NewsletterName%%:
                        </td>
                        <td class="inputPadding">
                            <input type="text" name="Name" class="form-control Field350" value="%%GLOBAL_Name%%">%%LNG_HLP_NewsletterName%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_NewsletterFormat%%:
                        </td>
                        <td class="inputPadding">
                            <select class="form-control Field350"name="Format" id="Format">
                                %%GLOBAL_FormatList%%
                            </select>%%LNG_HLP_NewsletterFormat%%
                        </td>
                    </tr>
                    <tr class="DisplayTemplateList" style="display: %%GLOBAL_DisplayTemplateList%%">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_ChooseTemplate%%:
                        </td>
                        <td class="inputPadding">
                            <div class="htmlPreviewTemplate">
                                %%GLOBAL_TemplateList%%
                                <div class="DisplayTemplateList" style="display: block; width: 255px; text-align: center; display: %%GLOBAL_DisplayTemplateList%%">
                                    <div><a href="javascript:void(0);" onclick="javascript:ShowPreview();"><img id="imgPreview" src="images/nopreview.gif" width="247" height="200" style="border: 1px solid black" onerror="this.src=images/nopreview.gif"></a></div>
                                    <div style="padding-top: 0px;"><a href="#" onclick="javascript: ShowPreview(); return false;"><img src="images/magnify.gif" border="0" style="padding-right:5px">%%LNG_Preview_Template%%</a></div>
                                </div>
                            </div>
                            %%LNG_HLP_ChooseTemplate%%
                        </td>
                    </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain">
                    <tr>
                        <td class="submitTableBtn FieldLabel"></td>
                        <td valign="top" height="30">
                            <input class="FormButton btn save-btn" type="submit" value="%%LNG_Next%%" />
                            <input class="FormButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%GLOBAL_CancelButton%%")) {
                                        document.location = "index.php?Page=Newsletters"
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
        var f = document.forms[0];
        if (f.Name.value == '') {
            alert("%%LNG_EnterNewsletterName%%");
            f.Name.focus();
            return false;
        }
    }

    $('#Format').change(function () {
        // Hide the template preview if a text campaign was selected
        if ($(this).val() == 't') {
            $('.DisplayTemplateList').hide();
        } else {
            $('.DisplayTemplateList').show();
        }
    });

</script>
<style>
 .htmlPreviewTemplate {
    display:inline-flex;
}
.inputPadding{
    padding-top: 1.35rem; 
}
#TemplateID {
    height:200px !important;
}
input {
  filter: none !important;
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
    flex:wrap;
}
.submitTableBtn{
    width:225px;
}
.Field350 {
    width: 338px !important;
    padding-right: 0px;
    display:inline;
}
.width20Percent {
    width:16em;
}
.Panel td {
    font-size:14px;
}
.BodyContainer {
    width: 98.3%;
    margin: 0 10px 10px 10px;
}
.HelpToolTip_Placeholder {
    margin: 20px -152px !important;
    width:375px !important;
}
@media screen and (max-width:1024px){
    .FormButton{
        margin-top:20px;   
    }
    .submitTableBtn{
        width:210px;
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
    .BodyContainer {
        width: 95.5%;
    }
    .HelpToolTip_Placeholder {
        margin: 20px -210px !important;
        width:375px !important;
    }
}
@media screen and (max-width:823px){
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:210px;
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
    .BodyContainer {
        width: 95.5%;
    }
    .HelpToolTip_Placeholder {
        margin: 20px -210px !important;
        width:375px !important;
    }
}
@media screen and (max-width:768px){
    .FormButton{
        margin-top:20px;   
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -250px !important;
        width:375px !important;
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
    .BodyContainer {
    width: 95.5%;
    }
}
@media screen and (max-width:568px){
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
        width:375px !important;
    }
    .htmlPreviewTemplate {
        display: flex;
        flex-direction: column;
    }
    .DisplayTemplateList {
        width:auto !important;
        margin-top: 10px;
    }
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:155px;
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
    .BodyContainer {
    width: 95.5%;
    }
    .HelpToolTip img:first-child {
    margin-top: 4px !important;
    margin-left: -5px !important;
    }
}
@media screen and (max-width:414px){
    .htmlPreviewTemplate {
        display: flex;
        flex-direction: column;
    }
    .DisplayTemplateList {
        width:auto !important;
        margin-top: 10px;
    }
    .FormButton{
        margin-top:20px;   
    }
    .submitTableBtn{
        width:155px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
        width:375px !important;
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
    .BodyContainer {
    width: 95.5%;
    }
    .HelpToolTip img:first-child {
    margin-top: 4px !important;
    margin-left: -5px !important;
    }
}
@media screen and (max-width:411px){
    .htmlPreviewTemplate {
        display: flex;
        flex-direction: column;
    }
    .DisplayTemplateList {
        width:auto !important;
        margin-top: 10px;
    }
    .FormButton{
        margin-top:20px;   
    }
    .submitTableBtn{
        width:155px;
    }
    .HelpToolTip_Placeholder{
        margin: 20px -173px !important;
        width: 333px !important;
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
    .BodyContainer {
        width: 94.5%;
    }
    .HelpToolTip img:first-child {
        margin-top: 4px !important;
        margin-left: -5px !important;
    }
}
@media screen and (max-width:375px){
    .htmlPreviewTemplate {
        display: flex;
        flex-direction: column;
    }
    .DisplayTemplateList {
        width:auto !important;
        margin-top: 10px;
    }
    .FormButton{
        margin-top:4px;   
    }
    .FormButton:nth-child(1){
        margin-top:20px;   
    }
    .submitTableBtn{
        width:155px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
        width:375px !important;
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
    .BodyContainer {
        width: 95.5%;
    }
    .HelpToolTip img:first-child {
        margin-top: 4px !important;
        margin-left: -5px !important;
    }
}
@media screen and (max-width:360px){ 
    .htmlPreviewTemplate {
        display: flex;
        flex-direction: column;
    }
    .DisplayTemplateList {
        width:auto !important;
        margin-top: 10px;
    }
    .FormButton{
        margin-top:4px;   
    }
    .FormButton:nth-child(1){
        margin-top:20px;   
    }
    .submitTableBtn{
        width:158px;
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
    .BodyContainer {
        width: 93.5%;
    }
    .HelpToolTip_Placeholder{
        margin: 20px -187px !important;
        width: 320px !important;
    }
    .HelpToolTip img:first-child {
        margin-top: 4px !important;
        margin-left: -5px !important;
    }
}
@media screen and (max-width:320px){
    .htmlPreviewTemplate {
        display: flex;
        flex-direction: column;
    }
    .DisplayTemplateList {
        width:auto !important;
        margin-top: 10px;
    }
    .FormButton{
        margin-top:4px;   
    }
    .FormButton:nth-child(1){
        margin-top:20px;   
    }
    .submitTableBtn{
        width:125px;
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
        width:135px !important;
        padding-right:0px;
    }
    select {
        width:135px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .BodyContainer {
        width: 93%;
    }
    .HelpToolTip_Placeholder{
        margin: 20px -154px !important;
        width: 282px !important;
    }
    .HelpToolTip img:first-child {
        margin-top: 4px !important;
        margin-left: -5px !important;
    }
}
</style>
