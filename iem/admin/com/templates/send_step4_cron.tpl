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
            %%GLOBAL_SentToTestListWarning%%
            %%GLOBAL_ImageWarning%%
            %%GLOBAL_EmailSizeWarning%%
            %%LNG_Send_Step4_CronIntro%%
            <ul style="margin-bottom:-5px">
                <li>%%GLOBAL_Send_NewsletterName%%</li>
                <li>%%GLOBAL_Send_NewsletterSubject%%</li>
                <li>%%GLOBAL_Send_SubscriberList%%</li>
                <li>%%GLOBAL_Send_TotalRecipients%%</li>
                <li>%%GLOBAL_Send_ScheduleTime%%</li>
                %%GLOBAL_ApproximateSendSize%%
                <li>%%LNG_Send_Not_Completed%%</li>
            </ul>
            <br />
        </td>
    </tr>
    <tr>
        <td class="body">
            <input type="button" value="%%LNG_ApproveScheduledSend%%" class="FormButton_wide SmallButton btn save-btn" style="width: 205px; font-weight:bold" onclick="document.location = 'index.php?Page=Schedule&A=1';">
            <input type="button" value="%%LNG_Cancel%%" class="FormButton_wide FormButton btn cancel-btn" onclick="if (confirm('%%LNG_ConfirmCancelSchedule%%'))
                   {document.location='index.php?Page=Newsletters';}">
        </td>
    </tr>
</table>
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
.FormButton {
    margin-top: 0px !important;
}
</style>
