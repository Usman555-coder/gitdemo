<style>
    .sidebar {
        display:none;
    }
    @media screen and (max-width: 1024px) {
        aside.sidebar.position.fixed {
            left:-300px;
            z-index: 99999 !important;
        }
        .page-container{
            padding-left: 0;
        }
        a#sidebar-toggle {
            margin-right: -17px;
        }
        #wrapper.active.sidebar {
            width: 300px;
            z-index: 99999 !important;
            left: 0;
        }
    }​​​​​​​​
</style>
<aside class="sidebar position-fixed" style="z-index: 1;">
    <div class="sidebar-inner position-relative">
        <ul class="sidebar-menu position-relative m-0 p-0 overflow-auto">
            <li class="nav-item position-relative">
                <a href="javascript:void(0)" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item justify-content-between" data-toggle="collapse" href="email-marketing-home.html" role="button" data-target="#emailCollapse" aria-expanded="false" aria-controls="emailCollapse">
                    <span>
                        <img src="assets/images/email-24px.svg" class="align-middle" alt="Shared" />
                        <span style="vertical-align: middle;font-size:15px">Email Marketing</span>
                    </span>
                    <span class="arrow-icon" style="font-size: 11px; vertical-align: middle; margin-right: 3px;">
                        <i class="fa fa-chevron-up" aria-hidden="true"></i>
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                    </span>
                </a>
            </li>
            <div class="collapse collapse-support show" id="emailCollapse">
                <ul>
                    <li class="nav-item position-relative <?php if(basename($_SERVER['PHP_SELF'])=="index.php") echo "active "; ?> overview_button">
                        <a href="index.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none">
                            <img src="assets/images/noun_customer service_848588.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Overview</span>
                        </a>
                    </li>
                    <li class="nav-item position-relative <?php if(basename($_SERVER['PHP_SELF'])=="contactlist.php") echo "active "; ?> contactlist_button">
                        <a href="contactlist.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none">
                            <img src="assets/images/contactBook.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Contact Lists</span>
                        </a>
                    </li>
                    <li class="position-relative <?php if(basename($_SERVER['PHP_SELF'])=="contacts.php") echo "active "; ?> contact_button">
                        <a href="contacts.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item">
                            <img src="assets/images/noun_contact_196772.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Contacts</span></a>
                    </li>
                    <li class="position-relative <?php if(basename($_SERVER['PHP_SELF'])=="email_campaigns.php") echo "active "; ?> newsletter_button">
                        <a href="email_campaigns.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item">
                            <img src="assets/images/Group 18669.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Email Campaigns</span></a>
                    </li>
                    <li class="position-relative <?php if(basename($_SERVER['PHP_SELF'])=="surveys.php") echo "active "; ?> surveys_button">
                        <a href="surveys.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item">
                            <img src="assets/images/noun_Survey_16392.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Surveys</span></a>
                    </li>
                    <li class="position-relative <?php if(basename($_SERVER['PHP_SELF'])=="autoresponders.php") echo "active "; ?> autoresponder_button">
                        <a href="autoresponders.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item">
                            <img src="assets/images/Group 2739.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Autoresponders</span></a>
                    </li>
                    <li class="position-relative <?php if(basename($_SERVER['PHP_SELF'])=="statistics.php") echo "active "; ?> statistics_button">
                        <a href="statistics.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item">
                            <img src="assets/images/noun_template_798185.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Statistics</span></a>
                    </li>
                    <li class="nav-item position-relative <?php if(basename($_SERVER['PHP_SELF'])=="settings.php") echo "active"; ?> settings_button">
                        <a href="settings.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none">
                            <img src="assets/images/noun_customer service_848588.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Settings</span>
                        </a>
                    </li>
                </ul>
            </div>
            
            <!-- <li class="nav-item position-relative">
                <a href="javascript:void(0)" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item justify-content-between" data-toggle="collapse" href="email-marketing-home.html" role="button" data-target="#settingCollapse" aria-expanded="false" aria-controls="settingCollapse">
                    <span>
                        <img src="assets/images/email-24px.svg" class="align-middle" alt="Shared" />
                        <span style="vertical-align: middle;font-size:15px">EMM Settings</span>
                    </span>
                    <span class="arrow-icon" style="font-size: 11px; vertical-align: middle; margin-right: 3px;">
                        <i class="fa fa-chevron-up" aria-hidden="true"></i>
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                    </span>
                </a>
            </li>
            <div class="collapse collapse-support show" id="settingCollapse">
                <ul>
                    <li class="nav-item position-relative <?php if(basename($_SERVER['PHP_SELF'])=="settings.php") echo "active"; ?>">
                        <a href="settings.php" class="sidebar-link collapsed d-flex position-relative text-decoration-none">
                            <img src="assets/images/noun_customer service_848588.svg" class="align-middle" alt="Documents" />
                            <span style="vertical-align: middle;font-size:15px">Settings</span>
                        </a>
                    </li>
                </ul>
            </div> -->

            <li class="nav-item position-relative">
                <a href="javascript:void(0)" onclick="abc()" class="sidebar-link collapsed d-flex position-relative text-decoration-none shared-item justify-content-between" data-toggle="collapse" href="email-marketing-home.html" role="button" aria-expanded="false">
                    <span>
                        <img src="assets/images/Logout.svg" class="align-middle" alt="Shared" />
                        <span style="vertical-align: middle;font-size:15px">Logout</span>
                    </span>
                </a>
            </li>
        </ul>
        <a id="sidebar-toggle" class="sidebar-toggle d-flex align-items-center justify-content-center position-absolute" href="javascript:void(0);">
            <i class="fa fa-chevron-left" aria-hidden="true"></i>
            <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </a>
    </div>
</aside>


<script>
    var mainMenuItems = [
    'overview_button',
    'contact_button',
    'contactlist_button',
    'newsletter_button',
    'autoresponder_button',
    'statistics_button',
    'surveys_button',
    'settings_button'];
    for (const [key, value] of Object.entries(mainMenuItems)) {
        $('.'+value).hide();
    }
</script>