<tr class="GridRow">
    <td  align="center">
    <label class="customCheckBox">
        <input type="checkbox" name="customfields[]" value="%%GLOBAL_id%%" class="UICheckboxToggleRows">
        <span class="checkmark"></span></label>
    </td>
    <td>
        <img src="images/customfields.gif">
    </td>
    <td>
        %%GLOBAL_Name%%
    </td>
    <td>
        %%GLOBAL_Created%%
    </td>
    <td>
        %%GLOBAL_CustomFieldType%%
    </td>
    <td>
        %%GLOBAL_CustomFieldRequired%%
    </td>
    <td>
    <div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
            %%GLOBAL_CustomFieldAction%%
            </div>
        </div>
        
    </td>
</tr>
