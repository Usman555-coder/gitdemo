<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">
            %%LNG_Send_Resend%%
        </td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP">%%GLOBAL_Send_ResendCount%%%%LNG_Send_Resend_Intro%%</p>
            <ul style="margin-bottom:0px">
                <li>%%GLOBAL_Send_NewsletterName%%</li>
                <li>%%GLOBAL_Send_NewsletterSubject%%</li>
                <li>%%GLOBAL_Send_SubscriberList%%</li>
                <li>%%GLOBAL_Send_TotalRecipients%%</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td class="body">
            <br/>
            <input type="button" value="%%LNG_StartSending%%" class="SmallButton FormButton_wide SaveAddButton btn save-btn" onclick="javascript: PopupWindow();">&nbsp;<input type="button" value="%%LNG_Cancel%%" class="FormButton cancel-btn btn save-btn" onclick="document.location = 'index.php?Page=Newsletters';">
        </td>
    </tr>
</table>
<script>
    function PopupWindow() {
        var top = screen.height / 2 - (170);
        var left = screen.width / 2 - (140);

        window.open("index.php?Page=Send&Action=Send&Job=%%GLOBAL_JobID%%&Resend", "sendWin", "left=" + left + ",top=" + top + ",toolbar=false,status=no,directories=false,menubar=false,scrollbars=false,resizable=false,copyhistory=false,width=360,height=200");
    }
</script>
<style>
.FlashError ul {
    padding-left: 0px;
    padding-top: 20px;
}
.FormButton_wide {
    font-size: 14px;
    width: 210px !important;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
}
.BodyContainer {
    width: 98%;
    margin: 0 10px 10px 10px;
}
.ContentContainer ul li {
    line-height: 22px !important;
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
.pageinfo p {
    margin-top: 0px;
    margin-bottom: 25px;
}
.PageIntroP:empty {
    margin-bottom: 0px !important ;
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
        margin-bottom: 5px;
    }
}
</style>
