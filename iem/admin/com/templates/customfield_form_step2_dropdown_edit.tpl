<script>
    function AddOption() {
        var CurrentSize = $('#customFieldsTable tr td input[type=hidden]').size() + 1;

        $('<tr class="whiteBackground">'
                + '<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label"> {template="Not_Required"} <span style="font-weight:600;">{$lang.DropDown} ' + CurrentSize + ' {$lang.Value}:</span>&nbsp;</td>'
                + '<td class="PickListValues" style="font-family: Roboto, Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">'
                + '<input name="Key[' + CurrentSize + ']" class="form-control Field350" value="" id="key_' + CurrentSize + '" type="hidden">'
                + '<input name="Value[' + CurrentSize + ']" class="form-control Field350" value="" id="value_' + CurrentSize + '" type="text">'
                + '</td>'
                + '</tr>').insertBefore($('#customFieldsTable #additionalOption'));
    }

    Application.Page.CustomFieldEdit.onFormSubmitFunction.populateDropdownValue = function () {
        var rows = $('#customFieldsTable tr td.PickListValues');
        for (var i = 0, j = rows.length; i < j; ++i) {
            var display = $('input[@type=text]', rows[i]);
            var value = $('input[type=hidden]', rows[i]);

            if ($.trim(display.val()) == '') {
                display.val(value.val());
            } else {
                if ($.trim(value.val()) == '')
                    value.val(display.val());
            }
        }

        return true;
    }
</script>

<tr class="whiteBackground">
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        {template="Required"}
        %%LNG_Instructions%%:&nbsp;
    </td>
    <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
        <input type="text" name="DefaultValue" id="DefaultValue" class="form-control Field350" value="%%GLOBAL_DefaultValue%%">&nbsp;%%LNG_HLP_Instructions%%
    </td>
</tr>

%%GLOBAL_CurrentList%%

%%GLOBAL_ExtraList%%

<tr id="additionalOption" class="whiteBackground">
    <td>&nbsp;</td>
    <td style="padding-top:15px"><a href="javascript:AddOption()"><img src="images/plus.gif" border="0" style="margin-right: 5px"></a><a href="javascript:AddOption()">%%LNG_AddMore%%</a></td>
</tr>