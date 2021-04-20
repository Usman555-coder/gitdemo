<form method="post" action="index.php?Page=Subscribers&Action=%%GLOBAL_FormAction%%&SubAction=step3&Lists[]=%%GLOBAL_List%%">
    <table cellspacing="0" cellpadding="0" width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Subscribers_AdvancedSearch%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Subscribers_Search_Step2%%
                </p>
            </td>
        </tr>
        <tr>
            <td>
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr>
            <td>
                {*<div style="padding-bottom: 10px;">
                    <input class="FormButton" type="submit" value="%%LNG_Next%%">
                    <input class="FormButton" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%LNG_Subscribers_Manage_CancelPrompt%%")) {
                                document.location = "index.php?Page=Subscribers"
                            }'>
                </div>*}
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="margin-top:10px ; border-bottom:0px" id="FilteringOptions">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_FilterSearch%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Email%%:
                        </td>
                        <td class="inputPadding">
                            <input type="text" name="emailaddress" value="" class="form-control Field350">%%LNG_HLP_FilterEmailAddress%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Format%%:
                        </td>
                        <td class="inputPadding">
                            <select name="format" class="form-control Field350">
                                %%GLOBAL_FormatList%%
                            </select>%%LNG_HLP_FilterFormat%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_ConfirmedStatus%%:
                        </td>
                        <td class="inputPadding">
                            <select name="confirmed" class="form-control Field350">
                                <option value="-1" SELECTED>%%LNG_Either_Confirmed%%</option>
                                <option value="1">%%LNG_Confirmed%%</option>
                                <option value="0">%%LNG_Unconfirmed%%</option>
                            </select>%%LNG_HLP_FilterConfirmedStatus%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Status%%:
                        </td>
                        <td class="inputPadding">
                            <select name="status" class="form-control Field350">
                                <option value="-1">%%LNG_AllStatus%%</option>
                                <option value="a" SELECTED>%%LNG_Active%%</option>
                                <option value="b">%%LNG_Bounced%%</option>
                                <option value="u">%%LNG_Unsubscribed%%</option>
                            </select>%%LNG_HLP_FilterStatus%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_FilterByDate%%:
                        </td>
                        <td class="inputPadding">
                            <label class="customCheckBox" for="datesearch[filter]"><input type="checkbox" name="datesearch[filter]" id="datesearch[filter]" value="1"%%GLOBAL_FilterChecked%% onClick="javascript: enableDate_SubscribeDate(this, 'datesearch')">%%LNG_YesFilterByDate%%<span class="checkmark"></span></label>
                            %%LNG_HLP_FilterByDate%%
                            <br/>
                            <div id="datesearch" style="display: none">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td valign="middle">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0">
                                        </td>
                                        <td>
                                            <select class="datefield form-control" name="datesearch[type]" onChange="javascript: ChangeFilterOptionsSubscribeDate(this, 'datesearch');">
                                                <option value="after">%%LNG_After%%</option>
                                                <option value="before">%%LNG_Before%%</option>
                                                <option value="exactly">%%LNG_Exactly%%</option>
                                                <option value="between">%%LNG_Between%%</option>
                                            </select>
                                        </td>
                                        <td valign="top">
                                            %%GLOBAL_Display_subdate_date1_Field1%%
                                            %%GLOBAL_Display_subdate_date1_Field2%%
                                            %%GLOBAL_Display_subdate_date1_Field3%%
                                        </td>
                                    </tr>
                                    <tr style="display: none" id="datesearchdate2">
                                        <td colspan="2" align="right" valign="middle" class="dateFieldPadding">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0">%%LNG_AND%%
                                        </td>
                                        <td valign="top">
                                            %%GLOBAL_Display_subdate_date2_Field1%%
                                            %%GLOBAL_Display_subdate_date2_Field2%%
                                            %%GLOBAL_Display_subdate_date2_Field3%%
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_ClickedOnLink%%:
                        </td>
                        <td class="inputPadding">
                            <label class="customCheckBox" for="clickedlink"><input type="checkbox" name="clickedlink" id="clickedlink" value="1" onClick="javascript: enable_ClickedLink(this, 'clicklink', 'linkid', '%%LNG_LoadingMessage%%')">%%LNG_YesFilterByLink%%<span class="checkmark"></span></label>
                            %%LNG_HLP_ClickedOnLink%%
                            <br/>
                            %%GLOBAL_ClickedLinkOptions%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_OpenedNewsletter%%:
                        </td>
                        <td class="inputPadding">
                            <label class="customCheckBox" for="openednewsletter"><input type="checkbox" name="openednewsletter" id="openednewsletter" value="1" onClick="javascript: enable_OpenedNewsletter(this, 'opennews', 'newsletterid', '%%LNG_LoadingMessage%%')">%%LNG_YesFilterByOpenedNewsletter%%<span class="checkmark"></span></label>
                            %%LNG_HLP_OpenedNewsletter%%
                            <br/>
                            %%GLOBAL_OpenedNewsletterOptions%%
                        </td>
                    </tr>
                    %%GLOBAL_VisibleFieldsInfo%%
                    %%GLOBAL_CustomFieldInfo%%
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain">
                    <tr>
                        <td class="submitTableBtn FieldLabel"></td>
                        <td valign="top" height="30">
                            <input class="FormButton btn save-btn" type="submit" value="%%LNG_Next%%">
                            <input class="FormButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%LNG_Subscribers_Manage_CancelPrompt%%")) {
                                        document.location = "index.php?Page=Subscribers"
                                    }'>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>
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
    width:55px;
}
.sendDate:nth-child(2) {
    width:72px;
}
.HelpToolTip {
    vertical-align: top;
}
@media screen and (max-width:1024px){
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
        width:55px !important;
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
    .sendDate:nth-child(2) {
        width:65px !important;
    }
}
@media screen and (max-width:768px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20pxs;   
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
    .sendDate:nth-child(2) {
        width:65px !important;
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
    .sendDate:nth-child(2) {
        width:65px !important;
    }
}
@media screen and (max-width:414px){
    .sendDate:nth-child(2) {
    width: 103px !important;
    }
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
}
@media screen and (max-width:411px){
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
        width:140px;
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
    .dateFieldPadding
    {
        padding: 0px 104px 0px 5px;
    }
    .sendDate:nth-child(2) {
        width:103px !important;
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
    .dateFieldPadding
    {
        padding: 0px 104px 0px 5px;
    }
    .sendDate:nth-child(2) {
        width:65px !important;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
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
        width:144px;
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
    .dateFieldPadding
    {
        padding: 0px 104px 0px 5px;
    }
    .sendDate:nth-child(2) {
        width:65px !important;
    }
}
@media screen and (max-width:320px){
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
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
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
        width:112px;
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
    .optionPadding{
        padding:0px
    }
    .multiCheckBoxSelTD .customCheckBox {
        margin-bottom: 10px;
    }
    .dateFieldPadding
    {
        padding: 0px 104px 0px 5px;
    }
    .sendDate:nth-child(2) {
        width:65px !important;
    }
}
</style>

