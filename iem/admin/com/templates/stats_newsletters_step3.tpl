<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td>

            <div class="Heading1 col-sm-6 Heading1New">%%LNG_Stats_NewsletterStatistics%% for &quot;%%GLOBAL_NewsletterName%%&quot;</div>

            <script>
                var TabSize = 6;
            </script>

            <div>
                <br>
                <div class="tabLinksStats" style="margin:10px 0px;">
                <ul id="tabnav" class="tabnav">
                    <li><a href="#" class="active" onClick="ShowTab(1)" id="tab1">%%LNG_NewsletterStatistics_Snapshot%%</a></li>
                    <li><a href="#" onClick="ShowTab(2)" id="tab2">%%LNG_NewsletterStatistics_Snapshot_OpenStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(3)" id="tab3">%%LNG_NewsletterStatistics_Snapshot_LinkStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(4)" id="tab4">%%LNG_NewsletterStatistics_Snapshot_BounceStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(5)" id="tab5">%%LNG_NewsletterStatistics_Snapshot_UnsubscribeStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(6)" id="tab6">%%LNG_NewsletterStatistics_Snapshot_ForwardStats%%</a></li>
                </ul>
                </div>
            </div>
            <div id="div1">
                <div class="body pageinfo PageIntroP">
                    <br>%%GLOBAL_SummaryIntro%%
                    <br><br>
                </div>
                <table width="100%" border="0">
                    <tr>
                        <td width="100%" valign="top" >
                            <div class="thirdPartyTable">
                            <table border="0" width="100%" class="Text" cellpadding="5" cellspacing="0">
                                <tr class="Heading3">
                                    <td colspan="2"  align="left">
                                        %%LNG_NewsletterStatistics_Snapshot_Heading%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22" align="left">
                                        &nbsp;%%LNG_NewsletterSubject%%
                                    </td>
                                    <td   align="left">
                                        <a title="%%LNG_PreviewThisNewsletter%%" href="#" onclick="PreparePreview();
                                                return false;">%%GLOBAL_NewsletterSubject%%</a>
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td height="22"  align="left">
                                        &nbsp;%%LNG_Stats_Newsletters_SelectList_Intro%%
                                    </td>
                                    <td   align="left">
                                        <a title="%%LNG_EditThisNewsletter%%" href="index.php?Page=Newsletters&Action=Edit&id=%%GLOBAL_NewsletterID%%">%%GLOBAL_NewsletterName%%</a>
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left" valign="top">
                                        &nbsp;%%GLOBAL_SentToLists%%
                                    </td>
                                    <td  height="22"  align="left" valign="top">
                                        %%GLOBAL_MailingLists%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left">
                                        &nbsp;%%LNG_NewsletterStatistics_StartSending%%
                                    </td>
                                    <td   align="left">
                                        %%GLOBAL_StartSending%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left">
                                        &nbsp;%%LNG_NewsletterStatistics_FinishSending%%
                                    </td>
                                    <td   align="left">
                                        %%GLOBAL_FinishSending%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left">
                                        &nbsp;%%LNG_NewsletterStatistics_SendingTime%%
                                    </td>
                                    <td   align="left">
                                        %%GLOBAL_SendingTime%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left" valign="top">
                                        &nbsp;%%LNG_NewsletterStatistics_SentTo%%
                                    </td>
                                    <td   align="left">
                                        %%GLOBAL_SentToDetails%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left" valign="top">
                                        &nbsp;%%LNG_NewsletterStatistics_SentBy%%
                                    </td>
                                    <td   align="left">
                                        <a href="mailto:%%GLOBAL_UserEmail%%">%%GLOBAL_SentBy%%</a>
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left" valign="top">
                                        &nbsp;%%LNG_NewsletterStatistics_Opened%%
                                    </td>
                                    <td   align="left">
                                        <a href="%%GLOBAL_OpensURL%%" title="%%LNG_Stats_TotalOpens_Description%%">%%GLOBAL_TotalOpens%%</a>
                                        /
                                        <a href="%%GLOBAL_UniqueOpensURL%%" title="%%LNG_Stats_TotalUniqueOpens_Description%%">%%GLOBAL_UniqueOpens%%</a>
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left" valign="top">
                                        &nbsp;%%LNG_OpenRate%%
                                    </td>
                                    <td   align="left">
                                        %%GLOBAL_OpenRate%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left" valign="top">
                                        &nbsp;%%LNG_Stats_Clickthrough%%:
                                    </td>
                                    <td   align="left">
                                        %%GLOBAL_ClickThroughRate%%
                                    </td>
                                </tr>
                                <tr class="GridRow">
                                    <td  height="22"  align="left" valign="top">
                                        &nbsp;%%LNG_NewsletterStatistics_Bounced%%
                                    </td>
                                    <td   align="left">
                                        %%GLOBAL_TotalBounces%%
                                    </td>
                                </tr>
                            </table>
                            </div>
                        </td>

                        <td></td>

                    </tr><tr>
                        <td width="55%">
                            %%GLOBAL_SummaryChart%%
                        </td>
                    </tr>
                </table>
            </div>
            %%GLOBAL_OpensPage%%
            %%GLOBAL_LinksPage%%
            %%GLOBAL_BouncesPage%%
            %%GLOBAL_UnsubscribesPage%%
            %%GLOBAL_ForwardsPage%%

            <script>
                function PreparePreview() {
                    var openurl = "index.php?Page=Newsletters&Action=View&id=%%GLOBAL_NewsletterID%%";
                    window.open(openurl, "pp");
                }
            </script>

        </td>
    </tr>
