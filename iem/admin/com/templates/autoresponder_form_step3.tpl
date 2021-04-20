<form method="post" action="index.php?Page=Autoresponders&Action=%%GLOBAL_Action%%"  onsubmit="return CheckForm()" autocomplete="off">
    <table cellspacing="0" cellpadding="0" width="100%" align="center"  style="position:relative ; border-collapse: collapse;">
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
            <td style="font-size:13px;color: #212529;">
                %%GLOBAL_CronWarning%%
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" style="margin-top:10px ; border-bottom:0px" class="Panel" id="AutoresponderDetails">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_AutoresponderDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_SendFromName%%
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="sendfromname" class="form-control Field350" value="%%GLOBAL_SendFromName%%">%%LNG_HLP_SendFromName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_SendFromEmail%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="sendfromemail"class="form-control Field350" value="%%GLOBAL_SendFromEmail%%">%%LNG_HLP_SendFromEmail%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_ReplyToEmail%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="replytoemail" class="form-control Field350" value="%%GLOBAL_ReplyToEmail%%">%%LNG_HLP_ReplyToEmail%%
                        </td>
                    </tr>
                    <tr style="display: %%GLOBAL_ShowBounceInfo%%" class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_BounceEmail%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="bounceemail" class="form-control Field350" value="%%GLOBAL_BounceEmail%%">%%LNG_HLP_BounceEmail%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_EmailFormat%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="format"  class="form-control Field350" onChange="adjustHtmlEmailPreferences();">
                                %%GLOBAL_FormatList%%
                            </select>%%LNG_HLP_EmailFormat%%
                        </td>
                    </tr>
                    <tr class="whiteBackground" style="display: %%GLOBAL_DisplayNameOptions%%">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_SendTo_FirstName%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="to_firstname" class="form-control Field350">
                                %%GLOBAL_FirstNameOptions%%
                            </select>%%LNG_HLP_SendTo_FirstName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground" style="display: %%GLOBAL_DisplayNameOptions%%">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_SendTo_LastName%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="to_lastname" class="form-control Field350">
                                %%GLOBAL_LastNameOptions%%
                            </select>%%LNG_HLP_SendTo_LastName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_AutoresponderIncludeExisting%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label for="includeexisting" class="customCheckBox"><input type="checkbox" class="form-control" name="includeexisting" id="includeexisting" value="1" onClick="javascript: checkExisting(this, '%%GLOBAL_AutoresponderID%%');">%%LNG_AutoresponderIncludeExistingExplain%%
                            <span class="checkmark">
                            </label>%%LNG_HLP_AutoresponderIncludeExisting%%
                        </td>
                    </tr>
                </table>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" id="FormatDetails_Panel" style="margin-top:10px ; border-bottom:0px">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_SchedulingDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_HoursDelayed%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customRadio" for="timeASAP"><input class="form-control" name="sendWhen" type="radio" id="timeASAP" /> %%LNG_Autoresponder_Send_ASAP%%
                            <span class="checkmarkRadio"></span>
                            </label> %%LNG_HLP_HoursDelayed%%
                            <br />
                            <div>
                            <label class="customRadio" for="timeCustom"><input class="form-control"  name="sendWhen" type="radio" id="timeCustom" /> %%LNG_Autoresponder_Send_Custom%%:
                            <span class="checkmarkRadio"></span>
                            </label>
                            </div>
                            <img src="images/nodejoin.gif" style="padding-left:20px; padding-top:2px" align="left" />
                            <input id="hoursafter" type="text" value="%%GLOBAL_HoursAfterSubscription%%" class="form-control Field350" style="width:40px" onclick="document.getElementById('timeCustom').checked = true;" />
                            <select id="hoursInPeriod" class="form-control Field350 customSelect" style="width:95px" onchange="document.getElementById('timeCustom').checked = true;" onclick="document.getElementById('timeCustom').checked = true;">
                                <option value="1" SELECTED="SELECTED">%%LNG_Autoresponder_Period_Hours%%</option>
                                <option value="24">%%LNG_Autoresponder_Period_Days%%</option>
                                <option value="168">%%LNG_Autoresponder_Period_Weeks%%</option>
                                <option value="672">%%LNG_Autoresponder_Period_Months%%</option>
                                <option value="8064">%%LNG_Autoresponder_Period_Years%%</option>
                            </select>
                            <input type="hidden" id="hoursaftersubscription" name="hoursaftersubscription" class="Field" style="width: 40px;" value="%%GLOBAL_HoursAfterSubscription%%">
                        </td>
                    </tr>
                </table>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style=" margin-top:10px ; border-bottom:none;" id="FormatDetails_Panel">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_FormatDetails%%
                        </td>
                    </tr>
                    <tr id="HTMLFormatDetails1" class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_SendMultipart%%
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customCheckBox" for="multipart"><input  class="form-control" type="checkbox" name="multipart" id="multipart" value="1" %%GLOBAL_multipart%%>%%LNG_SendMultipartExplain%%
                            <span class="checkmark">
                            </label>%%LNG_HLP_SendMultipart%%
                        </td>
                    </tr>
                    <tr id="HTMLFormatDetails2" class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_TrackOpens%%
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customCheckBox" for="trackopens"><input class="form-control" type="checkbox" name="trackopens" id="trackopens" value="1" %%GLOBAL_trackopens%%>%%LNG_TrackOpensExplain%%
                            <span class="checkmark">
                            </label>%%LNG_HLP_TrackOpens%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_TrackLinks%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customCheckBox" for="tracklinks"><input class="form-control" type="checkbox" name="tracklinks" id="tracklinks" value="1" %%GLOBAL_tracklinks%%>%%LNG_TrackLinksExplain%%
                            <span class="checkmark">
                            </label>%%LNG_HLP_TrackLinks%%
                        </td>
                    </tr>
                    <tr class="whiteBackground" id="HTMLFormatDetails3" style="display: none;">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_EmbedImages%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customCheckBox" for="embedimages"><input class="form-control" type="checkbox" name="embedimages" id="embedimages" value="1" %%GLOBAL_embedimages%%>%%LNG_EmbedImagesExplain%%
                            <span class="checkmark">
                            </label>%%LNG_HLP_EmbedImages%%
                        </td>
                    </tr>
                </table>
                <div style="display: %%GLOBAL_HideCompleteTemplateList%%">
                    <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style=" margin-top:10px ; border-bottom:none;display:none;" id="TemplateDetails" style="margin-bottom: 0;">
                        <tr>
                            <td colspan="3" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                                %%LNG_TemplateDetails%%
                            </td>
                        </tr>
                        <tr  class="whiteBackground" style="display: %%GLOBAL_DisplayTemplateList%%">
                            <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label" valign="top">
                                {template="Not_Required"}
                                %%LNG_Autoresponder_I_Want_To%%:
                            </td>
                            <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.30rem;  color: #000;" valign="top">
                                <label for="noTpl" class="customRadio"><input type="radio"  class="form-control" checked="checked" onclick="$('#chooseATemplate').hide()" id="noTpl" name="AutoresponderContent" /> %%LNG_Autoresponder_From_Scratch%%
                                <span class="checkmarkRadio"></span>
                                </label><br />
                                <div style="padding-bottom:5px"> <label class="customRadio" for="useTpl">%%LNG_Autoresponder_From_Tpl%%<input class="form-control" type="radio" onclick="$('#chooseATemplate').show()" id="useTpl" name="AutoresponderContent" />
                                 <span class="checkmarkRadio"></span>
                                </label> %%LNG_HLP_ChooseTemplate%%</div>
                                <table border="0" id="chooseATemplate" style="display:none">
                                    <tr>
                                        <td valign="top">
                                            %%GLOBAL_TemplateList%%
                                            <div class="previewDiv" style="float:right; width: 255px; text-align: center; display: %%GLOBAL_DisplayTemplateList%%">
                                                <div><a href="javascript:void(0);" onclick="javascript:ShowPreview();"><img id="imgPreview" src="images/nopreview.gif" width="247" height="200" style="border: 1px solid black" onerror="this.src='images/nopreview.gif';"></a></div>
                                                <div style="padding-top: 10px;"><a href="#" onclick="javascript:ShowPreview();
                                                        return false;"><img src="images/magnify.gif" border="0" style="padding-right:5px">%%LNG_Preview_Template%%</a></div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
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
    var ShowEmbed = %%GLOBAL_ShowEmbed%%;
            function CheckForm() {
                // Set the value of the hoursaftersubscription field because we've changed the way we show
                // when the autoresponder will be sent (added by Mitch during alpha testing for IEM5)
                var num_hours = 0;
                var base_date = $('#hoursInPeriod').val();
                var hoursafter = document.getElementById('hoursafter');

                // Is the number (days, hours, etc) valid?
                if (document.getElementById('timeCustom').checked) {
                    if ((isNaN(hoursafter.value) || hoursafter.value == '' || parseInt(hoursafter.value) < 0)) {
                        // Invalid time period
                        alert('%%LNG_Autoresponder_Valid_Time%%');
                        hoursafter.focus();
                        hoursafter.select();
                        return false;
                    } else {
                        // Valid details, convert to hours
                        num_hours = parseInt(hoursafter.value) * parseInt(base_date);
                    }
                } else {
                    // Sending immediately, so its zero - do nothing
                }

                document.getElementById('hoursaftersubscription').value = num_hours;
                return true;
            }

    function checkExisting(frm, id)
    {
        // we unchecked the box? no problem.
        if (!frm.checked) {
            return;
        }

        // if the id is 0, then we're creating an autoresponder and don't care about this being checked.
        var int_id = parseInt(id);
        if (int_id == 0 || isNaN(int_id)) {
            return;
        }

        $.ajax({
            type: 'post',
            url: 'remote.php',
            data: 'what=check_existing&auto=' + id,
            success: function (msg) {
                if (msg.length > 0) {
                    alert(msg);
                }
            }
        });
    }

    function changeHours(frm) {
        var selected = frm.selectedIndex;
        var hrs = frm[selected].value;
        if (hrs > -1) {
            document.getElementById('hoursaftersubscription').value = hrs;
        }
    }
    function adjustHtmlEmailPreferences() {
        var selected = document.forms[0].format;
        if (selected.options[selected.selectedIndex].value == 't') {
            document.getElementById('HTMLFormatDetails1').style.display = 'none';
            document.getElementById('HTMLFormatDetails2').style.display = 'none';
            if (ShowEmbed) {
                document.getElementById('HTMLFormatDetails3').style.display = 'none';
            }
            document.getElementById('FormatDetails_Panel').style.marginBottom = '0px';
            document.getElementById('TemplateDetails').style.display = 'none';
        } else {
            document.getElementById('FormatDetails_Panel').style.marginBottom = '20px';
            document.getElementById('HTMLFormatDetails1').style.display = '';
            document.getElementById('HTMLFormatDetails2').style.display = '';

            if (ShowEmbed) {
                document.getElementById('HTMLFormatDetails3').style.display = '';
            }

            document.getElementById('TemplateDetails').style.display = '';
        }
    }

    $(document).ready(function () {
        adjustHtmlEmailPreferences();

        if ($('#hoursaftersubscription').val() == 0) {
            $('#timeASAP').click();
        } else {
            $('#timeCustom').click();
        }
    });

