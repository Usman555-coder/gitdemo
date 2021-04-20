<div id="div6" style="display:none">
    <div class="body">
        <br>%%GLOBAL_DisplayForwardsIntro%%
        <br><br>
    </div>

    <div>
        %%GLOBAL_Calendar%%
    </div>

    <br>

    <div class="table-responsive">
        <table class="open-table">
            <tr>
                <td>
                <div class="MidHeading" style="width:100%">
                    <img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;%%LNG_Forwards_Summary%%
                </div>
                <ul class="graph-info"> 
                    <LI>%%LNG_ListStatsTotalForwards%%%%GLOBAL_TotalForwards%%</li>
                    <LI>%%LNG_ListStatsTotalForwardSignups%%%%GLOBAL_TotalForwardSignups%%</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <div class="rborder">
                    %%GLOBAL_ForwardsChart%%
                </div>
            </td>
        </tr>
    </table>
    </div>

    %%GLOBAL_Loading_Indicator%%
    <div id="adminTable%%GLOBAL_TableType%%"></div>

    <script>
        REMOTE_admin_table($("#adminTable%%GLOBAL_TableType%%"), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', 1, 'email', 'up');
    </script>

    <br><br>
</div>
</div>
