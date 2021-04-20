<style type="text/css">
.popupContainer {
        border: 0px;
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
<link rel="stylesheet" href="../../assets/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../../assets/css/main.css" type="text/css">
<form action="index.php?Page=%%PAGE%%&Action=%%GLOBAL_SubmitAction%%" method="post" name="frmLogin" id="frmLogin" class="myFormstyle">
    <div id="box" class="loginBox">
        <table><tr><td>
                    <table>
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
                                <table>

                                    <tr>
                                        <td nowrap="nowrap" style="padding:0px 10px 0px 10px">%%LNG_UserName%%:</td>
                                        <td>
                                            <input type="text" name="ss_username" id="username" class="Field150 form-control" value="%%GLOBAL_ss_username%%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td style="padding-top:10px">
                                            <input type="submit" name="SubmitButton" value="%%LNG_SendPassword%%" class="FormButton btn btn-primary" style="width:110px">
                                        </td>
                                    </tr>

                                    <tr><td class="Gap"></td></tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td></tr>
        </table>

    </div>

</form>

<script>

    $('#frmLogin').submit(function () {
        var f = document.frmLogin;

        if (f.ss_username.value == '')
        {
            alert('%%LNG_NoUsername%%');
            f.ss_username.focus();
            return false;
        }

        // Everything is OK
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
        $('#ss_username').focus();
        $('#ss_username').select();
    });

    $(window).resize(function () {
        sizeBox();
    });
    createCookie("screenWidth", screen.availWidth, 1);

</script>