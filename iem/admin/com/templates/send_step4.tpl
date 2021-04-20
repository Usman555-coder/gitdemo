<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">
            %%LNG_Send_Step4%%
        </td>
    </tr>
    <tr>
        <td>
            %%GLOBAL_Messages%%
        </td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP">
                %%GLOBAL_SentToTestListWarning%%
                %%GLOBAL_ImageWarning%%
                %%GLOBAL_EmailSizeWarning%%
                %%LNG_Send_Step4_Intro%%
            </p>
            <ul class="sendList" style="font-weight: 500;">
                <li>%%GLOBAL_Send_NewsletterName%%</li>
                <li>%%GLOBAL_Send_NewsletterSubject%%</li>
                <li>%%GLOBAL_Send_SubscriberList%%</li>
                <li>%%GLOBAL_Send_TotalRecipients%%</li>
                %%GLOBAL_ApproximateSendSize%%
                <li>%%LNG_Send_Not_Completed%%</li>
            </ul>
            <br />
        </td>
    </tr>
    <tr>
        <td class="body">
            <input type="button" value="%%LNG_StartSending%%" class=" FormButton_wide SaveAddButton btn save-btn SmallButton" style="font-weight:bold; width:220px" onclick="javascript: PopupWindow();">
            <input type="button" value="%%LNG_Cancel%%" class=" FormButton_wide SaveAddButton btn cancel-btn FormButton" onclick="if (confirm('%%LNG_ConfirmCancelSend%%'))
                   {document.location='index.php?Page=Newsletters';}">
        </td>
    </tr>
</table>
<script>
    function PopupWindow() {
        var top = screen.height / 2 - (170);
        var left = screen.width / 2 - (225);

        if (confirm('%%LNG_PopupSendWarning%%')) {
            window.open("index.php?Page=Send&Action=Send&Job=%%GLOBAL_JobID%%", "sendWin", "left=" + left + ",top=" + top + ",toolbar=false,status=no,directories=false,menubar=false,scrollbars=false,resizable=false,copyhistory=false,width=480,height=290");
        }
    }
</script>
<style>
.BodyContainer {
    width: 98%;
    margin: 0 10px 10px 10px;
}
.ContentContainer ul li b {
    font-weight: 600 !important;
}
.warningOldStyle {
    word-break: break-all !important;
}
.warningOldStyle img:nth-child(1) {
    margin-top: -5px !important;
    margin-bottom: -5px !important;
}
.warningOldStyle br {
    margin:10px 0px !important;
    content: "";
    display: block;
}
@media screen and (max-width:1024px){
    .BodyContainer {
        width: 98%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:768px){
    .BodyContainer {
        width: 97.5%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:414px){
    .BodyContainer {
        width: 95%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:411px){
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:375px){
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:360px){
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:320px){
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
    .FormButton_wide {
        margin-bottom: 10px !important;
    }
}
</style>
