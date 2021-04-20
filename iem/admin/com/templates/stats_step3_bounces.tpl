<div id="div4" style="display:none">
    <div class="body">
        <br>%%GLOBAL_DisplayBouncesIntro%%
        <br><br>
    </div>

    <div>
        %%GLOBAL_Calendar%%
    </div>
    <br>

    <div class="table-responsive">
        <table class="open-table">
            <tr class="graph-TR">
                <td valign=top style="vertical-align:top;">
                    <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;%%LNG_Bounce_Summary%%</div>
                    <UL class="graph-info">
                        <LI>%%LNG_Stats_TotalBounces%%%%GLOBAL_TotalBounceCount%%</li>
                        <LI>%%LNG_Stats_TotalSoftBounces%%%%GLOBAL_TotalSoftBounceCount%%</li>
                        <LI>%%LNG_Stats_TotalHardBounces%%%%GLOBAL_TotalHardBounceCount%%</li>
                    </UL>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="rborder">
                        %%GLOBAL_BounceChart%%
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <!-- stats_step3_bounces_table -->
    %%GLOBAL_Loading_Indicator%%
    <div id="adminTable%%GLOBAL_TableType%%"></div>

    <script>
        REMOTE_admin_table($("#adminTable%%GLOBAL_TableType%%"), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', 1, 'time', 'down');
    </script>
    <br><br>
</div>
</div>

<script>
    function ChangeBounceType() {
        cbouncetype = document.getElementById('choosebt');
        selected = cbouncetype.selectedIndex;
        bouncetype = cbouncetype.options[selected].value;
        REMOTE_parameters = '&bouncetype=' + bouncetype;
        REMOTE_admin_table($("#adminTable%%GLOBAL_TableType%%"), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', 1, 'time', 'down');
    }
</script>
