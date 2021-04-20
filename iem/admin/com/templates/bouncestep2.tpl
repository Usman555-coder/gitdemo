{assign step="2"}
{template="bounce_navigation"}

<script src="includes/js/jquery/form.js"></script>
<script>

    $(function () {

        // Make sure this is hidden if coming back from a future step.
        if (!$('#autobounceoption').attr('checked')) {
            showManual();
        } else {
            showAuto();
        }

        $('#autobounceoption').click(function () {
            showAuto();
        });

        $('#bounce_process').click(function () {
            showManual();
        });

        // Set up help popups.
        var topics = ['auto_explain', 'manual_explain'];
        $(topics).each(function (i, e) {
            $('#' + e).click(function (event) {
                showHelp(e);
                // Don't actually change the option when they click the 'why?' link.
                event.stopPropagation();
                return false;
            });
        });

    });

    function showAuto()
    {
        $('#BounceButton').val('{$lang.Bounce_Auto_Button}').unbind();
        $('#BounceButton').click(function () {
    {if $system_access}
            window.location.href = 'index.php?Page=Bounce';
    {else}
            window.location.href = 'index.php?Page=Bounce&Action=BounceStep3 ';
    {/if}
        })
        $('.YesProcessBounce').hide();
        $('#auto_settings').show();
    }

    function showManual()
    {
        $('#BounceButton').val('{$lang.Bounce_Test_Conn_Cont}').unbind();
        $('#BounceButton').click(function () {
            if (Application.Page.BounceInfo.validateFields()) {
                TestBounceDetails();
            }
        })
        $('#auto_settings').hide();
        $('.YesProcessBounce').show();
    }

    function TestBounceDetails()
    {
        var x = 'index.php?Page=Bounce&Action=PopupBounceTest' + Application.Page.BounceInfo.getBounceParameters() + '&keepThis=true&TB_iframe=true&height=240&width=400&modal=true&random=' + new Date().getTime();
        tb_show('', x, '');
    }

    function showHelp(topic)
    {
        var url = 'index.php?Page=Bounce&Action=Help&Topic=' + topic + '&keepThis=true&TB_iframe=true&height=200&width=400&random=' + new Date().getTime();
        tb_show('{$lang.BounceProcessHelp}', url, '');
    }

</script>

<form method="post" action="index.php?Page=Bounce&Action=BounceStep3">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                {$lang.Bounce_Step1}
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    {$lang.Bounce_Step1_Intro}
                </p>
            </td>
        </tr>
        <tr>
            <td>
                {$message}
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr valign="top" style="background-color:#F9F9F9;">
                        
                            <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Panel">
                                <tr>
                                    <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                                        {$lang.SelectAContactList}
                                    </td>
                                </tr>
                                <tr height="15px"></tr>
                                <tr>
                                    <td width="20%"  class="Field FirstTd">
                                        {template="Required"}
                                        {$lang.BounceIWouldLikeTo}:&nbsp;
                                    </td>
                                    <td>
                                        <label class="customRadio Field internalAnchor" for="autobounceoption">
                                            <input type="radio" name="bounceoption" value="auto" id="autobounceoption"{if !$show_manual} checked="checked"{/if} />
                                            {$lang.Bounce_Auto_Process}
                                            <span class="checkmarkRadio"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr id="auto_settings" style="display:;">
                                    <td class="FieldLabel">
                                        &nbsp;
                                    </td>
                                    <td style="padding-top:0px;">
                                        <span class="Field" style="background: url('images/nodejoin.gif') no-repeat center left;padding: 5px 0px 5px 30px;display:block;">
                                            {$lang.Bounce_Auto_Process_Steps}:
                                        </span>
                                        <ol class="Field internalAnchor" style="margin:0; padding-left:1.8em; line-height:1.5; padding-bottom: 10px;">
                                            <li>{$lang.Bounce_Auto_Process_Step1|sprintf,$list_url,$list_name}</li>
                                            <li>{$lang.Bounce_Auto_Process_Step2}</li>
                                            <li>{$lang.Bounce_Auto_Process_Step3}</li>
                                            <li>{$lang.Bounce_Auto_Process_Step4|sprintf,$cron_url}</li>
                                            <li>{$lang.Bounce_Auto_Process_Step5}</li>
                                        </ol>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="FieldLabel">
                                    </td>
                                    <td class="internalAnchor">
                                        <label class="customRadio Field" for="bounce_process">
                                            <input type="radio" name="bounceoption" value="manual" id="bounce_process"{if $show_manual} checked="checked"{/if} />
                                            {$lang.Bounce_Manual_Process}
                                            <span class="checkmarkRadio"></span>
                                        </label>
                                    </td>
                                </tr>

                                {template="bounce_details"}

                                <tr>
                                    <td colspan="2"  style="padding-top:10px;" class="bottomButtons">
                                        <input class=" FormButton  btn save-btn  SubmitButton" id="BounceButton" type="button" value="{$lang.Bounce_Auto_Button}">
                                        <button class="FormButton  btn cancel-btn"><a href="index.php?Page=Bounce" onclick='return confirm("{$lang.Bounce_CancelPrompt}");'>{$lang.Cancel}</a>
                                        </button>
                                    </td>
                                </tr>
                            </table>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>
