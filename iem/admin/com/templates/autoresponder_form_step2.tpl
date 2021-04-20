<form method="post" action="index.php?Page=Autoresponders&Action=%%GLOBAL_Action%%" onsubmit="return CheckForm()">
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
                %%GLOBAL_CronWarning%%
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style="margin-top:10px ; border-bottom:0px">
                    <tr %%GLOBAL_FilterOptions%%>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_AutoresponderDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label" >
                            {template="Required"}
                            %%LNG_AutoresponderName%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="name" class="form-control Field350" value="%%GLOBAL_Name%%">&nbsp;%%LNG_HLP_AutoresponderName%%
                            <div class="aside" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;font-size: 14px;padding-top: 0.5rem;">%%LNG_Autoresponder_Name_Reference%%</div>
                        </td>
                    </tr>
                </table>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" %%GLOBAL_FilterOptions%% style="margin-top:10px ; border-bottom:0px">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_FilterOptions_Autoresponders%%
                        </td>
                    </tr>
                    <tr %%GLOBAL_FilterOptions%% class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_ShowFilteringOptions_Autoresponders%%:&nbsp;
                        </td>
                        <td>
                            <table width="100%" cellspacing="0" cellpadding="0">
                                <tr class="whiteBackground">
                                    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 0rem;  color: #000;">
                                        <label class="customRadio" for="DoNotShowFilteringOptions"><input type="radio" name="ShowFilteringOptions" class="form-control" id="DoNotShowFilteringOptions" value="2" %%GLOBAL_DoNotShowFilteringOptions%% onclick="document.getElementById('FilteringOptions').style.display = 'none';">%%LNG_AutorespondersDoNotShowFilteringOptionsOneListExplain%%
                                        <span class="checkmarkRadio"></span>
                                        </label>
                                </tr>
                                <tr class="whiteBackground">
                                    <td class="secondRadioButton">
                                        <label class="customRadio" for="ShowFilteringOptions"><input type="radio" name="ShowFilteringOptions" class="form-control" id="ShowFilteringOptions" value="1" %%GLOBAL_ShowFilteringOptions%% onclick="document.getElementById('FilteringOptions').style.display = '';">%%LNG_AutorespondersShowFilteringOptionsOneListExplain%%
                                        <span class="checkmarkRadio"></span>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style=" margin-top:10px ; border-bottom:none;display:none;" id="FilteringOptions" %%GLOBAL_FilteringOptions_Display%%>
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_AutoresponderFilterDetails%%
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <div style='background-color: #faa527 !important; color:#000000;padding:5px 5px 8px 10px; margin-bottom:10px'>
                                %%LNG_Autoresponder_Filter_Help%%
                            </div>
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_MatchEmail%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="emailaddress" value="%%GLOBAL_emailaddress%%" class="form-control Field350">&nbsp;%%LNG_HLP_MatchEmail%%
                        </td>
                    </tr>
                    <tr class="whiteBackground" >
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_MatchFormat%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="format" class="form-control Field350 customSelect" >
                                %%GLOBAL_FormatList%%&nbsp;
                            </select>&nbsp;%%LNG_HLP_MatchFormat%%
                        </td>
                    </tr>
                    <tr class="whiteBackground" >
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_MatchConfirmedStatus%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="confirmed" class="form-control Field350 customSelect" >
                                %%GLOBAL_ConfirmList%%
                            </select>&nbsp;%%LNG_HLP_MatchConfirmedStatus%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Autoresponder_ClickedOnLink%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label for="clickedlink" class="customCheckBox"><input type="checkbox" name="clickedlink" id="clickedlink" class="form-control" value="1" %%GLOBAL_clickedlink%% onClick="javascript: enable_ClickedLink(this, 'clicklink', 'linkid', '%%LNG_LoadingMessage%%')">&nbsp;%%LNG_Autoresponder_YesFilterByLink%%
                             <span class="checkmark">
                            </label>
                            %%LNG_HLP_Autoresponder_ClickedOnLink%%
                            <br/>
                            <div id="clicklink" style="display: %%GLOBAL_clickedlinkdisplay%%">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td valign="middle">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0">
                                        </td>
                                        <td colspan="2" style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px; ">
                                            <select name="linktype" class="form-control Field350 customSelect" style="width: 20rem; height: 34px;">
                                                <option value="clicked"%%GLOBAL_LinkType_Clicked%%>%%LNG_Search_HaveClicked%%</option>
                                                <option value="not_clicked"%%GLOBAL_LinkType_NotClicked%%>%%LNG_Search_HaveNotClicked%%</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="middle">
                                            &nbsp;
                                        </td>
                                        <td valign="middle">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0">
                                        </td>
                                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px; padding-top: 0.5em;">
                                            <select name="linkid" class="form-control Field350 customSelect" style="width: 20rem; height: 34px;" id="linkid"%%GLOBAL_LinkChange%%>
                                                %%GLOBAL_ClickedLinkOptions%%
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Autoresponder_OpenedNewsletter%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label for="openednewsletter"  class="customCheckBox"><input type="checkbox"  class="form-control"  name="openednewsletter" id="openednewsletter" value="1" %%GLOBAL_openednewsletter%% onClick="javascript: enable_OpenedNewsletter(this, 'opennews', 'newsletterid', '%%LNG_LoadingMessage%%')">&nbsp;%%LNG_Autoresponder_YesFilterByOpenedNewsletter%%
                            <span class="checkmark">
                            </label>
                            &nbsp;%%LNG_HLP_Autoresponder_OpenedNewsletter%%
                            <br/>
                            <div id="opennews" style="display: %%GLOBAL_openednewsletterdisplay%%">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td valign="middle">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0">
                                        </td>
                                        <td colspan="2" style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px; ">
                                            <select name="opentype"class="form-control Field350 customSelect" style="width: 20rem; height: 34px;">
                                                <option value="opened"%%GLOBAL_NewsletterType_Opened%%>%%LNG_Search_HaveOpened%%</option>
                                                <option value="not_opened"%%GLOBAL_NewsletterType_NotOpened%%>%%LNG_Search_HaveNotOpened%%</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="middle">
                                            &nbsp;
                                        </td>
                                        <td valign="middle">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0">
                                        </td>
                                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px; padding-top: 0.5em;">
                                            <select name="newsletterid" class="form-control Field350 customSelect" style="width: 20rem; height: 34px;" id="newsletterid"%%GLOBAL_NewsletterChange%%>
                                                %%GLOBAL_OpenedNewsletterOptions%%
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    %%GLOBAL_CustomFieldInfo%%
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton" >
                    <tr>
                    <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td>
                            <input class="FormButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%" />
                            <input class="FormButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%GLOBAL_CancelButton%%")) {
                                        document.location = "index.php?Page=Autoresponders&Action=Step2&list=%%GLOBAL_List%%"
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
        if (f.name.value == '') {
            alert("%%LNG_EnterAutoresponderName%%");
            f.name.focus();
            return false;
        }
    }
