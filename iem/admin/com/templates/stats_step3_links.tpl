<div id="div3" style="display:none">
    <div class="body  Intro PageIntroP">
        <br>%%GLOBAL_DisplayLinksIntro%%
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
                        <img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;%%LNG_LinkClicks_Summary%%</div>
                    </div>
                    <ul class="graph-info"> 
                        <LI>%%LNG_Stats_TotalClicks%%: <span id="totalclicks"></span></li>
                        <LI>%%LNG_Stats_TotalUniqueClicks%%: %%GLOBAL_TotalUniqueClicks%%</li>
                        <LI>%%LNG_Stats_UniqueClicks%%: <span id="uniqueclicks">%%GLOBAL_UniqueClicks%%</span></li>
                        <LI>%%LNG_Stats_MostPopularLink%%: <a href="%%GLOBAL_MostPopularLink%%" title="%%GLOBAL_MostPopularLink%%" target="_blank">%%GLOBAL_MostPopularLink_Short%%</a></li>
                        <LI>%%LNG_Stats_AverageClicks%%: <span id="averageclicks"></span></li>
                        <li>%%LNG_Stats_Clickthrough%%: <span id="clickthrough"></span></li>
                    </ul>
                </td>
            </tr>    
            <tr>
                <td>
                    <div class="rborder">
                        %%GLOBAL_LinksChart%%
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <script>
        function ChangeLink(page, column, sort) {
            chooselink_id = document.getElementById('chooselink');
            selected = chooselink_id.selectedIndex;
            linkid = chooselink_id[selected].value;
            REMOTE_parameters = '&link=' + linkid;
            REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', page, column, sort);

            UpdateLinkSummary();
        }

        function UpdateLinkSummary() {
            if (document.getElementById('chooselink')) {
                chooselink_id = document.getElementById('chooselink');
                selected = chooselink_id.selectedIndex;
                linkid = chooselink_id[selected].value;
            } else {
                linkid = 'a';
            }

            // Update link stats
            $.get('remote_stats.php?Action=get_linkstats&link=' + linkid + '&token=%%GLOBAL_TableToken%%', '',
                    function (data) {
                        eval(data);
                        $('#totalclicks').html(linksjson.linkclicks);
                        $('#clickthrough').html(linksjson.clickthrough);
                        $('#averageclicks').html(linksjson.averageclicks);
                        $('#uniqueclicks').html(linksjson.uniqueclicks);
                    }
            );
        }
        UpdateLinkSummary();
    </script>
    %%GLOBAL_Loading_Indicator%%
    <div id="adminTable%%GLOBAL_TableType%%"></div>

    <script>
        REMOTE_admin_table($("#adminTable%%GLOBAL_TableType%%"), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', 1, 'email', 'up');
    </script>
    <br><br>
</div>
</div>
