<script>
	var TabSize = 5;
</script>

<div class="Heading1 col-sm-6 Heading1New">Split Test Statistics for &quot;{$statsDetails.splitname}&quot;</div>
<div>
	<br>
    <div class="tabLinksStats" style="margin:10px 0px;">
		<ul id="tabnav" class="tabnav">
			<li><a href="#" class="active" onClick="ShowTab(1); return false;" id="tab1">%%LNG_NewsletterStatistics_Snapshot%%</a></li>
			<li><a href="#" onClick="ShowTab(2); return false;" id="tab2">%%LNG_NewsletterStatistics_Snapshot_OpenStats%%</a></li>
			<li><a href="#" onClick="ShowTab(3); return false;" id="tab3">%%LNG_NewsletterStatistics_Snapshot_LinkStats%%</a></li>
			<li><a href="#" onClick="ShowTab(4); return false;" id="tab4">%%LNG_NewsletterStatistics_Snapshot_BounceStats%%</a></li>
			<li><a href="#" onClick="ShowTab(5); return false;" id="tab5">%%LNG_NewsletterStatistics_Snapshot_UnsubscribeStats%%</a></li>
		</ul>
		
	</div>

</div>

<div id="div1">
	<br />
	{capture name=winner_summary}
		{if $statsDetails.campaign_winner_type == 'None'}
			<div class="FlashError">
				<img src="images/error.gif" width="18" height="18" align="left" class="FlashError" />
				{$lang.Addon_splittest_WonNone}
			</div>
		{else}
			<div class="FlashSuccess">
				<img src="images/success.gif" width="18" height="18" align="left" class="FlashSuccess" />
				{$statsDetails.winner_message|stripslashes}
			</div>
		{/if}
	{/capture}
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
	  <tr class="Heading3">
	  <td colspan="2" nowrap="nowrap" align="left">
		{$lang.Addon_splittest_Campaign_Statistics}
	  </td>
	</tr>

	<tr>
		<td valign="top">
			{$statsDetails.summary_chart}
			{$winner_summary}
		</td>
	</tr>

	<tr>
		<td width="100%" valign="top">
		  <table border="0" width="100%" cellspacing="0" cellpadding="0">
			<tr class="Heading3">
				<td>{$lang.Addon_splittest_Stats_Snapshot_Heading}</td>
			</tr>
			<tr>
				<td valign="top" rowspan="2">
					<table border="0" class="Text snapshotTab" cellspacing="0" cellpadding="0" width="100%" style="margin:0;">
						<tr class="GridRow">
							<td align="left">
								{$lang.Addon_splittest_Stats_SplitName}
							</td>
							<td align="left">
								{$statsDetails.splitname}
							</td>
						</tr>
						<tr class="GridRow">
							<td align="left">
								{$lang.Addon_splittest_Stats_SplitType}
							</td>
							<td>
								{if $statsDetails.splittype == 'percentage'}
									<span class="HelpText" onMouseOut="HideHelp('active_description');" onMouseOver="ShowQuickHelp('active_description', '{$lang.Addon_splittest_Manage_SplitType_Percentage}', '{$lang.HLP_Addon_splittest_Splittype_Percentage}');">{$lang.Addon_splittest_Manage_SplitType_Percentage}</span>
								{else}
									<span class="HelpText" onMouseOut="HideHelp('active_description');" onMouseOver="ShowQuickHelp('active_description', '{$lang.Addon_splittest_Manage_SplitType_Distributed}', '{$lang.HLP_Addon_splittest_Splittype_Distributed}');">{$lang.Addon_splittest_Manage_SplitType_Distributed}</span>
								{/if}
								<div style="font-weight:normal" id="active_description" style="display:none;"></div>
							</td>
						</tr>
						<tr class="GridRow">
							<td align="left" valign="top">
								{$lang.Addon_splittest_Stats_ListNames}
							</td>
							<td align="left" valign="top">
								{foreach from=$statsDetails.lists item=list id=sequence}
									<a href="index.php?Page=Subscribers&Action=Manage&Lists[]={$list.listid}">{$list.name}</a>{if !$sequence.last}, {/if}
								{/foreach}
							</td>
						</tr>
						<tr class="GridRow">
							<td align="left" valign="top">
								{$lang.Addon_splittest_Stats_CampaignNames}
							</td>
							<td align="left" valign="top">
								{foreach from=$statsDetails.campaign_statistics.rankings.weighted item=pair id=sequence}
									{capture name=id}{$pair|key}{/capture}
									{alias name=campaign from=$statsDetails.campaigns.$id}
									<a title="{$lang.Addon_splittest_Stats_ViewNewsletterStats}" href="index.php?Page=Stats&Action=Newsletters&SubAction=ViewSummary&id={$campaign.stats_newsletters.statid}">{$campaign.campaign_name}</a>{if !$sequence.last}, {/if} 
								{/foreach}
							</td>
						</tr>
						<tr class="GridRow">
							<td align="left">
								{$lang.Addon_splittest_Stats_DateStarted}
							</td>
							<td align="left">
								{$statsDetails.starttimeprint}
							</td>
						</tr>
						<tr class="GridRow">
							<td align="left">
								{$lang.NewsletterStatistics_FinishSending}
							</td>
							<td align="left">
								{if $statsDetails.finishtime == 0}
									{$lang.Addon_splittest_Stats_FinishTime_NotFinished}
								{else}
									{$statsDetails.finishtimeprint}
								{/if}
							</td>
						</tr>
						<tr class="GridRow">
							<td align="left">
								{$lang.Addon_splittest_TotalSendSize}
							</td>
							<td align="left">
								{$statsDetails.total_recipient_count|number_format}
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</td>
	  </tr>
	 </table>
	 <br/>
 </div>


