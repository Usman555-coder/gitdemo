<div class="Heading1 col-sm-4 Heading1New" style="padding-top:5px;">Overview</div>

%%GLOBAL_SystemMessage%%

<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" class="IndexContent">
    <tr>
        <td colspan="2" class="body pageinfo" id="GlobalMessage">%%GLOBAL_Message%%</td>
    </tr>
    <tr class="main-tr">
        <td valign="top" class="dats-panle">
            <div>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td>
                            %%GLOBAL_DisplayBox%%
                            <table cellspacing="0" style="width: 100%;" cellpadding="0" class="DashboardPanelBox1" id="GettingStartedPanel">
                                <tr>
                                    <td id="StartLinks" class="PanelContentBox1 IndexPage_GettingStarted_Content" valign="top">

                                        <div class="PanelHeaderBox1 IndexPage_GettingStarted_Header">
                                            <div class="QuickLink">
                                                <a href="#" id="SwitchLinks">%%GLOBAL_SwitchLink%%</a>
                                            </div>
                                            <div id="HomeStartTitle">
                                                %%GLOBAL_StartTitle%%
                                            </div>
                                        </div>
                                        <div id="HomeGettingStarted" style="%%GLOBAL_HomeGettingStartedDisplay%%">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top" width="100%" {if $showintrovideo === true}style="padding-bottom:14px;"{/if}>
                                                        <div>
                                                            <div class="DashboardPanelSubBox1">

                                                                <div class="manage-list-div" style="padding:0px 10px 15px 0px;float:left;">
                                                                    <a href="index.php?Page=lists&Action=manage" class="SmallButton btn save-btn">Manage Lists
                                                                        
                                                                    </a>
                                                                </div>
                                                                <div style="float:right;" class="create-email-div" >
                                                                    <a href="index.php?Page=newsletters&Action=create" class="SmallButton btn save-btn">
                                                                        Create an Email
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            {if $showintrovideo === true}
                                                                <div style="clear:both;">
                                                                    <div class="PanelHeaderBox1">
                                                                        <div id="HomeStartTitle" style="float:left;color:#636363;">%%LNG_GettingStarted_LearnMore%%</div>
                                                                        <div id="HideThisDiv" class="QuickLink HideThis">
                                                                            &nbsp;<a href="#" id="HideThis">
                                                                                %%GLOBAL_HideThisText%%
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="DashboardPanelSubBox2" style="clear:both;%%GLOBAL_HideThisDisplay%%">
                                                                        <div style="padding:12px 20px 0px 60px;background:transparent url(images/learn-video.gif) left top no-repeat;">
                                                                            <a id="VideoLearnMore" href="#">%%LNG_GettingStarted_WatchText%%</a>
                                                                        </div>
                                                                        <div style="padding:12px 0px 0px 60px;background:transparent url(images/learn-guide.gif) left top no-repeat;">
                                                                            <a target="_blank" href="%%LNG_Home_Getting_Starting_Link%%">%%LNG_GettingStarted_ReadText%%</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            {/if}
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div id="HomeQuickLinks" style="%%GLOBAL_HomeQuickLinksDisplay%%">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top" width="100%" class="DashboardPanelSubBox3TD" style="padding-left: 16px;">

                                                        <table width="100%" class="DashboardPanelSubBox3" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td valign="top" width="50%">
                                                                    <ul>
                                                                        <li><a href="index.php?Page=lists&amp;Action=manage">{$lang.QuickLinks_ViewSubscriberLists}</a></li>
                                                                        <li><a href="index.php?Page=lists&amp;Action=create">{$lang.QuickLinks_CreateSubscriberLists}</a></li>
                                                                        <li><a href="index.php?Page=CustomFields&amp;Action=Manage">{$lang.QuickLinks_ViewCustomFields}</a></li>
                                                                        <li><a href="index.php?Page=newsletters&amp;Action=manage">{$lang.QuickLinks_ViewCampaigns}</a></li>
                                                                        <li><a href="index.php?Page=newsletters&amp;Action=create">{$lang.QuickLinks_CreateCampaigns}</a></li>
                                                                        <li><a href="index.php?Page=send">{$lang.QuickLinks_SendCampaigns}</a></li>
                                                                        <li><a href="index.php?Page=autoresponders&amp;Action=manage">{$lang.QuickLinks_ViewAutoresponders}</a></li>
                                                                    </ul>
                                                                </td>
                                                                <td valign="top" width="50%">
                                                                    <ul>
                                                                        <li><a href="index.php?Page=autoresponders&amp;Action=create">{$lang.QuickLinks_CreateAutoresponders}</a></li>
                                                                        <li><a href="index.php?Page=subscribers&amp;Action=manage">{$lang.QuickLinks_ViewSubscribers}</a></li>
                                                                        <li><a href="index.php?Page=subscribers&amp;Action=add">{$lang.QuickLinks_AddSubscribers}</a></li>
                                                                        <li><a href="index.php?Page=templates&amp;Action=manage">{$lang.QuickLinks_ViewTemplates}</a></li>
                                                                        <li><a href="index.php?Page=templates&amp;Action=create">{$lang.QuickLinks_CreateTemplates}</a></li>
                                                                        <li><a href="index.php?Page=forms&amp;Action=manage">{$lang.QuickLinks_ViewForms}</a></li>
                                                                        <li><a href="index.php?Page=forms&amp;Action=create">{$lang.QuickLinks_CreateForms}</a></li>
                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                        </table>


                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="100%" class="DashboardPanel" id="HpCampaignPanel">
                                <tr>
                                    <td id="CampaignLinks" class="PanelContent" style=";padding:16px 16px 20px 16px;" valign="top">
                                        <div id="RecentPanel">
                                            <div class="PanelHeaderBox1 IndexPage_GettingStarted_Header" style="padding:0px 0px 10px 0px;">
                                                <div id="HomeStartTitle">%%LNG_GettingStarted_RecentCampaign%%</div>
                                            </div>
                                            <div id="CampaignOptionsLinks">

                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td valign="top" width="100%" style="padding-bottom:14px;">
                                                            <div id="CampaignOptions" class="CampaignOptionsLinks">
                                                                <span class="CampaignShow">%%LNG_GettingStarted_Show%%</span> 
                                                                <span id="campaignshowall" class="NonCampaignOptionsSelected"> 
                                                                    <span class="left"></span>
                                                                    <a href="#" class="EachCampaignOptionsLink SmallButton btn save-btn">%%LNG_GettingStarted_AllCampaign%%</a>
                                                                    <span class="right"></span>
                                                                </span>
                                                                <span id="campaignshowschedule" class="NonCampaignOptionsSelected"> 
                                                                    <span class="left"></span>
                                                                    <a href="#" class="SmallButton btn save-btn">%%LNG_GettingStarted_ScheduledCampaign%%</a>
                                                                    <span class="right"></span>
                                                                </span>
                                                                <span id="campaignshowsent" class="NonCampaignOptionsSelected"> 
                                                                    <span class="left"></span>
                                                                    <a href="#" class="SmallButton btn save-btn">%%LNG_GettingStarted_SentCampaign%%</a>
                                                                    <span class="right"></span>
                                                                </span>
                                                                <span id="campaignshowarchive" class="NonCampaignOptionsSelected"> 
                                                                    <span class="left"></span>
                                                                    <a href="#" class="SmallButton btn save-btn">%%LNG_GettingStarted_ArchivedCampaign%%</a>
                                                                    <span class="right"></span>
                                                                </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="HomeListCampaign">
                                                <div id="CampaignList">
                                                </div>
                                            </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td id="StatsLinks" class="PanelContent" style="padding:0px 0px 0px 16px;" valign="top">
            <table width="100%" cellspacing="0" cellpadding="0" class="DashboardPanel">
                <tr>
                    <td class="PanelContent" valign="top">
                        <div id="GraphPanel">
                            <div class="PanelHeaderBox1 IndexPage_GettingStarted_Header" style="padding:0px 0px 10px 5px;">
                                <div id="HomeStartTitle">%%LNG_GettingStarted_LatestStats%%</div>
                            </div>
                            <div>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" width="100%" style="padding-left:0px;">
                                            <div id="CampaignStatsListId" class="CampaignStatsListClass">
                                                <span id="CampaignStatsListDropdownWrapper">
                                                    <img src="images/loading.gif" />
                                                </span> 
                                            </div>
                                            <div id="CampaignStatsChartWrapperId"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="ViewAllStatsButtonId" class="ActionButton ViewAllStatsButton" style="display:none;">
                                <a href="index.php?Page=Stats" class="SmallButton btn save-btn">
                                    <span class="RightEnd">
                                    </span>
                                    <span class="ActionIcon">
                                    </span>
                                        %%LNG_GettingStarted_ViewAllStats%%
                                </a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>


            <div>
                <table width="100%" cellspacing="0" cellpadding="0" class="DashboardPanel">
                    <tr>
                        <td class="PanelContent" valign="top" style="height:0;">
                            <div id="KbArticlesPanel">
                                <div class="PanelHeaderBox1 IndexPage_GettingStarted_Header" style="padding:0px 0px 10px 5px;">
                                    <span>%%LNG_GettingStarted_RecentlyArticles%%</span>
                                </div>
                                <div>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" width="100%">
                                                <div id="RecentContactListItem">
                                                    <ul id="kbRecentContactListList">
                                                        <li><img src="images/loading.gif" /></li>
                                                    </ul>
                                                </div>
                                                <div class="ActionButton BrowseCLButton" style="display:%%GLOBAL_DisplayListButton%%;">
                                                    <a href="index.php?Page=Lists" class="SmallButton btn save-btn">
                                                        <span class="RightEnd">
                                                        </span>
                                                        <span class="ActionIcon">
                                                        </span>
                                                            %%LNG_GettingStarted_BrowseContactList%%
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>

