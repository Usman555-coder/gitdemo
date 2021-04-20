<div id="div2" style="display:none">
    <div class="body Intro PageIntroP">
        <br>%%GLOBAL_DisplayOpensIntro%%
        <br><br>
    </div>

    <div>
        %%GLOBAL_Calendar%%
    </div>

    <br>

    <div class="table-responsive">
        <table class="open-table">
        <tr class="graph-TR">
            <td>
                <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;%%LNG_Opens_Summary%%</div>
                <ul class="graph-info">
                    <li>%%LNG_TotalEmails%%%%GLOBAL_TotalEmails%%</li>
                    <li>
                        <span class="HelpText" onmouseover="ShowHelp('total_open_explain', '%%LNG_TotalOpens%%', '%%LNG_Stats_TotalOpens_Description%%');" onmouseout="HideHelp('total_open_explain');">%%LNG_TotalOpens%%%%GLOBAL_TotalOpens%%</span>
                        <div id="total_open_explain" style="display:none;"></div>
                    </li>
                    <li>%%LNG_MostOpens%%%%GLOBAL_MostOpens%%</li>
                    <li>
                        <span class="HelpText" onmouseover="ShowHelp('total_uniqueopen_explain', '%%LNG_TotalUniqueOpens%%', '%%LNG_Stats_TotalUniqueOpens_Description%%');" onmouseout="HideHelp('total_uniqueopen_explain');">%%LNG_TotalUniqueOpens%%%%GLOBAL_TotalUniqueOpens%%</span>
                        <div id="total_uniqueopen_explain" style="display:none;"></div>
                    </li>
                    <li>%%LNG_AverageOpens%%%%GLOBAL_AverageOpens%%</li>
                    <li>%%LNG_OpenRate%%%%GLOBAL_OpenRate%%</li>
                </ul>
            </td>
        </tr>
         <tr>
            <td>
                <div class="rborder">
                    %%GLOBAL_OpenChart%%
                </div>
            </td>
        </tr>
    </table>
    </div>

    %%GLOBAL_Loading_Indicator%%
    <div id="adminTable%%GLOBAL_TableType%%"></div>

    <script>
        REMOTE_admin_table($("#adminTable%%GLOBAL_TableType%%"), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', 1, 'opened', 'down');
    </script>
</div>