</script>
<style>
.secondRadioButton {
    color: #000;
}
select {
    padding:0px !important;
}
select option {
    padding:10px;
}
 .multiCheckBoxSelTR {
    display: flex;
    flex-direction: column;
 }
 .multiCheckBoxSelTD {
    height: auto !important;
    margin-top: 25px;
 }
 
.inputPadding{
    padding-top: 1.35rem; 
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
.secondTd{
    padding:15px 10px 0px 0px;
}
.width20Percent {
    font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem; padding-left:18px;  color: #000;
}
.tableContainer {
    flex:wrap;
}
.nextCancelButton {
    margin-top:41px;
}
#FilteringOptions {
    margin-bottom: 25px;
}
.submitTableBtn{
    width:225px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:3px;
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
.optionPadding{
    padding:5px 0px 0px 20px
}
.BodyContainer {
    width: 98.3%;
    margin: 0 10px 10px 10px;
}
.datefield {
    display:inline;
}
.sendDate:nth-child(1) {
    width:50px;
}
.sendDate:nth-child(2) {
    width:72px;
}
.HelpToolTip {
    vertical-align: top;
}
@media screen and (max-width:1024px){
    .secondRadioButton {
        padding-top:10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:0px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:430px;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:238px;
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
        width:17em !important;
    }
    .secondTd{
        padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 4px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:130px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .optionPadding{
        padding:0px
    }
    .BodyContainer {
        width: 97.5%;
    }
    .datefield {
        width:90px !important;
    }
    #datesearch, #clicklink, #opennews {
        margin-top:5px;
    }
    .sendDate:nth-child(1) {
        width:50px !important;
    }
    .sendDate:nth-child(2) {
        width:65px !important;
    }
}
@media screen and (max-width:823px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
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
    .importFromServerDiv {
        margin-top:10px;
    }
    .optionPadding{
    padding:0px
    }
}
@media screen and (max-width:768px){
    .nextCancelButton {
        margin-top:0px;
    } 
    .FormButton{
        margin-top:0px;   
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
    .importFromServerDiv {
        margin-top:10px;
    }
}
@media screen and (max-width:568px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
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
        margin-bottom: 5px;
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
    .dateFieldDiv, .datefield {
        width:130px !important;
    }
    #datesearch table td, .dateFieldDiv table td {
        display:inline !important;
    }
    #datesearch table td img, #clicklink table td img, #opennews table td img, .dateFieldDiv table td img {
        display:none !important;
    }
    #datesearch, #clicklink, #opennews {
        margin-top:5px;
    }
}
@media screen and (max-width:414px){

    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
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
        margin-bottom: 5px;
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
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .BodyContainer {
        width: 95%
    }
    .multiCheckBoxSelTD .customCheckBox {
        margin-bottom: 10px;
    }
    .dateFieldDiv, .datefield {
        width:130px !important;
    }
    #datesearch table td, .dateFieldDiv table td {
        display:inline !important;
    }
    #datesearch table td img, #clicklink table td img, #opennews table td img, .dateFieldDiv table td img {
        display:none !important;
    }
    #datesearch, #clicklink, #opennews {
        margin-top:5px;
    }
    .sendDate:nth-child(1) {
        width:130px !important;
    }
    .sendDate:nth-child(2) {
        width:130px !important;
    }
}
@media screen and (max-width:411px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:0px;   
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
        width:170px !important;
        margin-bottom: 5px;
    }
    .Field350 {
        width:170px !important;
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
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .optionPadding{
        padding:0px
    }
    .BodyContainer {
        width: 94%
    }
    .multiCheckBoxSelTD .customCheckBox {
        margin-bottom: 10px;
    }
    .dateFieldDiv, .datefield {
        width:170px !important;
    }
    #datesearch table td, .dateFieldDiv table td {
        display:inline !important;
    }
    #datesearch table td img, #clicklink table td img, #opennews table td img, .dateFieldDiv table td img {
        display:none !important;
    }
    #datesearch, #clicklink, #opennews {
        margin-top:5px;
    }
    .sendDate:nth-child(1) {
        width:170px !important;
    }
    .sendDate:nth-child(2) {
        width:170px !important;
    }
}
@media screen and (max-width:375px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
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
        margin-bottom: 5px;
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
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .optionPadding{
        padding:0px
    }
    .BodyContainer {
        width: 94%
    }
    .multiCheckBoxSelTD .customCheckBox {
        margin-bottom: 10px;
    }
    .dateFieldDiv, .datefield {
        width:130px !important;
    }
    #datesearch table td, .dateFieldDiv table td {
        display:inline !important;
    }
    #datesearch table td img, #clicklink table td img, #opennews table td img, .dateFieldDiv table td img {
        display:none !important;
    }
    #datesearch, #clicklink, #opennews {
        margin-top:5px;
    }
    .sendDate:nth-child(1) {
        width:130px !important;
    }
    .sendDate:nth-child(2) {
        width:130px !important;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:10px;
    } 
    .FormButton{
        margin-top:6px;   
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
        width:157px;
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
        width:130px !important;
        margin-bottom: 5px;
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
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .optionPadding{
        padding:0px
    }
    .BodyContainer {
        width: 94%
    }
    .multiCheckBoxSelTD .customCheckBox {
        margin-bottom: 10px;
    }
    .dateFieldDiv, .datefield {
        width:130px !important;
    }
    #datesearch table td, .dateFieldDiv table td {
        display:inline !important;
    }
    #datesearch table td img, #clicklink table td img, #opennews table td img, .dateFieldDiv table td img {
        display:none !important;
    }
    #datesearch, #clicklink, #opennews {
        margin-top:5px;
    }
    .sendDate:nth-child(1) {
        width:130px !important;
    }
    .sendDate:nth-child(2) {
        width:130px !important;
    }
@media screen and (max-width:320px){
    .sendDate:nth-child(1) {
        width:130px !important;
    }
    .sendDate:nth-child(2) {
        width:130px !important;
    }
    .dateFieldDiv, .datefield {
        width:130px !important;
    }
    #datesearch table td, .dateFieldDiv table td {
        display:inline !important;
    }
    #datesearch table td img, #clicklink table td img, #opennews table td img, .dateFieldDiv table td img {
        display:none !important;
    }
    #datesearch, #clicklink, #opennews {
        margin-top:5px;
    }
    .BodyContainer {
        width: 94%
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .nextCancelButton {
        margin-top:10px;
    } 
    .FormButton{
        margin-top:6px;   
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
        width:9em !important;
    }
    .secondTd{
        padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:125px !important;
        margin-bottom: 5px;
    }
    .Field350 {
        width:130px !important;
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
    .nodeImg {
        display: none;
    }
    .optionPadding{
        padding:0px
    }
    .multiCheckBoxSelTD .customCheckBox {
        margin-bottom: 10px;
    }
}
</style>