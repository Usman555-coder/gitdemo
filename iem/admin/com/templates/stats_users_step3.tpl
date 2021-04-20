<table cellspacing="0" cellpadding="0" width="100%" align="center" style="margin-top: 15px;">
    <tr>
        <td>

            <div class="Heading1 col-sm-6 Heading1New">%%LNG_Stats_UserStatistics%%</div>

            <script>
                var TabSize = 2;
            </script>

            <div style="margin:10px 0px;">
                <ul id="tabnav" class="tabnav">
                    <li><a href="#" class="active" onClick="ShowTab(1)" id="tab1">%%LNG_Stats_UserStatistics%%</a></li>
                    <li><a href="#" onClick="ShowTab(2)" id="tab2">%%LNG_UserStatistics_Snapshot_EmailsSent%%</a></li>
                </ul>
            </div>

            <div id="div1">
                <div class="Intro body pageinfo">
                    <br>%%GLOBAL_SummaryIntro%%
                </div>
                <table width="100%" border="0">
                    <tr class="snapshotTR">
                        <td valign="top" width="100%" class="snapshotTab">
                            <table border=0 width="100%" class="Text" cellspacing="0">
                                <tr class="Heading3">
                                    <td colspan="2" align="left">
                                        %%LNG_UserStatisticsSnapshot%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22" width="50%" align="left">
                                        %%LNG_Stats_UserCreateDate%%
                                    </td>
                                    <td  align="left" width="50%">
                                        %%GLOBAL_UserCreateDate%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left">
                                        %%LNG_Stats_UserLastLoggedIn%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_LastLoggedInDate%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left">
                                        %%LNG_UserLastNewsletterSent%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_LastNewsletterSentDate%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left">
                                        %%LNG_Stats_TotalLists%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_ListsCreated%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left">
                                        %%LNG_UserAutorespondersCreated%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_AutorespondersCreated%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left">
                                        %%LNG_UserNewslettersSent%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_NewslettersSent%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left">
                                        %%LNG_Stats_TotalEmailsSent%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_EmailsSent%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left" valign="top">
                                        %%LNG_Stats_TotalOpens%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_TotalOpens%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left" valign="top">
                                        %%LNG_Stats_TotalUniqueOpens%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_UniqueOpens%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left" valign="top">
                                        %%LNG_Stats_TotalBounces%%
                                    </td>
                                    <td  align="left">
                                        %%GLOBAL_TotalBounces%%
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="center" width="60%" style="padding:0px" class="snapshotChart">
                            %%GLOBAL_SummaryChart%%
                        </td>
                    </tr>
                </table>
            </div>


            <div id="div2" style="display:none">
                %%GLOBAL_UsersSummaryPage%%
            </div>


        </td>
    </tr>
</table>
<style>
.Intro {
    font-size: 14px;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    padding: 0px 0px 3px 10px;
}
* {
    font-family: "Roboto", Arial, Tahoma, sans-serif;
    font-size:14px;
}
.snapshotTR {
    display:flex;
    flex-direction:column;
}
.snapshotTab {
    vertical-align: top;
}
.snapshotTab tr:nth-child(even) {background-color: #f2f2f2;}
.snapshotTab tr:nth-child(odd) {background-color: #fff;}
.snapshotTab td {
  text-align: left;
  padding: 10px;
  word-wrap: break-word;
  border-top: none;
}
.tabnav {
    height: 36px !important;
}
.tabnav li a.active {
    background-color: #0D5085 !important;
    background-image: none !important;
    color: #FFFFFF !important;
}
.tabnav a:link, .tabnav a:visited {
    font-family: 'Roboto', Arial, Tahoma, sans-serif !important;
    font-size: 14px !important;
    padding: 10px 25px !important;
    background-color: #cbd4d7 !important;
    color: #000000 !important;
    background-image: none !important;
    font-weight: 600 !important;
}
.pieChartDiv {
    width: 93.5vw !important;
    height:400px !important;
}
.BodyContainer {
    width: 98.5%;
    margin: 0 10px 10px 10px;
}
@media screen and (max-width: 1024px) {
    .pieChartDiv {
        width: 800px !important;
        height:400px !important;
    }
    .BodyContainer {
        width: 98%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width: 768px) {
    .pieChart {
        width:100%;
    }
    .pieChartDiv {
        width:700px !important;
    }
}
@media screen and (max-width: 480px) {
    .snapshotTR {
        display: flex;
        flex-direction: column;
    }
    .snapshotTab, .snapshotChart {
        width:100%;
    }
    .snapshotTab td {
        padding: 2px 2px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 0px;
        padding-right: 0px;
    }
    .tabnav a:link, .tabnav a:visited {
        padding: 10px 7px !important;
    }
    .BodyContainer {
        width: 100%;
        margin: 0 10px 10px 0px;
    }
    .pieChart {
        width:350px;
        overflow-x: scroll;
    }
    .pieChartDiv {
        width:750px !important;
    }
}
@media screen and (max-width: 414px) {
    .pieChart {
        width:350px;
        overflow-x: scroll;
    }
    .snapshotTab td {
        padding: 2px 2px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 5px;
        padding-right: 0px;
    }
}
@media screen and (max-width: 411px) {
    .pieChart {
        width:350px;
        overflow-x: scroll;
    }
    .snapshotTab td {
        padding: 2px 2px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 5px;
        padding-right: 0px;
    }
}
@media screen and (max-width: 375px) {
    .pieChart {
        width:315px;
        overflow-x: scroll;
    }
    .snapshotTab td {
        padding: 2px 2px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 5px;
        padding-right: 0px;
    }
}
@media screen and (max-width: 360px) {
    .pieChart {
        width:315px;
        overflow-x: scroll;
    }
    .snapshotTab td {
        padding: 2px 2px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 5px;
        padding-right: 0px;
    }
}
@media screen and (max-width: 320px) {
    .pieChart {
        width:280px;
        overflow-x: scroll;
    }
    .snapshotTab td {
        padding: 2px 2px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 5px;
        padding-right: 0px;
    }
    #tabnav {
        height: 20px;
        margin: 0;
        padding-left: 0px;
    }
}
</style>