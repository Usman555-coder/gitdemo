<div id="div5" style="display:none">
    <div class="body">
        <br>%%GLOBAL_DisplayUnsubscribesIntro%%
        <br><br>
    </div>

    <div>
        %%GLOBAL_Calendar%%
    </div>
    <br>

    <div class="table-responsive">
        <table class="open-table">
            <tr class="graph-TR"><td valign=top style="vertical-align:top;">
                    <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;%%LNG_Unsubscribe_Summary%%</div>
                    <UL class="graph-info"> 
                        <LI>%%LNG_Stats_TotalUnsubscribes%%: %%GLOBAL_TotalUnsubscribes%%</li>
                        <LI>%%LNG_Stats_MostUnsubscribes%%: %%GLOBAL_MostUnsubscribes%%</li>
                    </UL>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="rborder">
                        %%GLOBAL_UnsubscribeChart%%
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!-- stats_step3_unsubscribes_table -->
    %%GLOBAL_Loading_Indicator%%
    <div id="adminTable%%GLOBAL_TableType%%"></div>

    <script>
        REMOTE_admin_table($("#adminTable%%GLOBAL_TableType%%"), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', 1, 'email', 'up');
    </script>
    <br><br>
</div>
</div>
