<script>
    var parentBody = window.parent.document.body
    $(parentBody).find(".sidebar").css('display','none');
    $(parentBody).find(".page-container").removeClass('page-container').addClass('no-page-container');

    $(function () {
        $(document.frmLogin.ss_takemeto).val('%%GLOBAL_ss_takemeto%%');
    });
</script>
<link rel="stylesheet" href="../../assets/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../../assets/css/main.css" type="text/css">
<form action="index.php?Page=Login&Action=%%GLOBAL_SubmitAction%%" method="post" name="frmLogin" id="frmLogin" class="myFormstyle" autocomplete="off">
    <div id="box" class="loginBox">
        <table class="subTable">
            <tr>
                <td>
                    <table class="subTable">
                        <tr>
                            <td class="Heading1">
                                <img src="%%WHITELABEL_ApplicationLogoImage%%" alt="{$lang.SendingSystem}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:10px 0px 5px 0px">%%GLOBAL_Message%%</td>
                        </tr>
                        <tr>
                            <td>
                                <table class="subTable">

                                    <tr>
                                        <td nowrap="nowrap" style="padding:0px 10px 0px 0px">%%LNG_UserName%%:</td>
                                        <td>
                                            <input type="text" name="ss_username" id="username" class="Field150 form-control" autocomplete="off">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" style="padding:0px 10px 0px 0px">%%LNG_EnterPassword%%:</td>
                                        <td>
                                            <input type="password" name="ss_password" id="password" class="Field150 form-control" autocomplete="off">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" style="padding:0px 10px 0px 0px">%%LNG_TakeMeTo%%:</td>
                                        <td>
                                            <select name="ss_takemeto" class="Field150 form-control">
                                                <option value="index.php">%%LNG_TakeMeTo_HomePage%%</option>
                                                <option value="index.php?Page=Subscribers&Action=Manage">%%LNG_TakeMeTo_Contacts%%</option>
                                                <option value="index.php?Page=Lists">%%LNG_TakeMeTo_Lists%%</option>
                                                <option value="index.php?Page=Segment">%%LNG_TakeMeTo_Segments%%</option>
                                                <option value="index.php?Page=Newsletters&Action=Manage">%%LNG_TakeMeTo_Campaign%%</option>
                                                <option value="index.php?Page=Autoresponders&Action=Manage">%%LNG_TakeMeTo_Autoresponder%%</option>
                                                <option value="index.php?Page=Stats">%%LNG_TakeMeTo_Statistics%%</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td style="padding-top:10px">
                                            <input type="submit" name="SubmitButton" value="%%LNG_Login%%" class="FormButton btn btn-primary">
                                            &nbsp;&nbsp;%%LNG_ForgotPasswordReminder%%
                                        </td>
                                    </tr>
                                    <tr><td class="Gap"></td></tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="PageFooter CustomFooter" style="padding: 10px 0px; margin-bottom: 20px; width:90%; text-align: center;">
        %%LNG_Copyright%%
    </div>
</form>
<style>
.sidebar {
    display:none;
}
.subTable {
    width:100%;
}
.CustomFooter{
    position:absolute !important;
    margin-top:15px !important;
    //margin-left:84px !important;
}
.myFormstyle {
    position: absolute;
     transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);
    -ms-transform:: translate(-50%, -50%);
    -webkit: translate(-50%, -50%);
    -moz-transform:: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    -webkit-transform: -webkit-translate(-50%, -50%);
    left: 50%;
    top: 40%;
    background: #fff;
    width: 400px;
    border: solid 2px #DDD;
    padding: 20px;
}
.loginBox {
    position: static !important;
    top: auto !important;
    left: inherit !important;
}
a{
        display:inline-block;
}
@media screen and (max-width:414px){
    .myFormstyle{
        width:90% !important;
    }
    
}
</style>

<script>

    $('#frmLogin').submit(function () {
        var f = document.frmLogin;

        if (f.username.value == '')
        {
            alert('Please enter your username.');
            f.username.focus();
            f.username.select();
            return false;
        }

        if (f.password.value == '')
        {
            alert('Please enter your password.');
            f.password.focus();
            f.password.select();
            return false;
        }

        // Everything is OK
        f.action = 'index.php?Page=Login&Action=%%GLOBAL_SubmitAction%%';
        return true;
    });

    function sizeBox() {
        var w = $(window).width();
        var h = $(window).height();
        $('#box').css('position', 'absolute');
        $('#box').css('top', h / 2 - ($('#box').height() / 2) - 50);
        $('#box').css('left', w / 2 - ($('#box').width() / 2));
    }

    $(document).ready(function () {
        sizeBox();
        $('#username').focus();
    });

    $(window).resize(function () {
        sizeBox();
    });
    createCookie("screenWidth", screen.availWidth, 1);

</script>