<!-- Email Open Rates -->
<div id="div2" style="display:none;">
	<br/>
	<table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text">
		<tr class="Heading3">
		  <td colspan="2" nowrap="nowrap" align="left">
				{$lang.Addon_splittest_SplittestTitle} {$lang.NewsletterStatistics_Snapshot_OpenStats}
			</td>
		</tr>

		<tr>
			<td width="100%" valign="top">
				{$statsDetails.openrate_chart}
				{$winner_summary}
			</td>
		</tr>

		<tr>
		  <td valign="top" width="100%">
		  <div class="columnChart">
			  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text statTable ">
				<tr class="Heading3">
					<td width="200" height="22" align="left" valign="top">
						<span>{$lang.Addon_splittest_Stats_EmailCampaigns}</span>
					</td>
					<td align="center">{$lang.Addon_splittest_Stats_TotalOpens}</td>
					<td align="center">{$lang.Addon_splittest_Stats_UniqueOpens}</td>
					<td align="center" style="border-right: 0px solid #EDECEC;">{$lang.Addon_splittest_Stats_UniqueOpens} (%)</td>
					<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients}</td>
					<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients} (%)</td>
					<td align="center">{$lang.Addon_splittest_TotalSendSize}</td>
				</tr>
				{foreach from=$statsDetails.campaign_statistics.rankings.emailopens item=pair}
				<tr class="GridRow">
					{capture name=id}{$pair|key}{/capture}
					{alias name=campaign from=$statsDetails.campaigns.$id}
					<td>
						<a href="index.php?Page=Stats&Action=Newsletters&SubAction=ViewSummary&id={$campaign.stats_newsletters.statid}&tab=3">{$campaign.campaign_name}</a>
					</td>
					<td align="center">{$campaign.stats_newsletters.emailopens}</td>
					<td align="center">{$campaign.stats_newsletters.emailopens_unique}</td>
					<td align="center" style="border-right: 0px solid #EDECEC;">{$campaign.stats_newsletters.percent_emailopens_unique}</td>
					<td align="center">{$campaign.stats_newsletters.recipients|number_format}</td>
					<td align="center">{$campaign.stats_newsletters.final_percent_emailopens_unique}</td>
					<td align="center">{$statsDetails.total_recipient_count|number_format} {$lang.Addon_splittest_Stats_Recipient_s}</td>
				</tr>
				{/foreach}
			  </table>
			  </div>
			</td>
		 </tr>
	</table>
