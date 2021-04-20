<tr class="whiteBackground">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Required"}
        %%LNG_Instructions%%:&nbsp;
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <input type="text" name="DefaultValue" id="DefaultValue" class="form-control Field350" value="%%GLOBAL_DefaultValue%%">&nbsp;%%LNG_HLP_Instructions%%
    </td>
</tr>
<tr class="whiteBackground">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Required"}
        %%LNG_CustomField_Values%%:
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <textarea type="text" name="MultiValues" id="MultiValues" class="form-control Field350" style="width:450px; height:200px;padding: 0;">%%GLOBAL_CurrentList%%</textarea>
        <div class="aside"style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;font-size: 14px;padding-top: 1.35rem;">%%LNG_CustomField_Dropdown_Hint%%</div>
        (<a href="#" onclick="SortMultiValues();
                return false;">%%LNG_CustomFields_Sort_Alpha%%</a>)<br /><br />
    </td>
</tr>
