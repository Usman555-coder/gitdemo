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
     
        <script src="assets/js/jquery.js" type="text/javascript"></script>
        <script src="assets/js/popper.min.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script>
        var $jq1 = jQuery.noConflict(true);
        </script>
        <script src="includes/js/jquery.js" type="text/javascript"></script>
        <script src="includes/js/javascriptDap.js" type="text/javascript"></script>
        <script>
            var parentBody = window.parent.document.body
            $(parentBody).find(".sidebar").css('display','block');
            $(parentBody).find(".no-page-container").removeClass('no-page-container').addClass('page-container');
            $(document).ready(function() {
                parent.scrollTo(0,0);
            });
        </script>
        <script>
            $(window).load(function() {
                parent.postMessage({'menu': <?php echo json_encode($GLOBALS['parent_menu']); ?>});
            });
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
            <section class="page-container" style="background-color:unset;">
                <div class="inner-container">
                    <main class="main-content">

                        <div class="mb-3">
                            <div style="padding:0px">
                                <div class="ContentContainer" style="border: 0px;padding: 20px 10px 10px 10px; width:100%;">
                                    <div class="BodyContainer" style="position:relative">
                                        <br />
                                        <table border="0" cellspacing="0" cellpadding="0" width="95%" align="center">
                                            <tr>
                                                <td class="Message" width="20" style="background-color: #fb483a !important; padding: 8px; margin-bottom: 10px; color: #ffffff;">
                                                    <img src="images/error.gif" width="18" height="18" hspace="10" alt="error" />
                                                </td>

                                                <td class="Message" width="100%" style="background-color: #fb483a !important; padding: 8px; margin-bottom: 10px; color: #ffffff;">{$ErrorMessage}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <button id="btnAccessDeniedGoBack" class="FormButton  btn save-btn" class="Button">
                                                        {$lang.GoBack}
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                        <br/>
                                        <script>
                                            $('button#btnAccessDeniedGoBack').click(function () {
                                                history.go(-1);
                                            });
                                        </script>