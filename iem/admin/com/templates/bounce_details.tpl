{* Get the current page name *}
{capture name=currentPage}{$IEM.CurrentPage|strtolower}{/capture}

{* On the Lists page, each option has 20px padding, so we need to factor this out. *}
{capture name=style}{if $currentPage == 'lists'}padding-left:20px;{/if}{/capture}

{* On the Bounce page, each option has 30px padding, so we need to factor this out. *}
{capture name=nodejoin}{if $currentPage == 'bounce'}<img class="nodeImg" src="images/nodejoin.gif" />{/if}{/capture}
{capture name=blankimg}{if $currentPage == 'bounce'}{/if}{/capture}

{if $currentPage != 'bounce' && $currentPage != 'settings'}
    <tr>
        <td class="EmptyRow" colspan="2" style="display: %%GLOBAL_ShowBounceInfo%%">
        {/if}
        <script>
            Application.Page.BounceInfo = {
                process_form: ('%%GLOBAL_ShowBounceInfo%%' == ''),
                bounce_form: null,
                bounce_process: null,
                bounce_agreedelete: null,
                extraSettingsPattern: {'notls': 'notls',
                                                                        'novalidate-cert': 'novalidate',
                                                                        'nossl': 'nossl'},

                eventDOMReady: function (event) {
                    // we cannot use 'this' because the event overrides it with the DOM
                    var bi = Application.Page.BounceInfo;

                    if (bi.process_form) {
                        // setup data members that need DOM elements
                        bi.bounce_form = $('#bounce_server').parents().filter("form").get(0);
                        bi.bounce_process = $('#bounce_process').get(0);
                        bi.bounce_agreedelete = $('#bounce_agreedelete').get(0);
                        // setup the DOM
                        bi.SetupClickEvents();
                        bi.SetupSubmitEvents();
                        bi.RevealBounceOptions();
                        bi.RevealExtraMailSettings();

                    }
                },

                /**
                 * Closes the bounce test thickbox.
                 */
                closeBounceTest: function () {
                    tb_remove();
                },

                /**
                 * Collects the parameters to connect to the bounce server.
                 *
                 * @return String A parameter string to use in a query string.
                 */
                getBounceParameters: function () {
                    if (!this.validateFields()) {
                        return false;
                    }
                    var options = '&';
                    var key = $('#token').text();
                    $($('.bounceSettings').fieldSerialize().split('&')).each(function (i, n) {
                        var temp = n.split('=');
                        if (temp.length == 2) {
                            if (temp[0] == 'bounce_password') {
                                temp[1] = Application.Util.encrypt(unescape(temp[1]), key);
                            }
                            options = options + temp[0] + '=' + temp[1] + '&';
                        }
                    });
                    return options;
                },

                /**
                 * Transforms the extra mail checkbox settings into their corresponding extrasettings string.
                 *
                 * @return Boolean True if the checkboxes were adjusted successfully, otherwise false.
                 */
                evaluateExtraSettings: function () {
                    try {
                        if (!this.bounce_form.bounce_extraoption.checked) {
                            if (this.bounce_form.extramail_others.checked && !this.bounce_form.extramail_others_value.value.match(/^\//)) {
                                alert("{$lang.InvalidExtraMailSettings}");
                                this.bounce_form.extramail_others_value.focus();
                                return false;
                            }
                            var tempSettings = [];
                            for (var i in this.extraSettingsPattern) {
                                if (this.bounce_form['extramail_' + this.extraSettingsPattern[i]].checked) {
                                    tempSettings.push(i);
                                }
                            }
                            this.bounce_form.bounce_extrasettings.value = (tempSettings.length > 0 ? '/' + tempSettings.join('/') : '') + (this.bounce_form.extramail_others.checked ? this.bounce_form.extramail_others_value.value : '');
                        } else {
                            for (var i in this.extraSettingsPattern) {
                                this.bounce_form['extramail_' + this.extraSettingsPattern[i]].checked = false;
                            }
                            this.bounce_form.bounce_extrasettings.value = '';
                        }
                        if (this.bounce_form.bounce_extrasettings.value == '0') {
                            this.bounce_form.bounce_extrasettings.value = '';
                        }
                    } catch (e) {
                        alert('{$lang.UnableEvaluateExtraMailSettings}');
                        return false;
                    }

                    return true;
                },

                /**
                 * Checks the corresponding checkboxes to the current value of the extrasettings.
                 */
                evaluateCheckboxes: function () {
                    var master = this.bounce_form.bounce_extrasettings.value;
                    var other_box = this.bounce_form.extramail_others_value;
                    var auto_button = this.bounce_form.bounce_extraoption;
                    // If the auto-detect button is already unchecked, we shouldn't do anything.
                    if (!auto_button.checked) {
                        return;
                    }
                    $(auto_button).click();
                    // Loop over each checkbox.
                    $('#showextramailsettings :checkbox').each(function (i, checkbox) {
                        var name = checkbox.name.split('_')[1];
                        if (name == 'others') {
                            // The 'Other' checkbox needs to be handled specially.
                            var cur = '';
                            $(['/ssl', '/tls']).each(function (j, option) {
                                if (master.indexOf(option) >= 0) {
                                    cur += option;
                                }
                            });
                            if (cur.length > 0) {
                                // We don't just use the checkbox's click() event for this because:
                                // - jQuery fires click() before it puts a check in the checkbox (unlike the browser), and
                                // - IE doesn't seem to check the box at all when click() is called on it.
                                $(checkbox).attr('checked', true);
                                other_box.disabled = false;
                                other_box.value = cur;
                            }
                            return;
                        }
                        // If the checkbox setting is in the extra settings, check it.
                        if (master.indexOf(name) >= 0) {
                            $(checkbox).attr('checked', true);
                        }
                    });
                },

                /**
                 * Set up the various onClick event handlers.
                 */
                SetupClickEvents: function () {
                    var bi = this;
                    var f = bi.bounce_form;
                    // Toggle the extra mail settings
                    $(f.bounce_extraoption).click(function () {
                        $('#showextramailsettings').toggle();
                    });
                    // Enable extra mail settings when revealed
                    $(f.extramail_others).click(function () {
                        f.extramail_others_value.disabled = !this.checked;
                    });
                    // Perform the bounce test if the button is there
                    f.cmdTestBounce && $(f.cmdTestBounce).click(function () {
                        if (!bi.validateFields()) {
                            return false;
                        }
                        var url = 'index.php?Page=Bounce&Action=PopupBounceTest{if $currentPage != 'bounce'}&InPlace=true{/if}' + Application.Page.BounceInfo.getBounceParameters() + '&keepThis=true&TB_iframe=true&height=240&width=400&modal=true&random=' + new Date().getTime();
                        tb_show('', url, '');
                        return true;
                    });
            {if $currentPage != 'bounce'}
                {* On the bounce page this will be handled by itself *}
                    // Reveal all of the bounce options if they want to process bounces
                    $('#bounce_process').click(function () {
                        $('.YesProcessBounce').toggle(true);
                        if (!this.checked) {
                            $('.YesProcessBounce').toggle(false);
                            $('.SubmitButton').attr('disabled', false);
                            $('.YesProcessBounce').hide();
                        }
                    });
            {/if}
                    $('#bounce_agreedeleteall').click(function () {
                        // give them a warning after they check the option
                        if (this.checked) {
            {if $currentPage == 'bounce'}
                            var prompter = '{$lang.ProcessBounceDeleteAll_ManualPrompt}';
            {else}
                            var prompter = '{$lang.ProcessBounceDeleteAll_AutoPrompt}';
            {/if}
                            this.checked = confirm(prompter);
                        }
                    });
                },

                /**
                 * Set up the various onSubmit event handlers.
                 */
                SetupSubmitEvents: function () {
                    // Ensure the Bounce Details Fields are populated.
                    var bounce_details = this;
                    $(bounce_details.bounce_form).submit(function (event) {
                        try {
                            var bounceFrm = bounce_details.bounce_form;
                            // Don't check if they're not doing bounce processing.
                            if (!bounceFrm.bounce_process || (bounceFrm.bounce_process && bounceFrm.bounce_process.checked)) {
                                return bounce_details.validateFields();
                            } else {
                                Application.Page.BounceInfo.ClearBounceSettings();
                            }
                        } catch (e) {
                            alert('Unable to validate');
                            return false;
                        }
                    });
                },

                /**
                 * Reveal the bounce options if applicable, otherwise hide them.
                 */
                RevealBounceOptions: function () {
                    // If showing the bounce options is optional, check if we should show them.
                    if (!this.bounce_process) {
                        return;
                    }

                    if ((this.bounce_process.checked) && '%%GLOBAL_ShowBounceInfo%%' != 'none') {
                        $('.YesProcessBounce').show();
                    } else {
                        $('.YesProcessBounce').hide();
                    }
                },

                /**
                 * Reveal the extra mail settings if applicable, otherwise hide them.
                 */
                RevealExtraMailSettings: function () {
                    if (!this.bounce_form.bounce_extraoption.checked || (this.bounce_form.bounce_extrasettings && this.bounce_form.bounce_extrasettings != '')) {
                        this.bounce_form.bounce_extraoption.checked = false;
                        if (this.bounce_form.bounce_extrasettings.value == '') {
                            this.bounce_form.bounce_extraoption.checked = true;
                            $('#showextramailsettings').hide();
                        } else {
                            var tempSettings = this.bounce_form.bounce_extrasettings.value.split('/');
                            var tempOthers = [];
                            for (var i = 0, j = tempSettings.length; i < j; i++) {
                                if (tempSettings[i] == '') {
                                    continue;
                                }
                                if (!this.extraSettingsPattern[tempSettings[i]]) {
                                    tempOthers.push(tempSettings[i]);
                                } else {
                                    this.bounce_form['extramail_' + this.extraSettingsPattern[tempSettings[i]]].checked = true;
                                }
                            }
                            if (tempOthers.length > 0) {
                                this.bounce_form.extramail_others.checked = true;
                                this.bounce_form.extramail_others_value.value = '/' + tempOthers.join('/');
                                this.bounce_form.extramail_others_value.disabled = false;
                            } else {
                                this.bounce_form.extramail_others.checked = false;
                                this.bounce_form.extramail_others_value.disabled = true;
                            }
                        }
                    }
                },

                /**
                 * Clears all the bounce options. This is useful to avoid stale values getting saved when we don't want to process bounces any more.
                 */
                ClearBounceSettings: function () {
                    $('.YesProcessBounce input[type!=button]').each(function () {
                        if (this.value) {
                            this.value = '';
                        }
                        if (this.checked) {
                            this.checked = false;
                        }
                        if (this.name == 'bounce_extraoption') {
                            this.checked = true;
                        }
                        $('#showextramailsettings').hide();
                    });
                },

                /**
                 * Validates the bounce server, bounce username and bounce password fields.
                 */
                validateFields: function () {
                    var form = this.bounce_form;

                    // check that a bounce server name has been entered
                    if (form.bounce_server.value.trim() == '') {
                        alert("{$lang.EnterBounceServer}");
                        form.bounce_server.focus();
                        return false;
                    }

                    // check that a username has been entered1
                    if (form.bounce_username.value.trim() == '') {
                        alert("{$lang.EnterBounceUsername}");
                        form.bounce_username.focus();
                        return false;
                    }

                    // check that a password has been entered for the bounce email account
                    if (form.bounce_password.value.trim() == '') {
                        alert("{$lang.EnterBouncePassword}");
                        form.bounce_password.focus();
                        return false;
                    }

                    return this.evaluateExtraSettings();
                }
            };

            Application.init.push(Application.Page.BounceInfo.eventDOMReady);

        </script>
        {if $currentPage != 'bounce'}
        </td>
    </tr>
{/if}
{if in_array($currentPage, array('lists', 'settings'))}
    <tr style="display: %%GLOBAL_ShowBounceInfo%%">
        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
           %%LNG_BounceAccountDetails%%
        </td>
    </tr>
    <tr style="display: %%GLOBAL_ShowBounceInfo%%" class="whiteBackground">
        <td width="20%" class="Field">
            {template="Not_Required"}
            {if $currentPage == 'settings'}%%LNG_SetDefaultBounceAccountDetails%%{else}%%LNG_ProcessBouncesLabel%%{/if}:
        </td>
        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
            <label for="bounce_process" class="customCheckBox"><input type="checkbox" name="bounce_process" id="bounce_process" value="1" %%GLOBAL_ProcessBounceChecked%%/>{if $currentPage == 'settings'}%%LNG_SetDefaultBounceAccountDetailsExplain%%{else}%%LNG_YesProcessBounces%%{/if}<span class="checkmark"></span></label>
            {if $currentPage == 'settings'}
                %%LNG_HLP_SetDefaultBounceAccountDetails%%
            {else}
                <br/> %%LNG_ProcessBounceGuideLink%% 
            {/if}
        </td>
    </tr>
{/if}
{if $currentPage == 'settings'}
    <tr style="display: %%GLOBAL_ShowBounceInfo%%" class="YesProcessBounce">
        <td class="FieldLabel">
            {template="Not_Required"}
            %%LNG_DefaultBounceAddress%%:
        </td>
        <td>
            <input type="text" name="bounce_address" id="bounce_address" value="%%GLOBAL_Bounce_Address%%" class="Field250 bounceSettings"> %%LNG_HLP_DefaultBounceAddress%%
        </td>
    </tr>
{/if}
<tr style="display: %%GLOBAL_ShowBounceInfo%%;" class="YesProcessBounce whiteBackground">
    <td class="topPadding" width="20%" class="Field" >
{if $currentPage == 'settings'}{template="Not_Required"}{else}{template="Required"}{/if}
{if $currentPage == 'settings'}%%LNG_DefaultBounceServer%%{else}%%LNG_ListBounceServer%%{/if}:
</td>
<td class="topVerticalAlign"  style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ;  color: #000;">
    {$nodejoin} <input type="text" name="bounce_server" id="bounce_server" class=" form_text firstInputwidthFix bounceSettings form-control Field350" value="%%GLOBAL_Bounce_Server%%">{if $currentPage == 'settings'}%%LNG_HLP_DefaultBounceServer%%{else}%%LNG_HLP_ListBounceServer%%{/if}
</td>
</tr>
<tr style="display: %%GLOBAL_ShowBounceInfo%%" class="YesProcessBounce whiteBackground">
    <td width="20%" class="Field UsernameWidthFix">
{if $currentPage == 'settings'}{template="Not_Required"}{else}{template="Required"}{/if}
{if $currentPage == 'settings'}%%LNG_DefaultBounceUsername%%{else}%%LNG_ListBounceUsername%%{/if}:
</td>
<td  style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
    <img class="blankImage" src="images/nodejoin.gif" width="20" height="20" /> <input type="text" name="bounce_username" class="remainwidthFix form_text bounceSettings form-control Field350 bounce_usernames" value="%%GLOBAL_Bounce_Username%%">{if $currentPage == 'settings'}%%LNG_HLP_DefaultBounceUsername%%{else}%%LNG_HLP_ListBounceUsername%%{/if}
</td>
</tr>
<tr style="display: %%GLOBAL_ShowBounceInfo%%" class="YesProcessBounce whiteBackground" >
    <td width="20%" class="Field bouncePaddingFix">
{if $currentPage == 'settings'}{template="Not_Required"}{else}{template="Required"}{/if}
{if $currentPage == 'settings'}%%LNG_DefaultBouncePassword%%{else}%%LNG_ListBouncePassword%%{/if}:
</td>
<td  style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
    <img class="blankImage" src="images/nodejoin.gif" width="20" height="20" /> <input type="password" name="bounce_password" class="remainwidthFix form_password bounceSettings form-control Field350 bounce_usernames" value="%%GLOBAL_Bounce_Password%%" autocomplete="off" />{if $currentPage == 'settings'}%%LNG_HLP_DefaultBouncePassword%%{else}%%LNG_HLP_ListBouncePassword%%{/if}
</td>
</tr>
<tr style="display: %%GLOBAL_ShowBounceInfo%%" class="YesProcessBounce whiteBackground">
    <td  width="20%" class="Field bouncePaddingFix" >
        {template="Not_Required"}
        %%LNG_Bounce_Account_Type%%:
    </td>
    <td  class="secondTd" style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;padding-top:1.35rem">
        <img class="blankImage" src="images/nodejoin.gif" width="20" height="20" />
        <select name="bounce_imap" class="remainwidthFix bounceSettings form-control Field350 bounce_usernames" >
            <option value="0"%%GLOBAL_Pop3_Selected%%>%%LNG_Bounce_POP3_Account%%</option>
            <option value="1"%%GLOBAL_Imap_Selected%%>%%LNG_Bounce_IMAP_Account%%</option>
        </select>
        %%LNG_HLP_Bounce_Account_Type%%

    </td>
</tr>
<tr style="display: %%GLOBAL_ShowBounceInfo%%" class="YesProcessBounce whiteBackground">
    <td  width="20%" class="Field topVerticalAlign topPaddingAccountType" >
        {template="Not_Required"}
        %%LNG_Bounce_Adv_Settings%%:
    </td>
    <td class="bounceAdvSetting tooltipFix" style="{$style}" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <div class="childDiv" style="padding-top: 18px;">
            <img class="blankImage" src="images/nodejoin.gif" width="20" height="20" /> <label for="bounce_extraoption" class="customCheckBox"><input type="checkbox" name="bounce_extraoption form-control" id="bounce_extraoption" value="1" class="bounceSettings"%%GLOBAL_Bounce_ExtraOption%% />%%LNG_Bounce_Adv_Settings_Autodetect%%
            <span class="checkmark"></span></label> %%LNG_HLP_Bounce_Adv_Settings%%
        </div>
        <div id="showextramailsettings" style="display: %%GLOBAL_DisplayExtraMailSettings%%">
            <input type="hidden" name="bounce_extrasettings" id="bounce_extrasettings" class="bounceSettings" value="%%GLOBAL_Bounce_ExtraSettings%%" />
            <div class="bounce_extrasettings_div1">
                <img class="nodeImg" width="20" height="20" src="images/nodejoin.gif"/>
                <label for="extramail_novalidate" class="customCheckBox labelWidthFix">
                    <input type="checkbox" name="extramail_novalidate" id="extramail_novalidate" value="validate" />%%LNG_ExtraMailSettingsNoValidate_field%%
                    <span class="checkmark"></span></label>%%LNG_HLP_ExtraMailSettingsNoValidate%%
            </div>
            <div class="labelDiv" >
                <label for="extramail_notls" class="customCheckBox extramail_notlsLabelWidth">
                    <input type="checkbox" name="extramail_notls" id="extramail_notls" value="tls" />%%LNG_ExtraMailSettingsNoTLS_field%%
                    <span class="checkmark"></span></label>%%LNG_HLP_ExtraMailSettingsNoTLS%%
            </div>
            <div class="labelDiv" >
                <label for="extramail_nossl" class="customCheckBox extramail_nosslWidthFix">
                    <input type="checkbox" name="extramail_nossl" id="extramail_nossl" value="ssl" />%%LNG_ExtraMailSettingsNoSSL_field%%
                    <span class="checkmark"></span></label>%%LNG_HLP_ExtraMailSettingsNoSSL%%
            </div>
            <div class="labelDiv" >
                <label for="extramail_others" class="customCheckBox">
                    <input type="checkbox" name="extramail_others" id="extramail_others" value="others" />%%LNG_ExtraMailSettingsOthers_field%%
                    <span class="checkmark"></span></label>
                <input type="text" name="extramail_others_value" class="Field350 form_text form-control extramail_others_value" value="" disabled="disabled" />%%LNG_HLP_ExtraMailSettingsOthers%%
            </div>
        </div>
    </td>
</tr>
<tr style="display: %%GLOBAL_ShowBounceInfo%%" class="YesProcessBounce whiteBackground" >
    <td width="20%" class="Field topVerticalAlign paddingInboxType" >
        {template="Not_Required"}
        %%LNG_Bounce_Emp_Inbox%%
    </td>
    <td class="tooltipFix"  style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <img class="blankImage" src="images/nodejoin.gif" width="20" height="20" /> <label for="bounce_agreedeleteall" class="remainwidthFix customCheckBox"><input type="checkbox" name="bounce_agreedeleteall" id="bounce_agreedeleteall" class="bounceSettings form-control Field350" value="1"%%GLOBAL_Bounce_AgreeDeleteAll%%/>%%LNG_Bounce_Emp_Inbox_Text%%<span class="checkmark"></span></label>%%LNG_HLP_ProcessBounceDeleteAll%%
    </td>
</tr>
{if $currentPage == 'bounce'}
    <tr style="display: %%GLOBAL_ShowBounceInfo%%" class="YesProcessBounce">
        <td class="Field verticalAlignClass" >
            {template="Not_Required"}
            %%LNG_SaveBounceServerDetails%%
        </td>
        <td class="tooltipFix paddingFix Field" style="{$style};padding-top:1.35em">
            <img class="blankImage" src="images/nodejoin.gif" width="20" height="20" /> <label class="customCheckBox Field" for="savebounceserverdetails"><input type="checkbox" name="savebounceserverdetails" id="savebounceserverdetails" class="bounceSettings" value="1">%%LNG_SaveBounceServerDetailsExplain%%
            <span class="checkmark"></span>
            </label> %%LNG_HLP_SaveBounceServerDetails%%
        </td>
    </tr>
{/if}
{if in_array($currentPage, array('lists', 'settings'))}
    <tr class="YesProcessBounce whiteBackground" style="display: %%GLOBAL_ShowBounceInfo%%">
        <td class=" submitTableBtn FieldLabel" >
            {template="Not_Required"}
            {if $currentPage == 'settings'}%%LNG_TestBounceSettings%%:{/if}
        </td>
        <td ><input name="cmdTestBounce" type="button" value="%%LNG_TestBounceSettings%%" class="FormButton  YesProcessBounce btn save-btn SubmitButton" style="width: 148px;" style="display: %%GLOBAL_ShowBounceInfo%%"/></td>
    </tr>
{/if}
<style>
.blankImage {
    margin-left: -9px;
}
.form-control{
    display:inline !important;
}
.bounce_extrasettings_div1{
    margin-left:20px !important;
}
.labelDiv{
    margin-left:43px !important;
}
.Field350{
    width: 290px;
}
.bounce_usernames {
    width: 274px;
}
.submitTableBtn {
    width: 196px !important;
    min-width: 196px !important;
    max-width: 196px !important;
}
.secondTd {
    display: inline-table;
}
.HelpToolTip {
    margin-top: 15px !important;
    display: inline-block;
}
.ISSelect{
    margin-top:15px;
}
#availablefields_old,
#fields_old {
    display: none !important;
}
@media screen and (max-width:768px){
    .FirstTd{
        width:34% !important;
    }
    .tooltipFix span div.HelpToolTip_Placeholder{
        margin: 26px -170px !important;
    }
}
@media screen and (max-width:540px){
    .FirstTd{
        width:50% !important;
    }
    .childDiv{
        padding-top:0px !important;
    }
    .nodeImg{
        display:none !important;
    }
    .bounce_extrasettings_div1{
        margin-left:0px !important;
    }
    .labelDiv{
        margin-left:0px !important;
    }
    .tooltipFix{
        padding-top:0px !important;
    }
    .extramail_nosslWidthFix{
        width:90% !important;
    }
    .extramail_others_value{
        width:65% !important;
    }
    .extramail_notlsLabelWidth{
        width:90% !important;
    }
    .labelWidthFix{
        width:90% !important;
    }
    .UsernameWidthFix{
        width:43% !important;
        vertical-align:middle !important;
    }
    .UsernameWidthFix + td,.bouncePaddingFix+td{
        padding-top:0px !important;
    }
    .bouncePaddingFix{
        vertical-align:middle !important;
    }
    .firstInputwidthFix{
        width:98% !important;
    }
    .remainwidthFix{
        width:98% !important;
    }
    .paddingFix{
        padding-top:0px !important;
    }
    .verticalAlignClass{
        vertical-align:top !important;
        padding-top:25px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
    }
    .topPadding{
        padding-top:0px !important;
        width:38% !important;
    }
    .topVerticalAlign{
        vertical-align:top !important;
    }
    .topPaddingAccountType{
        padding-top:18px !important;
    }
    .paddingInboxType{
        padding-top:22px !important;
    }
}
@media screen and (max-width:414px){
    .extramail_others_value{
        width:55% !important;
    }
    .firstInputwidthFix{
        width:98% !important;
    }
    .topVerticalAlign{
        vertical-align:top !important;
    }
    .topPadding{
        padding-top:0px !important;
    }
    .topPaddingAccountType{
        padding-top:18px !important;
    }
    .paddingInboxType{
        padding-top:22px !important;
    }
}
@media screen and (max-width:411px){
    .FirstTd{
        width:45%;
    }
    .topVerticalAlign{
        padding-right:3px !important;
    }
}
@media screen and (max-width:375px){
    .topPadding{
        width:35% !important;
    }
}
@media screen and (max-width:360px){
    .extramail_others_value{
        width:55% !important;
    }
    .topPadding{
        width:38% !important;
    }
}
@media screen and (max-width:320px){
    .topPadding,.topVerticalAlign{
        padding-right:7px !important;
    }
}
</style>