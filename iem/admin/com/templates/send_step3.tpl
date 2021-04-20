<script>
    var SendPage = {varPrevNewsletterIdx: 0,
        varCurNewsletterIdx: 0,
        _CheckFormObservers: [],
        toggleTrackerOptions: function () {
            $('#tracklinks_module_list')[this.getFormObject().tracklinks.checked && $('.Module_Tracker_Options').length > 0 ? 'show' : 'hide']();
    },
            getFormObject: function () {
            return document.frmSendStep3;
            },
            getCampaignName: function () {
            var o = this.getFormObject().newsletter;
            if (o.selectedIndex != 0)
                    return '';
            else
                    return o[o.selectedIndex].text;
            },
            addCheckFormObserver: function ($fn) {
            if ($fn)
                    this._CheckFormObservers.push($fn);
            },
            checkForm: function () {
            for (var i = 0, j = this._CheckFormObservers.length; i < j; ++i) {
            if (this._CheckFormObservers[i]) {
            try {
            if (!this._CheckFormObservers[i]())
                    return false;
            } catch (e) {
            }
            }
            }

            return true;
            }};
    SendPage.addCheckFormObserver(function () {
    var form = SendPage.getFormObject();
    if (form.newsletter.selectedIndex < 1) {
    alert("%%LNG_SelectNewsletterPrompt%%");
    form.newsletter.focus();
    return false;
    }

    if (form.sendfromname.value == '') {
    alert("%%LNG_EnterSendFromName%%");
    form.sendfromname.focus();
    return false;
    }

    if (form.sendfromemail.value == '') {
    alert("%%LNG_EnterSendFromEmail%%");
    form.sendfromemail.focus();
    return false;
    }

    if (form.replytoemail.value == '') {
    alert("%%LNG_EnterReplyToEmail%%");
    form.replytoemail.focus();
    return false;
    }

    if (form.bounceemail.value == '') {
    alert("%%LNG_EnterBounceEmail%%");
    form.bounceemail.focus();
    return false;
    }

    return true;
    });
    $(function () {
    $(document.frmSendStep3).submit(function () {
    return SendPage.checkForm();
    });
    $('input.CancelButton', document.frmSendStep3).click(function () {
    if (confirm("%%LNG_Send_CancelPrompt%%"))
            document.location = "index.php?Page=Newsletters";
    });
    $('#hrefPreview').click(function () {
    var baseurl = "index.php?Page=Newsletters&Action=Preview&id=";
    if (document.frmSendStep3.newsletter.selectedIndex < 0) {
    alert("%%LNG_SelectNewsletterPrompt%%");
    document.frmSendStep3.newsletter.focus();
    return false;
    }
    if (document.frmSendStep3.newsletter.length > 1) {
    if (document.frmSendStep3.newsletter.selectedIndex == 0) {
    alert("%%LNG_SelectNewsletterPreviewPrompt%%");
    document.frmSendStep3.newsletter.focus();
    return false;
    }
    }
    var realId = document.frmSendStep3.newsletter[document.frmSendStep3.newsletter.selectedIndex].value;
    window.open(baseurl + realId, "pp");
    return false;
    });
    $(document.frmSendStep3.newsletter).change(function () {
    if (this.selectedIndex == 0)
            return;
    SendPage.varPrevNewsletterIdx = SendPage.varCurNewsletterIdx;
    SendPage.varCurNewsletterIdx = this.selectedIndex;
    });
    $(document.frmSendStep3.tracklinks).click(function () {
    SendPage.toggleTrackerOptions();
    });
    SendPage.toggleTrackerOptions();
    });
    function ShowSendTime(chkbox) {
    if (chkbox.checked) {
    document.getElementById('show_senddate').style.display = 'none';
    } else {
    document.getElementById('show_senddate').style.display = '';
    }
    }
