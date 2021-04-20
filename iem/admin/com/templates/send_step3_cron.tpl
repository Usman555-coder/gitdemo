<tr>
    <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
        %%LNG_CronSendOptions%%
    </td>
</tr>
<tr>
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}
        %%LNG_SendImmediately%%
    </td>
    <td class="inputPadding">
        <label for="sendimmediately" class="customCheckBox"><input type="checkbox" name="sendimmediately" id="sendimmediately" value="1" CHECKED onClick="ShowSendTime(this)">&nbsp;%%LNG_SendImmediatelyExplain%%<span class="checkmark"></span></label>&nbsp;%%LNG_HLP_SendImmediately%%
    </td>
</tr>
<tr id="show_senddate" style="display:none;">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Required"}
        %%LNG_SendMyEmailCampaignOn%%:&nbsp;
    </td>
    <td style="padding-left:20px" valign="top">
        <table cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td width="20" valign="top"><img src="images/nodejoin.gif" /></td>
                <td valign="top">
                    %%GLOBAL_SendTimeBox%%&nbsp;%%LNG_HLP_SendTime%%
                    <input type="hidden" name="sendtime" id="sendtime" value="" />
                    <script>
                        function SetSendTime() {
                            var h = $('#sendtime_hours').val();
                            var m = $('#sendtime_minutes').val();
                            var a = $('#sendtime_ampm').val();
                            var sendtime = h + ':' + m + a;
                            $('#sendtime').val(sendtime);
                        }

                        SetSendTime();
                    </script>
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr>
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}
        %%LNG_NotifyOwner%%
    </td>
    <td class="inputPadding">
        <label for="notifyowner"  class="customCheckBox"><input type="checkbox" name="notifyowner" id="notifyowner" value="1" CHECKED>&nbsp;%%LNG_NotifyOwnerExplain%%<span class="checkmark"></span></label>&nbsp;%%LNG_HLP_NotifyOwner%%
    </td>
</tr>
<tr>
    <td colspan="2" class="EmptyRow">
        &nbsp;
    </td>
</tr>