</div>

<!-- Click Rates -->
<div id="div3" style="display:none;">
	<br/>
	<table border="0" width="100%">
	  <tr>
		<td valign="top" width="100%">
		  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text">
			<tr class="Heading3">
				<td colspan="4" nowrap="nowrap" align="left">
					{$lang.Addon_splittest_SplittestTitle} {$lang.NewsletterStatistics_Snapshot_LinkStats}
				</td>
			</tr>

			<tr>
				<td valign="top">
					{$statsDetails.clickrate_chart}
					{$winner_summary}
				</td>
			</tr>

			<tr>
			  <td width="100%">
			  <div class="columnChart">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text statTable">
					<tr class="Heading3">
						<td width="200" height="22" align="left" valign="top">
							<span>{$lang.Addon_splittest_Stats_EmailCampaigns}</span>
						</td>
						<td align="center">{$lang.Addon_splittest_Stats_UniqueClicks}</td>
						<td align="center">{$lang.Addon_splittest_Stats_UniqueClicks} (%)</td>
						<td align="center">{$lang.Addon_splittest_Stats_TotalClicks}</td>
						<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients}</td>
						<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients} (%)</td>
						<td align="center">{$lang.Addon_splittest_TotalSendSize}</td>
					</tr>
					{foreach from=$statsDetails.campaign_statistics.rankings.linkclicks item=pair}
					<tr class="GridRow">
						{capture name=id}{$pair|key}{/capture}
						{alias name=campaign from=$statsDetails.campaigns.$id}
						<td>
							<a href="index.php?Page=Stats&Action=Newsletters&SubAction=ViewSummary&id={$campaign.stats_newsletters.statid}&tab=3">{$campaign.campaign_name}</a>
						</td>
						<td align="center">{$campaign.stats_newsletters.linkclicks_unique}</td>
						<td align="center">{$campaign.stats_newsletters.percent_linkclicks_unique}</td>
						<td align="center">{$campaign.stats_newsletters.linkclicks}</td>
						<td align="center">{$campaign.stats_newsletters.recipients|number_format}</td>
						<td align="center">{$campaign.stats_newsletters.final_percent_linkclicks_unique}</td>
						<td align="center">{$statsDetails.total_recipient_count|number_format} {$lang.Addon_splittest_Stats_Recipient_s}</td>
					</tr>
					{/foreach}
				</table>
				</div>
			  </td>
		  </table>
		</td>
	  </tr>
	</table>
</div>

<!-- Bounce Count -->
<div id="div4" style="display:none;">
	<br/>
	<table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text">
		<tr class="Heading3">
			<td colspan="4" align="left">
				{$lang.Addon_splittest_SplittestTitle} {$lang.NewsletterStatistics_Snapshot_BounceStats}
			</td>
		</tr>

		<tr>
			<td width="100%" valign="top">
				{$statsDetails.bouncerate_chart}
				{$winner_summary}
			</td>
		</tr>

		<tr>
			<td>
			<div class="columnChart">
			  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text statTable">
				<tr class="Heading3">
					<td width="200" height="22" align="left" valign="top">
						<span>{$lang.Addon_splittest_Stats_EmailCampaigns}</span>
					</td>
					<td align="center">{$lang.BounceSoft}</td>
					<td align="center">{$lang.BounceHard}</td>
					<td align="center">{$lang.BounceUnknown}</td>
					<td align="center">{$lang.Addon_splittest_Stats_TotalBounces} (%)</td>
					<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients}</td>
					<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients} (%)</td>
					<td align="center">{$lang.Addon_splittest_TotalSendSize}</td>
				</tr>
				{foreach from=$statsDetails.campaign_statistics.rankings.bouncecount_total item=pair}
				<tr class="GridRow">
					{capture name=id}{$pair|key}{/capture}
					{alias name=campaign from=$statsDetails.campaigns.$id}
					<td>
						<a href="index.php?Page=Stats&Action=Newsletters&SubAction=ViewSummary&id={$campaign.stats_newsletters.statid}&tab=4">{$campaign.campaign_name}</a>
					</td>
					<td align="center">{$campaign.stats_newsletters.bouncecount_soft}</td>
					<td align="center">{$campaign.stats_newsletters.bouncecount_hard}</td>
					<td align="center">{$campaign.stats_newsletters.bouncecount_unknown}</td>
					<td align="center">{$campaign.stats_newsletters.percent_bouncecount_total}</td>
					<td align="center">{$campaign.stats_newsletters.recipients|number_format}</td>
					<td align="center">{$campaign.stats_newsletters.final_percent_bouncecount_total}</td>
					<td align="center">{$statsDetails.total_recipient_count|number_format} {$lang.Addon_splittest_Stats_Recipient_s}</td>
				</tr>
				{/foreach}
		    </table>
			</div>
		</td>
	  </tr>
	</table>
