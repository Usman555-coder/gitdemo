{capture name=row_key trim=true}%%GLOBAL_Key%%{/capture}
<tr class="whiteBackground">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Not_Required"}
        {if $row_key == ''}<span style="font-weight:600;">{/if}{$lang.RadioButton} %%GLOBAL_KeyNumber%% {$lang.Value}:{if $row_key == ''}</span>{/if}&nbsp;
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <input type="text" name="Value[%%GLOBAL_KeyNumber%%]"  class="form-control Field350" value="%%GLOBAL_Value%%" id="value_%%GLOBAL_KeyNumber%%">&nbsp;{$lnghlp.Radiobutton_Value}
        <input type="hidden" name="Key[%%GLOBAL_KeyNumber%%]" value="%%GLOBAL_Key%%" id="key_%%GLOBAL_KeyNumber%%">
        {if $row_key != ''}<br /><span class="radioSelectedOption">{$lang.Radiobutton_Key}:&nbsp;"%%GLOBAL_Key%%"&nbsp;</span><span class="radioLabelHelp">{$lnghlp.Radiobutton_Key}</span>{/if}
    </td>
</tr>