</table>
<style>
.rborder {
    border: 1px solid #ccc;
    margin-top: 15px;
    width: 100% !important;
}
.graph-info {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    margin-top: 15px;
    }
.graph-info li {
    border: 1px solid #ccc;
    font-size: 14px;
	font-family: 'Roboto', Arial, Tahoma, sans-serif;
    padding: 8px 15px;
    background:#fff;
    margin-right:-1px;
    margin-bottom:-1px;
    min-height: 39px;
    min-width: 33.39%;
}

 


.graph-info li .HelpText {
    border-bottom: 0px dotted #28609b;
}
.graph-TR {
	display: flex;
    flex-direction: column;
}
.paging-table {
	margin-top:22px !important;
}
.d-flex {
    flex-wrap: wrap;
}
.graph-TR td {
	vertical-align: middle !important;
}
.thirdPartyTable {
    margin-top: 25px;
}
#chooselink, #choosebt {
    width: 200px;
    float: left;
}
#total_open_explain, #total_uniqueopen_explain {
    z-index: 99;
}
.BodyContainer {
    width: 98%;
    margin: 0 10px 10px 10px;
}
.statTable td {
	text-align: center !important;
}
.statTable tr td:first-child {
	text-align: left!important;
}
.snapshotTab td {
	text-align: left;
	padding: 10px;
	word-wrap: break-word;
	border-top: none;
}
.snapshotTab tr:nth-child(even) {
	background-color: #f2f2f2;
}
.GridRow:nth-child(even) {
	background-color: #f2f2f2;
}
.Intro {
	font-size: 14px;
	font-family: 'Roboto', Arial, Tahoma, sans-serif;
	padding: 0px 0px 3px 10px;
}
* {
	font-family: "Roboto", Arial, Tahoma, sans-serif;
	font-size: 14px;
}
.tabnav {
	height: 36px !important;
}
.tabnav li a.active {
	background-color: #0D5085 !important;
	background-image: none !important;
	color: #FFFFFF !important;
}
.tabnav a:link,
.tabnav a:visited {
	font-family: 'Roboto', Arial, Tahoma, sans-serif !important;
	font-size: 14px !important;
	padding: 10px 12px !important;
	background-color: #cbd4d7 !important;
	color: #000000 !important;
	background-image: none !important;
	font-weight: 600 !important;
}
div.columnChartDiv {
	width: 900px;
}
.Heading3 td {
	padding: 10px;
}
.customdates > .form-control {
	display: inline;
}
.calenderDate {
	width: auto !important;
	height: 30px !important;
    padding:0;
}
.calenderMonth {
	width: auto !important;
	height: 30px !important;
    padding:0;
}
.calenderYear {
	width: auto !important;
	height: 30px !important;
    padding:0;
}
.CalendarSelect {
	height: 35px;
	width: 135px;
}
.goButton {
	height: 35px !important;
}
.GridRow:nth-child(even) {
	background-color: #f2f2f2;
}
.GridRow:nth-child(odd) {
	background-color: #fff;
}
.GridRow td {
	text-align: left;
	padding: 10px;
	word-wrap: break-word;
}
.pageSummaryTable {
	margin-top: 15px;
}
@media screen and (max-width: 1700px) {
	div.columnChart {
		width: 93.5vw !important;
		overflow-x: hidden !important;
	}
}
@media screen and (max-width: 1040px) {
	div.columnChart {
		width: 925px !important;
		overflow-x: auto !important;
	}
}
@media screen and (max-width: 1024px) {
	div.columnChart {
		width: 890px !important;
		overflow-x: auto !important;
	}
}
@media screen and (max-width: 780px) {
	.BodyContainer {
		width: 97.5%;
		margin: 0 10px 10px 10px;
	}
	.graph-info li {
    	min-width: 50%;
	}
    div.thirdPartyTable {
    	width: 93vw !important;
    	overflow-x: scroll !important;
    }
    .graph-TR {
        display: flex;
        flex-direction: column;
    }
    .dateTable tr {
    	display: flex;
    	flex-wrap: wrap;
    }
    .dateTD1 {
        padding-top: 6px;
        width: 115px;
    }
	div.columnChart {
		width: 715px !important;
		overflow-x: hidden !important;
	}
	.columnChart, .pieChart {
		width: 90vw;
		overflow-x: scroll;
	}
	.pieChartDiv {
		width:750px !important;
	}
	.dateTable tr {
		display: flex;
		flex-wrap: wrap;
	}
	.columnChartDiv {
		width: 750px !important;
	}
	.dateTable {
		width: 100wv;
	}
	.dateTD1 {
		padding-top: 6px;
	}
	.customdates {
		padding-left: 110px;
	}
}
@media screen and (max-width: 768px) {
	.graph-info li {
    	width: 100%;
    	min-width: 100%;
	}
	.graph-info li {
    	font-size: 14px;
	}
	.tabnav a:link,
	.tabnav a:visited {
		padding: 10px 7px 10px 11px!important;
		width: 165px;
		text-align: center;
		margin-bottom: 4px;
		height:45px;
		width: auto;
		padding: 13px 12px !important;
	}

	.tabnav {
		height: 96px !important;
	}
	.customdates {
    padding-left: 0px;
	}
	div.columnChart {
    width: 90vw !important;
    overflow-x: auto !important;
	}
	.contact-list-menu {
		height:94px !important;
	}
}
@media screen and (max-width: 767px) {
	tr.d-flex.justify-content-between.align-items-center.pagingNew.margin td {
		width: 100%;
		margin: 10px 0;
	}
	tr.d-flex.justify-content-between.align-items-center.pagingNew.margin {
		flex-direction: column;
		display: flex;
	}
}
@media screen and (max-width: 540px) {
	.tabnav a:link,
	.tabnav a:visited {
		padding: 10px 7px 10px 11px!important;
		width: 100%;
		text-align: center;
		margin-bottom: 4px;
	}
	.tabLinksStats {
		margin:0px !important;
	}
	.tabnav {
		height: 341px !important;
		padding-left: 0px !important;
	}
	div.columnChart {
		width: 480px !important;
		overflow-x: scroll !important;
	}
	.BodyContainer {
		width: 100%;
		margin: 0 0px 0px 2px;
	}
    customdates {
    padding-left: 0px;
    }
    .toCalenderdate {
    margin-left: 0px !important;
    }
    div.thirdPartyTable {
    	width: 90vw !important;
    	overflow-x: scroll !important;
    }
}
@media screen and (max-width: 480px) {
	div.columnChart {
		width: 353px !important;
		overflow-x: scroll !important;
	}
	.toCalenderdate {
		margin-left: 106px !important;
	}
	.customdates {
		padding-left: 106px;
	}
}
@media screen and (max-width: 414px) {
	div.columnChart {
		width: 353px !important;
		overflow-x: scroll !important;
	}
	.toCalenderdate {
		margin-left: 106px !important;
	}
    .customdates {
        padding-left: 0px;
    }
}
@media screen and (max-width: 411px) {
	.tabnav a:link,
	.tabnav a:visited {
		padding: 10px 7px 10px 11px!important;
		width: 100%;
		text-align: center;
		margin-bottom: 4px;
	}
	.tabLinksStats {
		margin:0px !important;
	}
	.tabnav {
		height: 277px !important;
		padding-left: 0px !important;
	}
	div.columnChart {
		width: 350px !important;
		overflow-x: scroll !important;
	}
	.BodyContainer {
		width: 100%;
		margin: 0 0px 0px 2px;
	}
    customdates {
    padding-left: 0px;
    }
    .toCalenderdate {
    margin-left: 0px !important;
    }
}
@media screen and (max-width: 375px) {
	div.columnChart {
		width: 280px !important;
		overflow-x: scroll !important;
	}
	.tabnav {
		height: 212px !important;
	}
}
@media screen and (max-width: 360px) {
	div.columnChart {
		width: 300px !important;
		overflow-x: scroll !important;
	}
}
@media screen and (max-width: 320px) {
	#wrapper.active .page-container {
    padding-left: 10px;
	}
	.header-chart {
		padding:2px !important;
		font-size:14px !important;
	}
	.BodyContainer {
		width: 100%;
		margin: 0 0px 0px 0px;
	}
	.tabnav {
		height: 291px !important;
		padding-left: 0px !important;
	}
	div.columnChart {
		width: 270px !important;
		overflow-x: scroll !important;
	}
	.goButton {
		height: 40px;
		width: 40px;
		border-radius: 5px;
		margin-left: 5px;
		border: 1px solid #ccc;
		background-color: #ffff;
	}
}
@media screen and (min-width: 1000px) {
	.columnChartDiv {
		width: 800px;
	}
	.active .columnChartDiv {
		width: 100%;
	}
}
</style>

<script>
	$(document).ready(function(){
		if ($(window).width() < 414) {
		$(window).resize(function() {
		$('.rborder').width($(window).width() - 46);
		});
		$(window).trigger('resize');
		}
	});
</script>