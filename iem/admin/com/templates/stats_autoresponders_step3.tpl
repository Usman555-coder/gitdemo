<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td>

            <div class="Heading1">%%LNG_Stats_AutoresponderStatistics%% for &quot;%%GLOBAL_AutoresponderName%%&quot;</div>

            <script>
                var TabSize = 7;
            </script>

            <div>
                <br>

                <ul id="tabnav" class="tabnav">
                    <li><a href="#" class="active" onClick="ShowTab(1)" id="tab1">%%LNG_AutoresponderStatistics_Snapshot%%</a></li>
                    <li><a href="#" onClick="ShowTab(2)" id="tab2">%%LNG_AutoresponderStatistics_Snapshot_OpenStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(3)" id="tab3">%%LNG_AutoresponderStatistics_Snapshot_LinkStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(4)" id="tab4">%%LNG_AutoresponderStatistics_Snapshot_BounceStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(5)" id="tab5">%%LNG_AutoresponderStatistics_Snapshot_UnsubscribeStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(6)" id="tab6">%%LNG_AutoresponderStatistics_Snapshot_ForwardStats%%</a></li>
                    <li><a href="#" onClick="ShowTab(7)" id="tab7">%%LNG_AutoresponderStatistics_Snapshot_SubscriberStats%%</a></li>
                </ul>

            </div>


            <div id="div1">
                <div class="summary-para">
                    %%GLOBAL_SummaryIntro%%
                </div>
                <table class="mygrid-table table-column">
                    <tr>
                        <td>
                            <div class="table-responsive rborder2">
                                <table border=0 width="100%" class="Text"  cellspacing="0">
                                    <tr class="Heading3">
                                        <td colspan="2" nowrap align="left">
                                            %%LNG_AutoresponderStatistics_Snapshot_Heading%%
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left">
                                            &nbsp;%%LNG_AutoresponderSubject%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            <a title="%%LNG_PreviewThisAutoresponder%%" href="#" onclick="PreparePreview();
                                                    return false;">%%GLOBAL_AutoresponderSubject%%</a>
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left">
                                            &nbsp;%%LNG_Stats_Autoresponders_SelectList_Intro%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            <a title="%%LNG_EditThisAutoresponder%%" href="index.php?Page=Autoresponders&Action=Edit&id=%%GLOBAL_AutoresponderID%%">%%GLOBAL_AutoresponderName%%</a>
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left">
                                            &nbsp;%%LNG_SentToList%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            %%GLOBAL_MailingList%%
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left" valign="top">
                                            &nbsp;%%LNG_AutoresponderStatistics_SentTo%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            %%GLOBAL_SentToDetails%%
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left" valign="top">
                                            &nbsp;%%LNG_AutoresponderStatistics_SentWhen%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            %%GLOBAL_SentWhen%%
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left" valign="top">
                                            &nbsp;%%LNG_AutoresponderStatistics_CreatedBy%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            <a href="mailto:%%GLOBAL_UserEmail%%">%%GLOBAL_CreatedBy%%</a>
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left" valign="top">
                                            &nbsp;%%LNG_AutoresponderStatistics_Opened%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            <a title="Click here to see the email address of everyone that opened this newsletter" href="%%GLOBAL_OpensURL%%">%%GLOBAL_TotalOpens%%</a> / <a title="Click here to view unique email addresses that opened this newsletter" href="%%GLOBAL_UniqueOpensURL%%">%%GLOBAL_UniqueOpens%%</a>
                                        </td>
                                    </tr>
                                    <tr class="GridRow">
                                        <td width="30%" height="22" nowrap align="left" valign="top">
                                            &nbsp;%%LNG_AutoresponderStatistics_Bounced%%
                                        </td>
                                        <td width="70%" nowrap align="left">
                                            %%GLOBAL_TotalBounces%%
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td> <div class="summary-para"><b>{$lang.AutoresponderSummaryChart}</b></div></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="rborder">
                                %%GLOBAL_SummaryChart%%
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            %%GLOBAL_OpensPage%%
            %%GLOBAL_LinksPage%%
            %%GLOBAL_BouncesPage%%
            %%GLOBAL_UnsubscribesPage%%
            %%GLOBAL_ForwardsPage%%
            %%GLOBAL_RecipientsPage%%

            <script>
                function PreparePreview() {
                    var openurl = "index.php?Page=Autoresponders&Action=View&id=%%GLOBAL_AutoresponderID%%";
                    window.open(openurl, "pp");
                }
            </script>

        </td>
    </tr>
</table>

<style>
.Heading1 {
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    font-size: 22px;
    font-weight: normal;
    color: rgb(33, 37, 41);
    font-weight: 500;
    line-height: 1.2;
    margin: 0px;
    padding-left: 0px;
}
#chooselink, #choosebt {
    width: 200px;
    float: left;
    height:35px;
}
.Heading1 {
    margin: 15px 0 0;
    padding-bottom: 0;
}
.Heading3 > td {
    position: relative;
    padding-left: 13px !important;
}
.Heading3 td {
    position: relative;
}
.customdates .form-control {
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
    height: 35px !important;
    width: 40px;
    border-radius: 5px;
    margin-left: 10px;
    border: 1px solid #ccc;
    background-color: #ffff;
}
.view-all-links select {
    border-radius: 5px;
}

.tb-border{
    border: 1px solid #e8e8e8 !important;
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
	font-size: 13.2px !important;
	padding: 10px 13px !important;
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
    font-size: 14px;
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
.pager-row{
    margin-top:15px;
}
.view-all-links {
    margin: 25px 0 20px;
}
.pager-row > table > tbody > tr:first-child td > table > tbody > tr > td:first-child {
    display: none;
}
.pager-row > table > tbody > tr:first-child td > table > tbody > tr > td:last-child {
    display: flex;
    justify-content: space-between;
    padding: 40px 0 15px;
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
        padding-top: 6px;
        width: 115px;
    }
    .CalendarSelect {
        width: 130px;
    }
}
</style>
<script>  
    
    $(document).ready(function(){ 
        
        $(window).resize(function() {
            $('.rborder2').width($(window).width() - 36);
            $('.thirdPartyTable').width($(window).width() - 36);
        });

        $(function() {
            $('#div2, #div2, #div3, #div4, #div5, #div6, #div7').addClass('date-range');    
        });

        $(window).resize(function() {
            $('.rborder').width($(window).width() - 36);
        });
        
        $(window).trigger('resize');

    }); 
</script>  
