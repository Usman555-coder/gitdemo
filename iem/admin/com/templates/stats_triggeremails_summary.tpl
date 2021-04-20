<script>
    var TabSize = 7;

    function PreparePreview(id) {
        var openurl = 'index.php?Page=Newsletters&Action=View&id=' + id;
        window.open(openurl, 'pp');
    }

    function ChangeLink(page, column, sort) {
        chooselink_id = document.getElementById('chooselink');
        selected = chooselink_id.selectedIndex;
        linkid = chooselink_id[selected].value;
        REMOTE_parameters = '&link=' + linkid;
        REMOTE_admin_table($('#statsTriggerEmails_OpenTable'), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', page, column, sort);

        UpdateLinkSummary();
    }

    function ChangeBounceType() {}

    function UpdateLinkSummary() {
        /*
         if (document.getElementById('chooselink')) {
         chooselink_id = document.getElementById('chooselink');
         selected = chooselink_id.selectedIndex;
         linkid = chooselink_id[selected].value;
         } else {
         linkid = 'a';
         }
         
         // Update link stats
         $.get('remote_stats.php?Action=get_linkstats&link=' + linkid + '&token=%%GLOBAL_TableToken%%','',
         function(data) {
         eval(data);
         $('#totalclicks').html(linksjson.linkclicks);
         $('#clickthrough').html(linksjson.clickthrough);
         $('#averageclicks').html(linksjson.averageclicks);
         $('#uniqueclicks').html(linksjson.uniqueclicks);
         }
         );*/
    }

    $(function () {
        if ($('#adminTabletriggeremails_opens').size() != 0) {
            REMOTE_admin_table($('#adminTabletriggeremails_opens'), '', '', 'triggeremails_opens', '{$PAGE.session_token}', 1, 'opened', 'down');
        }

        if ($('#adminTabletriggeremails_links').size() != 0) {
            REMOTE_admin_table($('#adminTabletriggeremails_links'), '', '', 'triggeremails_links', '{$PAGE.session_token}', 1, 'email', 'up');
        }

        if ($('#adminTabletriggeremails_bounces').size() != 0) {
            REMOTE_admin_table($('#adminTabletriggeremails_bounces'), '', '', 'triggeremails_bounces', '{$PAGE.session_token}', 1, 'time', 'down');
        }

        if ($('#adminTabletriggeremails_unsubscribes').size() != 0) {
            REMOTE_admin_table($('#adminTabletriggeremails_unsubscribes'), '', '', 'triggeremails_unsubscribes', '{$PAGE.session_token}', 1, 'time', 'down');
        }

        if ($('#adminTabletriggeremails_forwards').size() != 0) {
            REMOTE_admin_table($('#adminTabletriggeremails_forwards'), '', '', 'triggeremails_forwards', '{$PAGE.session_token}', 1, 'email', 'up');
        }
    });
</script>

<div class="PageBodyContainer">
    <div class="Page_Header">
        <div class="Heading1 col-sm-6 Heading1New">{$lang.TriggerEmails_Stats_Title}</div>
        <div class="Intro">{$lang.TriggerEamils_Stats_Page_Intro|sprintf,$record.triggeremailsname}</div>
    </div>

    {* ----- Tab navigations *}
    <div style="display: block; clear: both;">
        <br>
        <ul id="tabnav" class="tabnav">
            <li><a href="#" {if $PAGE.whichtab == 1}class="active"{/if} onClick="ShowTab(1); return false;" id="tab1">{$lang.TriggerEmails_Stats_Tab_Snapshots}</a></li>
            <li><a href="#" {if $PAGE.whichtab == 2}class="active"{/if} onClick="ShowTab(2); return false;" id="tab2">{$lang.TriggerEmails_Stats_Tab_OpenStats}</a></li>
            <li><a href="#" {if $PAGE.whichtab == 3}class="active"{/if} onClick="ShowTab(3); return false;" id="tab3">{$lang.TriggerEmails_Stats_Tab_LinkStats}</a></li>
            <li><a href="#" {if $PAGE.whichtab == 4}class="active"{/if} onClick="ShowTab(4); return false;" id="tab4">{$lang.TriggerEmails_Stats_Tab_BounceStats}</a></li>
            <li><a href="#" {if $PAGE.whichtab == 5}class="active"{/if} onClick="ShowTab(5); return false;" id="tab5">{$lang.TriggerEmails_Stats_Tab_UnsubscribeStats}</a></li>
            <li><a href="#" {if $PAGE.whichtab == 6}class="active"{/if} onClick="ShowTab(6); return false;" id="tab6">{$lang.TriggerEmails_Stats_Tab_ForwardStats}</a></li>
            <li><a href="#" {if $PAGE.whichtab == 7}class="active"{/if} onClick="ShowTab(7);
                    return false;" id="tab7">{$lang.TriggerEmails_Stats_Tab_SubscriberStats}</a></li>
            <li><a href="#" {if $PAGE.whichtab == 8}class="active"{/if} onClick="ShowTab(8);
                    return false;" id="tab8">{$lang.TriggerEmails_Stats_Tab_FailedStats}</a></li>
        </ul>
    </div>
    {* ----- *}


    {* ----- Tabs *}
    {* ----- Tab 1: Snapshot *}
    <div id="div1" style="display: {if $PAGE.whichtab == 1}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.snapshot.intro}</div>
        <table class="mygrid-table table-column">
            <tr>
                <td>
                <div class="table-responsive rborder2">
                    <table border=0 width="100%" class="Text"  cellspacing="0">
                        <tr class="Heading3">
                            <td colspan="2" nowrap align="left">
                                {$lang.TriggerEmails_Stats_Snapshots_Heading}
                            </td>
                        </tr>
                        <tr class="GridRow">
                            <td width="30%" height="22" nowrap align="left" valign="top">
                                &nbsp;{$lang.NewsletterStatistics_SentTo}
                            </td>
                            <td width="70%" nowrap align="left">
                                {$record.processed_totalsent}
                            </td>
                        </tr>
                        <tr class="GridRow">
                            <td width="30%" height="22" nowrap align="left" valign="top">
                                &nbsp;{$lang.TriggerEmails_Stats_Snapshots_CreatedBy}
                            </td>
                            <td width="70%" nowrap align="left">
                                <a href="mailto:{$record.owneremail}">{if trim($record.ownername) == ''}{$record.ownerusername}{else}{$record.ownername}{/if}</a>
                            </td>
                        </tr>
                        <tr class="GridRow">
                            <td width="30%" height="22" nowrap align="left" valign="top">
                                &nbsp;{$lang.NewsletterStatistics_Opened}
                            </td>
                            <td width="70%" nowrap align="left">
                                <a	title="{$lang.TriggerEmails_Stats_Snapshots_Tooltip_Open}" href="{$tabs.snapshot.url_open_url}" {if !$PAGE.unique_open}onclick="ShowTab(2);
                                        return false;"{/if}>{$tabs.snapshot.newsletter_totalopen}</a>
                                /
                                <a title="{$lang.TriggerEmails_Stats_Snapshots_Tooltip_UniqueOpen}" href="{$tabs.snapshot.url_openunique_url}" {if $PAGE.unique_open}onclick="ShowTab(2);
                                        return false;"{/if}>{$tabs.snapshot.newsletter_uniqueopen}</a>
                            </td>
                        </tr>
                        <tr class="GridRow">
                            <td width="30%" height="22" nowrap align="left" valign="top">
                                &nbsp;{$lang.NewsletterStatistics_Bounced}
                            </td>
                            <td width="70%" nowrap align="left">
                                {$tabs.snapshot.newsletter_bounce}
                            </td>
                        </tr>
                    </table>
                    </div>
                </td>
                <td>
                <div class="rborder">
                    {$tabs.snapshot.summary_chart}
                </div>
                </td>
            </tr>
        </table>
    </div>
    {* ----- *}

    {* ----- Tab 2: Open *}
    <div id="div2" style="display: {if $PAGE.whichtab == 2}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.open.intro}</div>
        <div style="padding-bottom: 10px;">{$tabs.open.calendar}</div>

        {if !$record.processed_timeframe_emailopens_total}
            <div>{$tabs.open.message}</div>
        {else}
            <table class="open-table">
                <tr>
                    <td>
                        <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;{$lang.Opens_Summary}</div>
                        <ul class="graph-info">
                            <li>
                                <span class="HelpText" onmouseover="ShowHelp('total_open_explain', '{$lang.TotalOpens}', '{$lang.Stats_TotalOpens_Description}');" onmouseout="HideHelp('total_open_explain');">{$lang.TotalOpens}{$tabs.open.email_opens_total}</span>
                                <div id="total_open_explain" style="display:none;"></div>
                            </li>
                            <li>{$lang.MostOpens}{$tabs.open.most_open_date}</li>
                            <li>
                                <span class="HelpText" onmouseover="ShowHelp('total_uniqueopen_explain', '{$lang.TotalUniqueOpens}', '{$lang.Stats_TotalUniqueOpens_Description}');" onmouseout="HideHelp('total_uniqueopen_explain');">{$lang.TotalUniqueOpens}{$tabs.open.email_opens_unique}</span>
                                <div id="total_uniqueopen_explain" style="display:none;"></div>
                            </li>
                            <li>{$lang.AverageOpens}{$tabs.open.average_opens}</li>
                            <li>{$lang.OpenRate}{$tabs.open.open_rate}</li>
                        </ul>
                    </td>
                    </tr>
                <tr>
                    <td>
                        <div class="rborder">
                            {$tabs.open.open_chart}
                        </div>
                    </td>
                </tr>
            </table>

            <div id="adminTabletriggeremails_opens" class="pager-row"></div>
        {/if}
    </div>
    {* ----- *}

    {* ----- Tab 3: Links *}
    <div id="div3" style="display: {if $PAGE.whichtab == 3}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.links.intro}</div>

        <div style="padding-bottom: 10px;">{$tabs.links.calendar}</div>

        {if !$record.processed_timeframe_linkclicks_total}
            <div>{$tabs.links.message}</div>
        {else}
            <table class="open-table">
                <tr>
                    <td>
                        <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;{$lang.LinkClicks_Summary}</div>
                        <ul class="graph-info">
                            <li>{$lang.Stats_TotalClicks}: {$tabs.links.linkclicks_total}</li>
                            <li>{$lang.Stats_TotalUniqueClicks}: {$tabs.links.linkclicks_individuals}</li>
                            <li>{$lang.Stats_UniqueClicks}: {$tabs.links.linkclicks_unique}</li>
                            <li>{$lang.Stats_MostPopularLink}: <a href="{$tabs.links.most_popular_link}" title="{$tabs.links.most_popular_link}" target="_blank">{$tabs.links.most_popular_link_short}</a></li>
                            <li>{$lang.Stats_AverageClicks}: {$tabs.links.average_clicks}</li>
                            <li>{$lang.Stats_Clickthrough}: {$tabs.links.click_through}</li>
                        </ul>
                    </td>
                    </tr>
                    <tr>
                    <td>
                        <div class="rborder">
                            {$tabs.links.link_chart}
                        </div>
                    </td>
                </tr>
            </table>

            <div id="adminTabletriggeremails_links" class="pager-row"></div>
        {/if}
    </div>
    {* ----- *}

    {* ----- Tab 4: Bounce *}
    <div id="div4" style="display: {if $PAGE.whichtab == 4}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.bounces.intro}</div>

        <div style="padding-bottom: 10px;">{$tabs.bounces.calendar}</div>

        {if !$record.processed_timeframe_bounces}
            <div>{$tabs.bounces.message}</div>
        {else}
            <table class="open-table">
                <tr>
                    <td>
                        <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;{$lang.Bounce_Summary}</div>
                        <ul class="graph-info">
                            <li>{$lang.Stats_TotalBounces}{$tabs.bounces.bounces_total}</li>
                            <li>{$lang.Stats_TotalSoftBounces}{$tabs.bounces.bounces_soft}</li>
                            <li>{$lang.Stats_TotalHardBounces}{$tabs.bounces.bounces_hard}</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="rborder">
                            {$tabs.bounces.bounce_chart}
                        </div>
                    </td>                    
                </tr>
            </table>

            <div id="adminTabletriggeremails_bounces" class="pager-row"></div>
        {/if}
    </div>
    {* ----- *}

    {* ----- Tab 5: Unsubscribe *}
    <div id="div5" style="display: {if $PAGE.whichtab == 5}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.unsubscribes.intro}</div>

        <div style="padding-bottom: 10px;">{$tabs.unsubscribes.calendar}</div>

        {if !$record.processed_timeframe_unsubscribes}
            <div>{$tabs.unsubscribes.message}</div>
        {else}
            <table class="open-table">
                <tr>
                    <td>
                        <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;{$lang.Unsubscribe_Summary}</div>
                        <ul class="graph-info">
                            <li>{$lang.Stats_TotalUnsubscribes}:{$tabs.unsubscribes.unsubscribes_total}</li>
                            <li>{$lang.Stats_MostUnsubscribes}:{$tabs.unsubscribes.unsubscribes_most}</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="rborder">
                            {$tabs.unsubscribes.unsubscribe_chart}
                        </div>
                    </td>
                </tr>
            </table>

            <div id="adminTabletriggeremails_unsubscribes" class="pager-row"></div>
        {/if}
    </div>
    {* ----- *}

    {* ----- Tab 6: Forward *}
    <div id="div6" style="display: {if $PAGE.whichtab == 6}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.forwards.intro}</div>

        <div style="padding-bottom: 10px;">{$tabs.forwards.calendar}</div>

        {if !$record.processed_timeframe_forwards}
            <div>{$tabs.forwards.message}</div>
        {else}
            <table class="open-table">
                <tr>
                    <td>
                        <div class="MidHeading" style="width:100%"><img src="images/Contact_List_Statistics_image.svg" width="20" height="20" align="absMiddle">&nbsp;{$lang.Forwards_Summary}</div>
                        <ul class="graph-info">
                            <li>{$lang.ListStatsTotalForwards}{$tabs.forwards.forward_total}</li>
                            <li>{$lang.ListStatsTotalForwardSignups}{$tabs.forwards.forward_signups}</li>
                        </ul>
                    </td>
                    </tr>
                    <tr>
                    <td>
                        <div class="rborder">
                            {$tabs.forwards.forwards_chart}   
                        </div>
                    </td>
                </tr>
            </table>

            <div id="adminTabletriggeremails_forwards" class="pager-row"></div>
        {/if}
    </div>
    {* ----- *}

    {* ----- Tab 7: Recipients *}
    <div id="div7" style="display: {if $PAGE.whichtab == 7}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.recipients.intro}</div>

        <div style="padding-bottom: 10px;">{$tabs.recipients.calendar}</div>

        {if !is_array($tabs.recipients.records) || count($tabs.recipients.records) == 0}
            <div>{$tabs.recipients.message}</div>
        {else}
         <div class="table-responsive">
            <table class="Text snapshotTab tb-border" cellspacing="0" cellpadding="0" width="100%" style="margin:0;">
                <tr class="Heading3">
                    <td nowrap align="left">{$lang.EmailAddress}</td>
                    <td nowrap align="left">{$lang.SentWhen}</td>
                </tr>
                {foreach from=$tabs.recipients.records item=each}
                    <tr>
                        <td nowrap align="left">{$each.note}</td>
                        <td nowrap align="left">{$each.processed_senttime}</td>
                    </tr>
                {/foreach}
                
            </table>
            </div>
            <div class="pager-row2">
                {$tabs.recipients.pagination_bottom}
            </div>
        {/if}
    </div>
    {* ----- *}

    {* ----- Tab 8: Failed sending *}
    <div id="div8" style="display: {if $PAGE.whichtab == 8}block{else}none{/if}; clear: both;">
        <div class="summary-para">{$tabs.failed.intro}</div>

        <div style="padding-bottom: 10px;">{$tabs.failed.calendar}</div>

        {if !is_array($tabs.failed.records) || count($tabs.failed.records) == 0}
            <div>{$tabs.failed.message}</div>
        {else}
        <div class="table-responsive">
            <table class="Text snapshotTab tb-border" cellspacing="0" cellpadding="0" width="100%" style="margin:0;">
                <tr class="Heading3">
                    <td nowrap align="left">{$lang.EmailAddress}</td>
                    <td nowrap align="left">{$lang.SentWhen}</td>
                </tr>
                {foreach from=$tabs.failed.records item=each}
                    <tr>
                        <td nowrap align="left">{$each.note}</td>
                        <td nowrap align="left">{$each.processed_senttime}</td>
                    </tr>
                {/foreach}
            </table>
        </div>
            <div class="pager-row2">
                {$tabs.failed.pagination_bottom}
            </div>
        {/if}
    </div>
    {* ----- *}
    {* ----- *}
</div>
<style>
#chooselink, #choosebt {
    width: 200px;
    float: left;
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
.mygrid-table.table-column .table-responsive {
    margin-bottom: 20px;
}
.Heading3 > td {
    position: relative;
    padding-left: 13px !important;
}
.Heading3 td {
    position: relative;
}
.customdates {
    display: inline-flex;
    align-items: center;
    flex-wrap:wrap;
}
.customdates .form-control {
    margin: 0 3px 0 3px;
    height: 30px;
    width: inherit;
}
.customdates .CalendarSelect:first-child {
    margin-left: 0;
}

.table-column > tbody > tr{
    display:flex;
    flex-direction:column;
}
.BodyContainer {
    width: 100%;
    margin: 0;
}
#tabnav li {
    line-height: inherit !important;
}
.paginationTable select {
    width: 75px !important;
    height: 35px;
    border-radius: 2px;
}
.paginationTable {
    //margin-top: 30px;
}
.view-all-links input {
    height: 40px;
    width: 46px;
    border-radius: 0 5px 5px 0;
    border: 1px solid #ced4da;
    margin-left: -4px;
}
.view-all-links select {
    height: 40px;
    border-radius: 5px 0 0 5px;
}