<script>
    function ActivateGettingStarted()
    {
        $('#HomeGettingStarted').fadeIn();
        $('#HomeQuickLinks')[0].style.display = 'none';
        $('#HomeStartTitle').html("%%LNG_GettingStarted_Header%%");
        $('#SwitchLinks').html('%%LNG_SwitchtoQuickLinks%%');
        $.ajax({
            type: 'post',
            url: 'index.php?Action=switch',
            data: {'To': 'gettingstarted'}
        });
    }

    function DisplayLearnMore(val)
    {
        if (val) {
            var linkText = "%%LNG_GettingStarted_HideThis%%";
            var display = "block";
            $('.DashboardPanelSubBox2').slideDown();
        } else {
            var linkText = "%%LNG_GettingStarted_ShowMore%%";
            var display = "none";
            $('.DashboardPanelSubBox2').slideUp();
        }
        $('#HideThis').html(linkText);
        $.ajax({
            type: 'post',
            url: 'index.php?Action=hidethis',
            data: {'To': display}
        });
    }

    function ActivateQuickLinks()
    {
        $('#HomeQuickLinks').fadeIn();
        $('#HomeGettingStarted')[0].style.display = 'none';
        $('#HomeStartTitle').html('%%LNG_IWouldLikeTo%%');
        $('#SwitchLinks').html('%%LNG_SwitchtoGettingStartedLinks%%');
        $.ajax({
            type: 'post',
            url: 'index.php?Action=switch',
            data: {'To': 'quicklinks'}
        });
    }

    var IndexPage = {
        GetCampaignList: function (ListOption) {
            $('#CampaignList').html('<img src="images/loading.gif" />');
            $.ajax({
                type: 'post',
                url: 'index.php?Action=getcampaignlist',
                data: {'To': ListOption},
                success: function (resp) {
                    $('#CampaignList').hide();
                    $('#CampaignList').html(resp);
                    $('#CampaignList').fadeIn();
                }
            });
        },
        GetCampaignDropDown: function (SelectedCampaignChart) {
            $.ajax({
                type: 'post',
                url: 'index.php?Action=getcampaigndropdown',
                data: {'SelectedCampaignChart': SelectedCampaignChart},
                success: function (resp) {
                    $('#CampaignStatsListDropdownWrapper').html(resp);
                    $('#CampaignStatsListDropdown').change(function () {
                        $('#ViewAllStatsButtonId').show();
                        $.ajax({
                            type: 'post',
                            url: 'index.php?Action=getcampaignchart',
                            data: {'StatId': $(this).val()},
                            success: function (resp) {
                                $('#CampaignStatsChartWrapperId').html(resp);
                            }
                        });
                        return false;
                    });
                    $.ajax({
                        type: 'post',
                        url: 'index.php?Action=getcampaignchart',
                        data: {'StatId': SelectedCampaignChart},
                        success: function (resp) {
                            $('#CampaignStatsChartWrapperId').html(resp);
                        }
                    });
                }
            });
        },
        VideoTour: function () {
            var w = 660;
            var h = 600;
            var l = screen.availWidth / 2 - (w / 2);
            var t = screen.availHeight / 2 - (h / 2);
            window.open('%%LNG_Home_Video_Link%%', 'iemVideoTour', 'width=' + w + ',height=' + h + ',top=' + t + ',left=' + l);
            return false;
        }
    }

    $(function () {
        // Setup panes
        $('#HideThis').click(function (event) {
            var showMore = ($('.DashboardPanelSubBox2')[0].style.display == 'none');
            DisplayLearnMore(showMore);
            return false;
        });

        if ($('#HomeGettingStarted')[0].style.display == 'none') {
            ActivateQuickLinks();
        } else {
            ActivateGettingStarted();
        }

        $('.CampaignOptionsSelected').removeClass('CampaignOptionsSelected');
        $('#%%GLOBAL_CampaignSelectedLink%%').addClass('CampaignOptionsSelected');
        IndexPage.GetCampaignList('%%GLOBAL_CampaignSelectedLink%%');
        IndexPage.GetCampaignDropDown('%%GLOBAL_CampaignSelectedChart%%');

        $('#kbRecentContactListList').load('index.php?Action=getrecentlists');

        if ($('#GlobalMessage').html() == '') {
            $('#GlobalMessage').hide();
        }

        $('#SwitchLinks').click(function () {
            if ($('#HomeGettingStarted')[0].style.display == 'none') {
                ActivateGettingStarted();
            } else {
                ActivateQuickLinks();
            }
            return false;
        });

        $('#VideoLearnMore').click(function () {IndexPage.VideoTour();});

        $('.CampaignOptionsSelected,.NonCampaignOptionsSelected').click(function () {
            $('.CampaignOptionsSelected').removeClass('CampaignOptionsSelected');
            $(this).addClass('CampaignOptionsSelected');
            IndexPage.GetCampaignList($(this).attr('id'));
            $.ajax({
                type: 'post',
                url: 'index.php?Action=campaignview',
                data: {'To': $(this).attr('id')}
            });
            return false;
        });
    });