</script>
<form name="frmSendStep3" method="post" action="index.php?Page=Send&Action=Step4">
    <table cellspacing="0" cellpadding="0" width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Send_Step3%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Send_Step3_Intro%%
                </p>
            </td>
        </tr>
        <tr>
            <td>
                %%GLOBAL_Message%%
                %%GLOBAL_NoCronMessage%%
            </td>
        </tr>
        <tr>
            <td>
               {* <input class="FormButton" type="submit" value="%%LNG_Next%%" />
                <input class="FormButton CancelButton" type="button" value="%%LNG_Cancel%%" />
                <input type="hidden" name="sendcharset" value="%%GLOBAL_SendCharset%%" />
                <br />
                &nbsp;*}
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="margin-top:10px ; border-bottom:0px">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_WhichCampaignToSend%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}%%LNG_WhichEmailToSend%%
                        </td>
                        <td class="inputPadding">
                            <select name="newsletter" class="form-control Field350" style="margin-top:4px">
                                %%GLOBAL_NewsletterList%%
                            </select>%%LNG_HLP_SendNewsletter%%<a id="hrefPreview" href="#"><img src="images/magnify.gif" border="0">%%LNG_Preview%%</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_SendFromName%%
                        </td>
                        <td class="inputPadding">
                            <input type="text" name="sendfromname" value="%%GLOBAL_SendFromName%%" class="form-control Field350">%%LNG_HLP_SendFromName%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_SendFromEmail%%:
                        </td>
                        <td class="inputPadding">
                            <input type="text" name="sendfromemail" value="%%GLOBAL_SendFromEmail%%" class="form-control Field350">%%LNG_HLP_SendFromEmail%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_ReplyToEmail%%:
                        </td>
                        <td class="inputPadding">
                            <input type="text" name="replytoemail" value="%%GLOBAL_ReplyToEmail%%" class="form-control Field350">%%LNG_HLP_ReplyToEmail%%
                        </td>
                    </tr>
                    <tr style="display: %%GLOBAL_ShowBounceInfo%%">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_BounceEmail%%:
                        </td>
                        <td class="inputPadding">
                            <input type="text" name="bounceemail" value="%%GLOBAL_BounceEmail%%" class="form-control Field350">%%LNG_HLP_BounceEmail%%
                        </td>
                    </tr>
                    <tr>
                        <td class="EmptyRow" colspan="2"></td>
                    </tr>
                    %%GLOBAL_CronOptions%%
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_AdvancedSendingOptions%%
                        </td>
                    </tr>
                    <tr style="display: %%GLOBAL_DisplayNameOptions%%">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_SendTo_FirstName%%:
                        </td>
                        <td class="inputPadding">
                            <select name="to_firstname" class="form-control Field350">
                                <option value="0">%%LNG_SelectFirstNameOption%%</option>
                                %%GLOBAL_NameOptions%%
                            </select>%%LNG_HLP_SendTo_FirstName%%
                        </td>
                    </tr>
                    <tr style="display: %%GLOBAL_DisplayNameOptions%%">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_SendTo_LastName%%:
                        </td>
                        <td class="inputPadding">
                            <select name="to_lastname" class="form-control Field350">
                                <option value="0">%%LNG_SelectLastNameOption%%</option>
                                %%GLOBAL_NameOptions%%
                            </select>%%LNG_HLP_SendTo_LastName%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_SendMultipart%%
                        </td>
                        <td class="inputPadding">
                            <label for="sendmultipart" class="customCheckBox"><input type="checkbox" name="sendmultipart" id="sendmultipart" value="1" CHECKED>%%LNG_SendMultipartExplain%%<span class="checkmark"></span></label>%%LNG_HLP_SendMultipart%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_TrackOpens%%
                        </td>
                        <td class="inputPadding">
                            <div>
                                <label for="trackopens" class="customCheckBox"><input type="checkbox" name="trackopens" id="trackopens" value="1" CHECKED>
                                    %%LNG_TrackOpensExplain%%
                                <span class="checkmark"></span></label>%%LNG_HLP_TrackOpens%%
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_TrackLinks%%
                        </td>
                        <td class="inputPadding">
                            <div>
                                <label for="tracklinks" class="customCheckBox">
                                    <input type="checkbox" name="tracklinks" id="tracklinks" value="1" CHECKED>%%LNG_TrackLinksExplain%%
                                <span class="checkmark"></span></label>%%LNG_HLP_TrackLinks%%
                            </div>
                            <div id="tracklinks_module_list">
                                <div style="float: left;"><img class="node" width="20" height="20" src="images/nodejoin.gif"/></div>
                                <div style="float: left;">%%GLOBAL_TrackerOptions%%</div>
                            </div>
                        </td>
                    </tr>
                    <tr style="display: %%GLOBAL_DisplayEmbedImages%%">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_EmbedImages%%
                        </td>
                        <td class="inputPadding">
                            <div>
                                <label for="embedimages" class="customCheckBox">
                                    <input type="checkbox" name="embedimages" id="embedimages" value="1"%%GLOBAL_EmbedImages%%>%%LNG_EmbedImagesExplain%%
                                <span class="checkmark"></span></label>%%LNG_HLP_EmbedImages%%
                            </div>
                        </td>
                    </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain">
                    <tr>
                        <td class="submitTableBtn FieldLabel"></td>
                        <td valign="top" height="30">
                            <input class="FormButton btn save-btn" type="submit" value="%%LNG_Next%%" />
                            <input class="FormButton btn cancel-btn CancelButton" type="button" value="%%LNG_Cancel%%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>
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
    width:280px;
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
    width:20em;
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
@media screen and (max-width:1024px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px !important;    
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
        width:280px;
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
        width:20em !important;
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
    width: 97.5%;}
}
@media screen and (max-width:823px){
    .multiselectTd{
        display:inline;
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
        width:250px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -145px !important;
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
        width:18em !important;
    }
    .secondTd{
    padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        display:inline;
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
        width: 97%;
        margin: 0 10px 10px 10px;
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
    .node{
        padding-top: 20px;
    }
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
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
    .node{
        padding-top: 20px;
    }
    .BodyContainer {
        width: 97%;
        margin: 0 10px 10px 10px;
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
        width:70px;
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
        width:140px !important;
    }
    .Field350 {
        width:140px !important;
        padding-right:0px;
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
    .node{
        padding-top: 20px;
    }
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:320px){
    .BodyContainer {
        width: 93%;
        margin: 0 10px 10px 10px;
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
        width:45px;
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
        width:10em !important;
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
    .node{
        padding-top: 20px;
    }
}
</style>