.internalAnchor a {
    color: #279ccb !important;
}
#TB_window{
    top:10% !important;
}
#TB_iframeContent{
    width:100% !important;
}
.FormButton{
    width:180px !important;
}
.ContentContainer ul li{
    line-height: 248% !important;
}
.FirstTd{
    vertical-align:top !important;
}
.FormButton {
    width: 185px !important;
}
    .bottomButtons {
        padding-left:20%;
    }
.BodyContainer {
    width: 98.5%;
    margin: 0 10px 10px 10px;
}
.nodeImg {
    margin-left: -9px;
}
.bounce_usernames, .Field350 {
    width: 333px;
}
.bounce_usernames {
    width: 333px;
}
input.Field350.form_text.form-control.extramail_others_value {
    width: 233px;
}
@media screen and (max-width:1024px){
    .FirstTd {
        width:25% !important;
    }
    .bottomButtons {
        padding-left:25%;
    }.BodyContainer {
        width: 98%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:768px){
    .FirstTd {
        width:30% !important;
    }
    .bottomButtons {
        padding-left:30%;
    }
}
@media screen and (max-width:540px){
    .BodyContainer{
        width:96% !important;
    }
     #TB_window{
        margin-left: -246px !important;
        width: 485px !important;
    }
    .FirstTd {
        width:43% !important;
    }
    .HelpToolTip img:first-child {
        margin-left: -2px;
    }
    .bounceAdvSetting .HelpToolTip img:first-child {
        margin-bottom: 10px !important;
        margin-top: 0px !important;
        margin-left: -2px !important;
    }
    .HelpToolTip_Placeholder {
        margin: 26px -92px !important;
    }
    .bottomButtons {
        text-align:center;
        padding-left:unset;
    }
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:414px){
    .cancel-btn{
        margin-top:6px !important;
    }
    .BodyContainer{
        width:95% !important;
    }
    #TB_window{
        margin-left: -194px !important;
        width: 386px !important;
    }
}
@media screen and (max-width:411px){
    #TB_window{
        margin-left: -180px !important;
        width: 360px !important;
    }
}
@media screen and (max-width:360px){
    .BodyContainer{
        width:94% !important;
    }
    #TB_window{
        margin-left: -150px !important;
        width: 298px !important;
    }
    .extramail_others_value {
        width: 100% !important;
        margin-bottom: 5px;
    }
}
@media screen and (max-width:320px){
    .BodyContainer{
        width:93% !important;
    }
    .tooltipFix span div.HelpToolTip_Placeholder{
        margin: 26px -120px !important;
    }
}

#TB_window {
    margin-left: auto !important;
    margin-top: auto !important;
    top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: : translate(-50%, -50%);
	-webkit: translate(-50%, -50%);
	-moz-transform: : translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	-webkit-transform: -webkit-translate(-50%, -50%);
}
</style>