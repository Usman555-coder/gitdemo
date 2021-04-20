<?php 

$mainmenu='';
$submenu='';
$home=true;
if($_GET['Page']=='Subscribers'){
    $mainmenu="Contacts";
    {* $mainmenu="Contacts";
    $homemenuadd=$_SERVER['REQUEST_URI'];
    echo $homemenuadd."</br>";
    $homemenuadd=substr($homemenuadd, strpos($homemenuadd, "?") + 1); 
    $homemenuadd="index.php?".$homemenuadd;
    echo $homemenuadd; *}
    $homemenuadd="index.php?Page=Subscribers&Action=Manage&Lists=any";
    
    if($_GET['Action']=="Add"){
        $submenu='Add a Contact';
    }elseif($_GET['Action']=="Manage" && $_GET['SubAction']==''){
        $submenu='View All Contacts';
    }elseif($_GET['Action']=="Manage" && $_GET['SubAction']=='AdvancedSearch'){
        $submenu='Search Contacts';
    }elseif($_GET['Action']=="Import"){
        $submenu='Import Contacts From a File';
    }elseif($_GET['Action']=="Export"){
        $submenu='Export Contacts From a File';
    }elseif($_GET['Action']=="Remove"){
        $submenu='Remove Contacts';
    }elseif($_GET['Action']=="Banned" && $_GET['SubAction']==''){
        $submenu='Email Supression List';
    }elseif($_GET['Action']=="Banned" && $_GET['SubAction']=='Add'){
        $submenu='Suppress an Email or Domain';
    }
    
}elseif($_GET['Page']=='Lists'){
    $mainmenu="Contact Lists";
    $homemenuadd="index.php?Page=Lists";
    if($_GET['Action']=="create"){
        $submenu='Create a Contact List';
    }elseif($_GET['Action']==""){
        $submenu='View Contact Lists';
    }
}elseif($_GET['Page']=='Newsletters'){
    $mainmenu="Email Campaigns";
    $homemenuadd="index.php?Page=Newsletters&Action=Manage";
    if($_GET['Action']=="Manage"){
        $submenu='View Email Campaigns';
    }elseif($_GET['Action']=="Create"){
        $submenu='Create an Email Campaign';
    }
}elseif($_GET['Page']=='Autoresponders'){
    $mainmenu="Autoresponders";
    $homemenuadd="index.php?Page=Autoresponders";
    if($_GET['Action']==""){
        $submenu='View Autoresponders';
    }elseif($_GET['Action']=="Create"){
        $submenu='Create an Autoresponder';
    }

}elseif($_GET['Page']=='Addons' && $_GET['Addon']!='splittest' && $_GET['Addon']!='dynamiccontenttags' ){
    $mainmenu="Surveys";
    $homemenuadd="index.php?Page=Addons&Addon=surveys";
    if($_GET['Addon']=="surveys" && $_GET['Action']=='' ){
        $submenu='View Surveys';
    }elseif($_GET['Addon']=="surveys" && $_GET['Action']=='create'){
        $submenu='Create a Survey';
    }elseif($_GET['Addon']=="surveys" && $_GET['Action']=='resultdefault'){
        $submenu='Survey Results';
    }elseif($_GET['Addon']=="surveys" && $_GET['Action']=='viewResponsesDefault'){
        $submenu='Browse Responses';
    }elseif($_GET['Addon']=="surveys" && $_GET['Action']=='exportDefault'){
        $submenu='Export Responses';
    }

}elseif($_GET['Page']=='Stats'){
    $mainmenu="Statistics";
    $homemenuadd="index.php?Page=Stats";
    if($_GET['Action']==""){
        $submenu='Email Campaign Statistics';
    }elseif($_GET['Addon']=="splittest" && $_GET['Action']=='Stats'){
        $submenu='Split Test Statistics';
    }elseif($_GET['Action']=="Autoresponders"){
        $submenu='Autoresponder Statistics';
    }elseif($_GET['Action']=="TriggerEmails"){
        $submenu='Trigger Statistics';
    }elseif($_GET['Action']=="List"){
        $submenu='Contact List Statistics';
    }elseif($_GET['Action']=="User"){
        $submenu='User Account Statistics';
    }

}elseif($_GET['Page']=='CustomFields'){
    $mainmenu="Contact Lists";
    $homemenuadd="index.php?Page=Lists";
    $submenu='View Custom Field';
}elseif($_GET['Page']=='Bounce'){
    $mainmenu="Contact Lists";
    $homemenuadd="index.php?Page=Lists";
    $submenu='Process Bounced Emails';
}elseif($_GET['Page']=='Segment'){
    $mainmenu="Contact Lists";
    $submenu='View Segments';
    $homemenuadd="index.php?Page=Lists";
}elseif($_GET['Page']=='Send'){
    $mainmenu="Email Campaigns";
    $homemenuadd="index.php?Page=Newsletters&Action=Manage";
    $submenu='Send an Email Campaign';
}elseif($_GET['Page']=='ImageManager'){
    $mainmenu="Email Campaigns";
    $homemenuadd="index.php?Page=Newsletters&Action=Manage";
    $submenu='Image Manager';
}elseif($_GET['Page']=='Addons' && $_GET['Addon']=='splittest' && $_GET['Action']!='Stats'){
    $mainmenu="Email Campaigns";
    $homemenuadd="index.php?Page=Newsletters&Action=Manage";
    $submenu='View Split Tests';
}elseif($_GET['Page']=='Addons' && $_GET['Addon']=='splittest' && $_GET['Action']=='Stats'){
    $mainmenu="Statistics";
    $homemenuadd="index.php?Page=Stats";
    $submenu='View Split Tests';
}elseif($_GET['Page']=='Addons' && $_GET['Addon']=='dynamiccontenttags'){
    $mainmenu="Email Campaigns";
    $homemenuadd="index.php?Page=Newsletters&Action=Manage";
    $submenu='Dynamic Content Tags';
}elseif($_GET['Page']=='Schedule'){
    $mainmenu="Email Campaigns";
    $homemenuadd="index.php?Page=Newsletters&Action=Manage";
    $submenu='View Scheduled Email Queue';
}elseif($_GET['Page']=='TriggerEmails'){
    $mainmenu="Autoresponders";
    $homemenuadd="index.php?Page=Autoresponders";
    $submenu='View Triggers';
}elseif($_GET['Page']=='Settings'){
    $mainmenu="Settings";
    $homemenuadd="index.php?Page=Settings";
    $submenu='Settings';
}else{
    $mainmenu="Overview";
    $home=false;
}