</div>


<!-- Unsubscribes -->
<div id="div5" style="display:none;">
	<br/>
	<table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text">
		<tr class="Heading3">
			<td colspan="4" align="left" class="header-chart">
				{$lang.Addon_splittest_SplittestTitle} {$lang.Newsletter_Summary_Graph_unsubscribechart}
			</td>
		</tr>

		<tr>
			<td width="65%" valign="top">
				{$statsDetails.unsubscribes_chart}
				{$winner_summary}
			</td>
		</tr>

		<tr>
			<td>
			  <div class="columnChart">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" class="Text statTable">
					<tr class="Heading3">
						<td width="200" height="22" align="left" valign="top">
							<span>{$lang.Addon_splittest_Stats_EmailCampaigns}</span>
						</td>
						<td align="center">{$lang.UnsubscribeCount}</td>
						<td align="center">{$lang.Stats_TotalUnsubscribes} (%)</td>
						<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients}</td>
						<td align="center">{$lang.Addon_splittest_Stats_TotalRecipients} (%)</td>
						<td align="center">{$lang.Addon_splittest_TotalSendSize}</td>
					</tr>
					{foreach from=$statsDetails.campaign_statistics.rankings.unsubscribes item=pair}
						{capture name=id}{$pair|key}{/capture}
						{alias name=campaign from=$statsDetails.campaigns.$id}
						<tr class="GridRow">
							<td>
								<a href="index.php?Page=Stats&Action=Newsletters&SubAction=ViewSummary&id={$campaign.stats_newsletters.statid}&tab=5">{$campaign.campaign_name}</a>
							</td>
							<td align="center">{$campaign.stats_newsletters.unsubscribecount}</td>
							<td align="center">{$campaign.stats_newsletters.percent_unsubscribecount}</td>
							<td align="center">{$campaign.stats_newsletters.recipients|number_format}</td>
							<td align="center">{$campaign.stats_newsletters.final_percent_unsubscribecount}</td>
							<td align="center">{$statsDetails.total_recipient_count|number_format} {$lang.Addon_splittest_Stats_Recipient_s}</td>
						</tr>
					{/foreach}
		  		</table>
				  </div>
			</td>
	  	</tr>
	</table>
</div>

<style>
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
	padding: 10px 25px !important;
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
		width: 910px !important;
		overflow-x: auto !important;
	}
}
@media screen and (max-width: 780px) {
	div.columnChart {
		width: 715px !important;
		overflow-x: hidden !important;
	}
	.columnChart {
		width: 94vw;
		overflow-x: scroll;
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
	div.columnChart {
		width: 715px !important;
		overflow-x: scroll !important;
	}
	.tabnav a:link,
	.tabnav a:visited {
		padding: 10px 7px 10px 11px!important;
		width: 175px;
		text-align: center;
		margin-bottom: 4px;
	}
	.tabnav {
		height: 78px !important;
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
		padding-left: 106px;
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
		height: 130px !important;
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
		width: 313px !important;
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
		height: 211px !important;
		padding-left: 0px !important;
	}
	div.columnChart {
		width: 280px !important;
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