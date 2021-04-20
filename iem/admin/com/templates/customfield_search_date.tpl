<tr>
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}%%GLOBAL_FieldName%%:&nbsp;
    </td>
    <td class="inputPadding">
        <label for="CustomFields[%%GLOBAL_FieldID%%][filter]" class="customCheckBox"><input type="checkbox" name="CustomFields[%%GLOBAL_FieldID%%][filter]" id="CustomFields[%%GLOBAL_FieldID%%][filter]" value="1"%%GLOBAL_FilterChecked%% onClick="javascript: enableDate_SubscribeDate(this, '%%GLOBAL_FieldID%%')">&nbsp;%%GLOBAL_FilterDescription%%<span class="checkmark"></span></label>%%LNG_HLP_Filter_Date%%<br/>
        <div id="%%GLOBAL_FieldID%%" style="display: %%GLOBAL_Style_FieldDisplayOne%%" class="dateFieldDiv">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td valign="middle">
                        <img src="images/nodejoin.gif" width="20" height="20" border="0">
                    </td>
                    <td>
                        <select class="datefield form-control" name="CustomFields[%%GLOBAL_FieldID%%][type]" onChange="javascript: ChangeFilterOptionsSubscribeDate(this, '%%GLOBAL_FieldID%%');">
                            %%GLOBAL_FilterDateOptions%%
                        </select>
                    </td>
                    <td valign="top">
                        %%GLOBAL_Display_date1_Field1%%
                        %%GLOBAL_Display_date1_Field2%%
                        %%GLOBAL_Display_date1_Field3%%
                    </td>
                </tr>
                <tr style="display: %%GLOBAL_Style_FieldDisplayTwo%%" id="%%GLOBAL_FieldID%%date2">
                    <td colspan="2" align="right" valign="middle" class="dateFieldPadding">
                        <img src="images/nodejoin.gif" width="20" height="20" border="0">&nbsp;%%LNG_AND%%&nbsp;
                    </td>
                    <td valign="top">
                        %%GLOBAL_Display_date2_Field1%%
                        %%GLOBAL_Display_date2_Field2%%
                        %%GLOBAL_Display_date2_Field3%%
                    </td>
                </tr>
            </table>
        </div>
    </td>
</tr>