</script>
<style>
.main-tr > td:first-child {
    width: 465px;
}
.ContentContainer {
    padding: 20px 10px 10px 10px !important;
    width:98% !important;
}
.PanelContent {
    height:auto;
}
.PanelHeaderBox1 {
    font-weight: bold;
}
.save-btn {
    color:white !important;
}
.CampaignOptionsLinks .CampaignShow, 
.CampaignOptionsLinks .left, 
.CampaignOptionsLinks .right,
#Campaign_id .LeftImage,
#Campaign_id .RightImage,
#ViewAllCampaignsButtonId .RightEnd,
#ViewAllCampaignsButtonId .ActionIcon,
.ActionButton .RightEnd,
.ActionButton .ActionIcon,
.SmallButton .RightEnd,
.SmallButton .ActionIcon {
    display:none !important;
}
.CampaignOptionsSelected {
    background-color: transparent !important;
    background: transparent;
    display: inline-block;
}
#CampaignList #Campaign_id:nth-child(even), #kbRecentContactListList li:nth-child(even){
    background-color: #f2f2f2;
    border: 1px solid #8080807a;
    border-radius: 5px;
}
#CampaignList #Campaign_id:nth-child(odd), #kbRecentContactListList li:nth-child(odd) {
    background-color: #fff;
    border: 1px solid #8080807a;
    border-radius: 5px;
}
#Campaign_id .CampIcon {
    background: transparent url(images/m.svg) no-repeat scroll left;
	}
