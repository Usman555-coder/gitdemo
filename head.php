<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="icon" href="assets/images/favicon.ico" type="image/vnd.microsoft.icon">
    <title>Doxim Email Marketing Management (EMM)</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" type="text/css" />

    <script src="assets/js/jquery.js" type="text/javascript"></script>
    <script src="assets/js/common.js" type="text/javascript"></script>
    <script src="assets/js/popper.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function() {
            $("#sidebar-toggle").click(function() {
                $(".h_iframe").toggleClass("reduceframe");
            });
        });
        window.addEventListener('resize', function() {
            if (window.innerWidth < 800) {
                $("#wrapper").addClass("active");
            }
        }, false);
        $(document).ready(function() {
            if (window.innerWidth < 800) {
                $("#wrapper").addClass("active");
            }
        });
        
    </script>

    <style>
        body {
            overflow: hidden;
        }

        main.main-content {
            padding-right: 0 !important;
        }

        .h_iframe {
            position: relative;
            width: 100%;
            overflow: hidden;
            padding-top: 98vh;
        }

        .h_iframe.reduceframe {
            padding-top: 100vh;
        }

        .responsive-iframe {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
        @media screen and (max-width: 1366px) {
            .h_iframe {
                padding-top: 97vh;
            }
        }
        @media screen and (max-width: 1024px) {

            .h_iframe,
            .h_iframe.reduceframe {
                padding-top: 100vh;
            }
            /*html, body {
                    margin: 0; 
                    height: 100%; 
                    overflow: hidden;
                    overflow-y: scroll;
                }*/
        }


        @media screen and (max-width: 768px) {

            .h_iframe,
            .h_iframe.reduceframe {
                padding-top: 100vh;
            }
        }

        @media only screen and (min-width: 375px) and (max-width: 812px) and (orientation: landscape) {
            .h_iframe {
                padding-top: 67%;
            }

            .h_iframe,
            .h_iframe.reduceframe {
                padding-top: 100vh;
            }
        }

        @media screen and (max-width: 767px) {

            .h_iframe,
            .h_iframe.reduceframe {
                padding-top: 100vh;
            }
        }
    </style>
        
    <script>
    function handleMessage(event) {
        if (event.data['task'] == 'scroll_top') {
            window.scrollTo(0, 0);
        }
    }
    function handleMenu(event) {
        if(event!=undefined) {
            //console.log((event.data['menu']));
            var menuItems = event.data['menu'];
            for (const [key, value] of Object.entries(menuItems)) {
                $('.'+key).show();
            }
            //console.log((event.data['smenu']));
            var smenuItems = event.data['smenu'];
            //console.log(Object.keys(smenuItems).length);
            if(Object.keys(smenuItems).length>0) {
                $('.settings_button').show();
            }
        }
    }
    window.onload = function() {
        window.addEventListener("message", handleMessage, false);
        window.addEventListener("message", handleMenu, false);
    }
    setInterval(function(){ handleMenu(); }, 500);
    </script>

</head>