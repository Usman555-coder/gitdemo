<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td class="Heading1">%%GLOBAL_Heading%%</td>
    </tr>
    <tr>
        <td class="body pageinfo"><p>%%GLOBAL_Introduction%%</p></td>
    </tr>
    <tr>
    <tr>
        <td>
            <input class="FormButton" type="button" value="%%LNG_Back%%" onClick='document.location = "index.php?Page=Stats";'>
            <br />
            &nbsp;
            <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text">
                <tr>
                    <td colspan="2" class="MidHeading">
                        <img src="images/m_stats.gif" align="middle" width="20" height="20">&nbsp;%%LNG_ViewNewsletterStatistics_Summary%%
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 50px;">
                        %%LNG_NewsletterName%%
                    </td>
                    <td>
                        %%GLOBAL_Newsletter%%
                    </td>
                    <td rowspan="14" width="80%">
                        <script>PrintChart("%%GLOBAL_Chart%%");</script>
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_NewsletterSubject%%
                    </td>
                    <td>
                        %%GLOBAL_NewsletterSubject%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_MailingLists%%
                    </td>
                    <td>
                        %%GLOBAL_MailingList%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_DateStarted%%
                    </td>
                    <td>
                        %%GLOBAL_StartDate%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_DateFinished%%
                    </td>
                    <td>
                        %%GLOBAL_FinishDate%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_TotalRecipients%%
                    </td>
                    <td>
                        %%GLOBAL_TotalRecipients%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_TotalSent%%
                    </td>
                    <td>
                        %%GLOBAL_TotalSent%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_TotalDelivered%%
                    </td>
                    <td>
                        %%GLOBAL_TotalDelivered%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_TotalForwards%%
                    </td>
                    <td>
                        %%GLOBAL_TotalForwards%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_TotalOpens%%
                    </td>
                    <td>
                        %%GLOBAL_TotalOpens%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_TotalUniqueOpens%%
                    </td>
                    <td>
                        %%GLOBAL_TotalUniqueOpens%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_BounceCount%%
                    </td>
                    <td>
                        %%GLOBAL_BounceCount%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_UnsubscribeCount%%
                    </td>
                    <td>
                        %%GLOBAL_UnsubscribeCount%%
                    </td>
                </tr>
                <tr>
                    <td>
                        %%LNG_TotalLinkClicks%%
                    </td>
                    <td>
                        %%GLOBAL_LinkClickCount%%
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <br/>
                        %%GLOBAL_LastOpens%%
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br/>
                        %%GLOBAL_LastUnsubscribes%%
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br/>
                        %%GLOBAL_LastClicks%%
                    </td>
                </tr>

            </table>
        </td>
    </tr>
    %%TPL_Stats_Print_Icons%%
</table>