#Campaign_id .MidImage {
    background: transparent;
}
.ActionButton a {
    background: #0d5085;
}
#Campaign_id .MidImage {
    width: 100%;
}
#RecentContactListItem li {
    background-image: none;
    padding: 8px;
}
a.SmallButton:hover {
  text-decoration: none;
}

#RecentContactListItem li .ListLink {
    background-image: url(images/Created_Contact_Lists_img.svg);
}
.manage-list-div a {
    background: #0d5085 url(images/Manage_Lists_img.svg) no-repeat scroll left;
    padding-left: 30px;
    background-position: 4px;
    width:150px;
}
.create-email-div a {
    background: #0d5085 url(images/Create_Email_img.svg) no-repeat scroll left;
    padding-left: 30px;
    background-position: 4px;
    width: 140px;
    width:150px;
}
.DashboardPanelSubBox1 {
    width:100%;
    border-top: 1px solid #8080807a;
    padding-top: 13px;
    background: transparent;
}
.DashboardPanelBox1 {
    border: 0px solid #e6f2f3;
    margin-bottom: 10px;
}
.PanelContentBox1 {
    border: 0px solid #badcde; 
}
#campaignshowall .SmallButton {
    width: 100%;
}
.CampaignOptionsLinks .NonCampaignOptionsSelected:last-child {
    margin-right: 0;
}