?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>%%GLOBAL_ApplicationTitle%%</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        {* <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet" /> *}
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/css/main.css" type="text/css" />

        
        <link rel="shortcut icon" href="%%GLOBAL_ApplicationFavicon%%" type="image/vnd.microsoft.icon">
        <link rel="icon" href="%%GLOBAL_ApplicationFavicon%%" type="image/vnd.microsoft.icon">
        <meta http-equiv="Content-Type" content="text/html; charset=%%GLOBAL_CHARSET%%">
        <link rel="stylesheet" href="includes/styles/stylesheetdap.css" type="text/css">
        <link rel="stylesheet" href="includes/styles/tabmenu.css" type="text/css">
        <link rel="stylesheet" href="includes/styles/thickbox.css" type="text/css">
        <link rel="stylesheet" href="includes/js/imodal/imodal.css" type="text/css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        {* <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"> *}
        <!--[if IE]>
        <style type="text/css"> 
                @import url("includes/styles/ie.css");
        </style>
        <![endif]-->
        
        <!--<script src="includes/js/jquery.js" type="text/javascript"></script>-->
     
        <script src="assets/js/jquery.js" type="text/javascript"></script>
        <script src="assets/js/popper.min.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script>
        var $jq1 = jQuery.noConflict(true);
        </script>
        <script src="includes/js/jquery.js" type="text/javascript"></script>
    
        
        <!--
        <script src="assets/js/jquery.js" type="text/javascript"></script>
        <script src="assets/js/common.js" type="text/javascript"></script>
        <script src="assets/js/popper.min.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        -->

        <!--<script src="includes/js/jquery.js" type="text/javascript"></script>-->
        <script src="includes/js/jquery/jquery.json-1.3.min.js" type="text/javascript"></script>
        <script src="includes/js/jquery/thickbox.js" type="text/javascript"></script>
        {* <script src="includes/js/javascript.js" type="text/javascript"></script> *}
        <script src="includes/js/javascriptDap.js" type="text/javascript"></script>
        <script src="includes/js/tiny_mce/tiny_mce.js" type="text/javascript"></script>
        <script src="includes/js/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="includes/js/amcharts/pie.js" type="text/javascript"></script>
        <script src="includes/js/amcharts/serial.js" type="text/javascript"></script>
        <script type="text/javascript">
            AmCharts.loadJSON = function (url) {
                // create the request
                if (window.XMLHttpRequest) {
                    // IE7+, Firefox, Chrome, Opera, Safari
                    var request = new XMLHttpRequest();
                } else {
                    // code for IE6, IE5
                    var request = new ActiveXObject('Microsoft.XMLHTTP');
                }
                request.open('GET', url, false);
                request.send();
                return JSON.parse(request.responseText);
            };
        </script>
        <script type="text/javascript">
            var UnsubLinkPlaceholder = "%%LNG_UnsubLinkPlaceholder%%";
            var UsingWYSIWYG = '%%GLOBAL_UsingWYSIWYG%%';
            var Searchbox_Type_Prompt = "%%LNG_Searchbox_Type_Prompt%%";
            var Searchbox_List_Info = '%%GLOBAL_Searchbox_List_Info%%';
            var Application_Title = '%%LNG_ApplicationTitle%%';
            Application.Misc.specifyDocumentMinWidth(935);
            Application.Misc.setPingServer('ping.php', 120000);
        </script>
        <script>
            var parentBody = window.parent.document.body
            $(parentBody).find(".sidebar").css('display','block');
            $(parentBody).find(".no-page-container").removeClass('no-page-container').addClass('page-container');
            $(document).ready(function() {
                parent.scrollTo(0,0);
            });
        </script>
        <script src="../../assets/js/iframeResizer.contentWindow.min.js"></script>
        <script>
            $(window).load(function() {
                parent.postMessage({'menu': <?php echo json_encode($GLOBALS['parent_menu']); ?>, 'smenu': <?php echo json_encode($GLOBALS['parent_setting_menu']); ?>});
            });
            setInterval(function(){ parent.postMessage({'menu': <?php echo json_encode($GLOBALS['parent_menu']); ?>, 'smenu': <?php echo json_encode($GLOBALS['parent_setting_menu']); ?>});
             }, 500);
        </script>
    </head>
    <style>
    
    .main-content .card,
    .breadcrumb-list{
        margin-right:10px;
    }
    </style>
    <body>
        <div id="wrapper">
            <section class="page-container">
                <div class="inner-container">
                    <main class="main-content">
                        <nav aria-label="breadcrumb" class="breadcrumb-list">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item" aria-current="page">
                                    <a href="<?php echo $homemenuadd; ?>" style="font-size: 16px;"><?php echo $mainmenu; ?></a>
                                </li>
                                <?php if($home) { ?>
                                <li class="breadcrumb-item" aria-current="page">
                                    <span style="font-size: 16px;"><?php echo $submenu; ?></span>
                                </li>
                                <?php } ?>
                            </ol>
                        </nav>
                        <?php if($GLOBALS['menu_exists']=='1') { ?>
                        <div class="inner-content">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="common-tabs">
                                            %%GLOBAL_MenuLinks%%
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>

                        <div class="card mb-3">

                            {if $TrialNotification}<div id="IEM_Header_TrialNotificationBar">{$TrialNotification}</div>{/if}
                            <div style="padding:0px">
                                <div class="ContentContainer" style="border: 0px;padding: 20px 10px 10px 10px; width:100%;">
                                    <div class="BodyContainer" style="position:relative">
                                        {if $ShowTestModeWarning}
                                            <div class="TestModeEnabled">
                                                <div style="valign: top">
                                                    <img src="images/critical.gif"  align="left" hspace="5">
                                                    {$SendTestWarningMessage}
                                                </div>
                                            </div>
                                        {/if}
                                        %%GLOBAL_BodyAddons%%