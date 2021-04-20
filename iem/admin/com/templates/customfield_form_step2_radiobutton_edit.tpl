%%GLOBAL_CurrentList%%

%%GLOBAL_ExtraList%%

<script>
    function AddOption() {
        var CurrentSize = $('#customFieldsTable tr td input[type=hidden]').size() + 1;

        $('<tr class="whiteBackground">'
                + '<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label"> {template="Not_Required"} <span style="font-weight:600;">{$lang.RadioButton} ' + CurrentSize + ' {$lang.Value}:</span>&nbsp;</td>'
                + '<td style="font-family: Roboto, Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">'
                + '<input type="text" name="Value[' + CurrentSize + ']" class="form-control Field350 id="value_' + CurrentSize + '" />'
                + '<input type="hidden" name="Key[' + CurrentSize + ']" class="form-control Field350 id="key_' + CurrentSize + '" readonly="readonly" disabled="disabled" />&nbsp;'
                + '</td>'
                + '</tr>').insertBefore('table#customFieldsTable tr#additionalOption');
    }

</script>

<tr id="additionalOption" class="whiteBackground">
    <td>&nbsp;</td>
    <td style="padding-top:15px"><a href="javascript:AddOption()"><img src="images/plus.gif" border="0" style="margin-right: 5px"></a><a href="javascript:AddOption()">%%LNG_AddMore%%</a></td>
</tr>