</script>
<style>
#TemplateID {
    float:left;
    height:200px;
}
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
    font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:20em; font-size:14px ; padding-top: 1.35rem; padding-left:18px;  color: #000;
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
    width:282px;
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
    width:20em;
}
.Panel td {
    font-size:14px;
}
#hoursafter {
    width:40px !important;
}
#hoursInPeriod {
    width:95px !important;
}
.BodyContainer {
    width: 98.5%;
    margin: 0 10px 10px 10px;
}
@media screen and (max-width:1024px){
    .BodyContainer {
        width: 98%;
        margin: 0 10px 10px 10px;
    }
    #chooseATemplate {
        margin-top:10px;
    }
    table br {
        margin: 10px 0px !important;
        content: "";
        display: block;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:auto;
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
    .BodyContainer {
        width: 98%;
        margin: 0 10px 10px 10px;
    }
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
    .BodyContainer {
        width: 97.5%;
        margin: 0 10px 10px 10px;
    }
    #TemplateID, .previewDiv {
        width:50% !important;
    }
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
        width:auto;
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
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
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
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
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
    #hoursInPeriod {
        width: 80px !important;
    }
    
    #TemplateID, .previewDiv {
        width:100% !important;
    }
    #TemplateID {
        margin-bottom:10px;
    }
    .BodyContainer {
        width: 93%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:411px){
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
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
    #hoursInPeriod {
        width: 80px !important;
    }
    
    #TemplateID, .previewDiv {
        width:100% !important;
    }
    #TemplateID {
        margin-bottom:10px;
    }
    .BodyContainer {
        width: 93%;
        margin: 0 10px 10px 10px;
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
    #hoursInPeriod {
        width: 60px !important;
    }
    
    #TemplateID, .previewDiv {
        width:100% !important;
    }
    #TemplateID {
        margin-bottom:10px;
    }
    .BodyContainer {
        width: 93%;
        margin: 0 10px 10px 10px;
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
        width:11em !important;
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
    #hoursInPeriod {
        width: 60px !important;
    }
    
    #TemplateID, .previewDiv {
        width:100% !important;
    }
    #TemplateID {
        margin-bottom:10px;
    }
    .BodyContainer {
        width: 93%;
        margin: 0 10px 10px 10px;
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
    #hoursInPeriod {
        width: 60px !important;
        padding: 0px 0px;
    }
    #hoursafter {
        width: 60px !important;
        padding: 0px 5px;
    }
    
    #TemplateID, .previewDiv {
        width:100% !important;
    }
    #TemplateID {
        margin-bottom:10px;
    }
    .BodyContainer {
        width: 93%;
        margin: 0 10px 10px 10px;
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