.tb-border{
    border: 1px solid #e8e8e8 !important;
}
.form-control {
    height: 35px;
}
.goButton {
    width: 40px;
    height: 35px;
    margin-left: 4px;
}

.snapshotTab tr:nth-child(even) {
	background-color: #f2f2f2;
}
.GridRow:nth-child(even) {
	background-color: #f2f2f2;
}
* {
	font-family: "Roboto", Arial, Tahoma, sans-serif;
	font-size: 14px;
}
#tabnav {
    padding-left: 0;
}
.tabnav {
	height: auto !important;
}
.tabnav li a.active {
	background-color: #0D5085 !important;
	background-image: none !important;
	color: #FFFFFF !important;
}
.tabnav li a{
    margin-right:3px !important;
}
.tabnav a:link,
.tabnav a:visited {
	font-family: 'Roboto', Arial, Tahoma, sans-serif !important;
	font-size: 14px !important;
	padding: 10px 15px !important;
	background-color: #cbd4d7 !important;
	color: #000000 !important;
	background-image: none !important;
	font-weight: 600 !important;
}
.GridRow td {
    text-align: left;
    padding: 10px;
    word-wrap: break-word;
}
.snapshotTab td {
    text-align: left;
    padding: 10px;
    word-wrap: break-word;
    border-top: none;
}
.mygrid-table, 
.open-table{
    width:100% !important;
}
.mygrid-table > tbody > tr > td,
.open-table > tbody > tr > td{
    vertical-align: top;
    padding0.75rem;
}
#tabnav:after {
    content: "";
    clear: both;
    display: block;
}   
.mygrid-table > tbody > tr > td {
    width:100%; vertical-align: top;
}
.summary-para {
    margin: 15px 0;
}
.open-table > tbody > tr > td {
    width: 100% !important;
}
.graph-info {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    margin-top: 15px;
    margin-bottom: 25px;
    }
