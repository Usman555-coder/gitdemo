<tr class="whiteBackground">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}
        %%LNG_DefaultValue%%:&nbsp;
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <textarea class="form-control Field350" style="height: 80px;" name="DefaultValue">%%GLOBAL_DefaultValue%%</textarea>&nbsp;%%LNG_HLP_DefaultValue%%
    </td>
</tr>
<tr class="whiteBackground">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}
        %%LNG_ApplyDefault%%&nbsp;
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <label class="customCheckBox" for="ApplyDefault"><input type="checkbox" id="ApplyDefault" name="ApplyDefault" %%GLOBAL_ApplyDefault%%>%%LNG_ApplyDefaultToExistingExplain%% <span class="checkmark"></span></label>
    </td>
</tr>
<tr class="whiteBackground">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}
        %%LNG_TextAreaRows%%:&nbsp;
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <input type="text" name="Rows" class="form-control Field350" value="%%GLOBAL_Rows%%">&nbsp;%%LNG_HLP_TextAreaRows%%
    </td>
</tr>
<tr class="whiteBackground">
    <td  width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}
        %%LNG_TextAreaColumns%%:&nbsp;
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <input type="text" name="Columns" class="form-control Field350" value="%%GLOBAL_Columns%%">&nbsp;%%LNG_HLP_TextAreaColumns%%
    </td>
</tr>