.CampaignOptionsLinks {
    background-color: transparent !important;
    border-top: 1px solid #badcde;
    border-bottom: 0px solid #badcde;
    padding: 0;
    width: 100%;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}
.CampaignOptionsLinks .NonCampaignOptionsSelected {
    width: 24%;
    margin-right: 1%;
    padding: 10px 0 0 !important;
}
.CampaignOptionsLinks .NonCampaignOptionsSelected .save-btn {
    padding: 7px 6px;
    width:100%;
}
.DashboardPanelSubBox3, .DashboardPanelSubBox1
{
    background: transparent;
}
div.columnChartDiv, .pieChartDiv {
    width:900px;
}

.ContentContainer {
    width: 100% !important;
}
.BodyContainer {
    width: 98.5%;
    margin-top: 10px;
}
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .columnChartDiv, .pieChartDiv {
        width: 58vw !important;
        height: 300px;
        overflow-x: hidden !important;
        text-align: left;
        overflow-y: hidden !important;
    }
    
@media screen and (max-width: 1700px) {
    div.columnChart{
        width: 45vw !important;
        overflow-x: hidden !important;
    }
    .MidImage span:last-child {
        max-width: 150px;
    }
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .columnChartDiv, .pieChartDiv {
        width: 45vw !important;
        height: 300px;
        overflow-x: hidden !important;
        text-align: left;
        overflow-y: hidden !important;
    }
    div.pieChart {
        width: 58vw !important;
        overflow-x: scroll !important;
    }
    div.pieChartDiv {
        width: 58vw !important;
        overflow-x: unset !important;
    }
}

@media screen and (max-width: 1366px) {
    div.columnChart {
        width: 45vw !important;
     }
     .MidImage span:last-child {
        max-width: 150px;
        letter-spacing: -0.5px;
    }
    .CampaignListText,
    .IndexContent a {
        font-size: 13px;
    }
    #Campaign_id .CampIcon {
        width: 30px;
        padding-right: 4px;
    }
    .CampaignOptionsLinks .NonCampaignOptionsSelected {
        width: 49%;
        margin-right: 0;
        padding: 6px 0 0 !important;
    }
    .CampaignOptionsLinks .NonCampaignOptionsSelected .save-btn {
        padding: 6px 6px;
    }
    div.pieChart {
        width: 57vw !important;
        overflow-x: unset !important;
    }
    div.pieChartDiv {
        width: 55vw !important;
        overflow-x: unset !important;
    }
}