.graph-info li {
    border: 1px solid #ccc;
    font-size: 12px;
    padding: 8px 15px;
    background:#fff;
    margin-right:-1px;
    margin-bottom:-1px;
    min-height: 39px;
    min-width: 33.333%;
}


.graph-info li .HelpText {
    border-bottom: 0px dotted #28609b;
}
.rborder2, .thirdPartyTable{
    display: block;
    width: 100%;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
}
.rborder{
    border: 1px solid #ccc;
    display: block;
    width: 100%;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
}

.pager-row > table > tbody > tr:first-child td > table > tbody > tr > td:first-child {
    display: none;
}
.pager-row > table > tbody > tr:first-child td > table > tbody > tr > td:last-child {
    display: flex;
    justify-content: space-between;
    padding: 0 0 15px;
}


@media screen and (max-width: 1024px) {

}

@media screen and (max-width: 812px) {

}

@media screen and (max-width: 768px) {
.graph-info li {
    min-width: 50%;
}
.columnChart {
    min-width: 895px;
}

#tabnav li {
    display: inline-block;
    list-style-type: none;
    width:32.9%;
}
#tabnav li a{
    width: 100%;
    text-align: center;
}
.pieChart {
    min-width: 700px !important;
}
}

@media only screen and (min-width: 375px) and (max-width: 812px) and (orientation: landscape) {
    .pieChart {
        min-width: 700px !important;
    }
    .columnChart {
        min-width: 895px;
    }
    #tabnav li {
    line-height: inherit !important;
    width: 24.5%;
    display: inline-block;
}
    #tabnav li a {
        width: 100%;
        text-align: center;
        font-size: 13px !important;
    }
    .mygrid-table > tbody > tr > td:last-child,
    .mygrid-table > tbody > tr > td:first-child {
        width: 100%;
    }
    .mygrid-table > tbody > tr {
        display: flex;
        flex-direction: column;
    }
}    

@media screen and (max-width: 740px) {
.customdates .form-control {
    margin: 0 3px 0 0;
    }
.rborder2{
    border: 1px solid #ccc;
}
.graph-info li {
    font-size: 14px;
}
#tabnav li{
    width: 100%;
    min-width: 100%;
}
.graph-info li{
    width: 99%;
    min-width: 99%;
}
.paginationTable tr {
    flex-direction: column;
}
.paginationTable tr td {
    margin: 7px 0;
}
.paginationTable tr td {
    width: 100%;
}
.mygrid-table > tbody > tr {
    display: flex;
    flex-direction: column;
}
.dateTD1 {
    width: 115px;
    margin-bottom: 15px;
    padding-top: 6px;
}
}
</style>
<script>  
    $(document).ready(function(){ 
        
        $(window).resize(function() {
            $('.rborder').width($(window).width() - 36);
            $('.thirdPartyTable').width($(window).width() - 36);
        });

        $(window).resize(function() {
            $('.rborder2').width($(window).width() - 36);
        });

        $(window).trigger('resize');

    }); 
</script>  