@media screen and (max-width: 1260px) {
    div.columnChart {
        width: 45vw !important;
     }
     .MidImage span:last-child {
        max-width: 150px;
        letter-spacing: -0.5px;
    }
    .CampaignListText,
    .IndexContent a {
        font-size: 13px;
    }
    #Campaign_id .CampIcon {
        width: 30px;
        padding-right: 4px;
    }
    .CampaignOptionsLinks .NonCampaignOptionsSelected {
        width: 49%;
        margin-right: 0;
        padding: 6px 0 0 !important;
    }
    .CampaignOptionsLinks .NonCampaignOptionsSelected .save-btn {
        padding: 6px 6px;
    }
    div.pieChart {
        width: 45vw !important;
        overflow-x: scroll !important;
    }
    div.pieChartDiv {
        width: 58vw !important;
        overflow-x: unset !important;
    }
}

@media screen and (max-width: 1040px) {
    div.columnChart{
        width: 407px !important;
        overflow-x: auto !important;
    }
    .pieChartDiv {
        overflow: hidden !important;
    }
}
@media screen and (max-width: 1024px) {
    .pieChartDiv {
        overflow: hidden !important;
    }
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .pieChartDiv {
        width: 65vw !important;
        overflow-x: hidden !important;
    }
    #StartLinks .PanelHeaderBox1  {
        //width: 381px;
        width: 100%;
    }
    div.columnChart, div.pieChart{
        width: 50vw !important;
        overflow-x: scroll !important;
    }
    
    .MidImage span:last-child {
        word-break: break-all;
        max-width: 92px;
        font-size: 13px;
    }
    .CampaignListText > div {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 165px;
    }
    .columnChartDiv {
        width: 50vw !important;
        height: 300px;
        overflow-x: hidden !important;
        text-align: left;
        overflow-y: hidden !important;
    }
    .pieChartDiv {
        overflow: hidden !important;
    }
}
@media screen and (min-width: 1000px) {
    .columnChartDiv, pieChartDiv {
        width:800px;
    }
    .active .columnChartDiv, .active .pieChartDiv  {
        width:100%;
    }
    .pieChartDiv {
        overflow: hidden !important;
    }
}
@media screen and (max-width: 780px) {
    div.columnChart, div.pieChart {
        width: 407px !important;
        overflow-x: hidden !important;
    }
    .columnChart, div.pieChart {
        width: 94vw;
        overflow-x: scroll;
     }
    .columnChartDiv, .pieChartDiv {
        width: 750px !important;
    }
    #StartLinks .PanelHeaderBox1 {
        width: 100%;
    }
}
@media screen and (max-width: 768px) {
    .main-tr > td:first-child {
        width: 100%;
    }
    .CampaignOptionsLinks .NonCampaignOptionsSelected {
        width: 24%;
    }
    div.columnChart, div.pieChart{
        width: 90vw !important;
        overflow-x: scroll !important;
    }
    #wrapper.active .page-container {
    padding-left: 4px;
    }
    .main-tr {
        display: flex;
        flex-direction: column;
    }
    #HpCampaignPanel {
        width:100%;
    }
  
    .MidImage span:last-child {
    word-break: break-all;
    max-width: 50%;
    font-size: 14px;
    }
    .CampaignOptionsLinks {
        text-align:center;
    }
    #StatsLinks {
        padding:0px !important;
    }

    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .DashboardPanelSubBox3 {
        width:98%;
    }
    .BodyContainer {
        width: 100% !important;
        margin: 0px !important;
    }
}
@media screen and (max-width: 740px) {
    .CampaignOptionsLinks .NonCampaignOptionsSelected {
        width: 49%;
        margin-right: 0;
        padding: 6px 0 0 !important;
    }
    #campaignshowall .SmallButton {
        width: 100% !important;
    }
    .main-tr > td:first-child {
        width: 100%;
    }
}
@media screen and (max-width: 568px) {
    div.columnChart, div.pieChart{
        width: 90vw !important;
        overflow-x: scroll !important;
    }
    #wrapper.active .page-container {
        padding-left: 4px;
    }
    .main-tr {
        display: flex;
        flex-direction: column;
    }
    #HpCampaignPanel {
        width:100%;
    }

    .MidImage span:last-child {
        word-break: break-all;
        max-width: 50%;
        font-size: 14px;
    }
    .CampaignOptionsLinks {
        text-align:center;
    }
    #StatsLinks {
        padding:0px !important;
    }
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .DashboardPanelSubBox3 {
        width:98%;
    }
    .BodyContainer {
        width: 95.5% !important;
    }
}
@media screen and (max-width: 411px) {
    .main-tr {
        display: flex;
        flex-direction: column;
    }
    .ContentContainer {
        padding: 0px !important;
    }
    .manage-list-div a, .create-email-div a {
        padding-left: 35px;
        width: auto;
    }
    .CampaignOptionsLinks {
        padding: 0;
        padding-top:10px;
    }
    .CampaignOptionsSelected{
        display:inline-block;
    }
    
    #Campaign_id .MidImage, #CampaignList #Campaign_id {    
        height: auto !important;
    }
        .MidImage .CampaignListText {
        float:none !important;
    }
    #Campaign_id:after {
        content: "";
        clear: both;
        display: block;
    }
    .MidImage span:last-child{
        margin-top: 8px;
        display: block;
        margin-left: 33px;
        background: #fff;
        width: fit-content;
        padding: 4px 8px;
        border-radius: 3px;
        border: 1px solid #ccc;
	}
    #StatsLinks {
        padding:0px !important;
    }
    div.columnChart, div.pieChart {
        width: 330px !important;
        overflow-x: scroll !important;
    }
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .DashboardPanelSubBox3 {
        width:98%;
    }
    .BodyContainer {
    width: 99% !important;
    margin: 0px 2px !important;
}
}
@media screen and (max-width: 375px) {
    div.columnChart, div.pieChart {
        width: 305px !important;
        overflow-x: scroll !important;
    }
   
    .manage-list-div a, .create-email-div a {
        padding-left: 30px;
    }
    #CampaignOptions {
        text-align:center;
        padding-top: 10px;
    }
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .DashboardPanelSubBox3 {
        width:98%;
    }
    .BodyContainer {
        width: 98.5% !important;
    }
}
@media screen and (max-width: 360px) {
.BodyContainer {
    margin: 6px 2px 6px 2px;
    }
    div.columnChart, div.pieChart {
    width: 290px !important;
    overflow-x: scroll !important;
    }
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .DashboardPanelSubBox3 {
        width:98%;
    }
    .BodyContainer {
        width: 99% !important;    margin: 0px 2px !important;
    }
}
@media screen and (max-width: 320px) {
    div.columnChart, div.pieChart {
        width: 257px !important;
        overflow-x: scroll !important;
    }
   
    .manage-list-div a, .create-email-div a {
        padding-left: 30px;
    }
    .DashboardPanelSubBox1 .btn {
        padding: 5px;
        padding-left: 30px;
    }
    .PanelHeaderBox1 .QuickLink, .HideThis {
        word-break: break-all;
        width: 160px;
    }
    .BodyContainer {
        width: 100%;
        margin: 0px 0px 1px 2px;
    }
    .PanelHeaderBox1 {
        font-family: Arial, Tahoma, Verdana, Helvetica, Sans-Serif;
        font-size: 14px;
        color: #000000;
        padding: 10px;
    }
    .Heading1New, .DashboardPanelSubBox1 {
        padding-left: 10px;
        padding-right: 10px;
    }
    .QuickLink {
        text-align: right;
        word-break: break-word !important;
    }
    .DashboardPanelSubBox3TD {
        padding-left:10px !important;
    }
    .DashboardPanelSubBox3 {
        width:98%;
    }
    .BodyContainer {
        width: 99% !important;
    }
}

a[title="JavaScript charts"] {
    display : none !important;
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