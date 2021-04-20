<tr class="GridRow">
    <td align="center">
        <label class="customCheckBox">
            <input type="checkbox" name="newsletters[]" value="%%GLOBAL_id%%" class="UICheckboxToggleRows">
            <span class="checkmark"></span>
        </label>
    </td>
    <td>
        %%GLOBAL_NewsletterIcon%%
    </td>
    <td>
        <span title="%%GLOBAL_Name%%">%%GLOBAL_Short_Name%%</span>
    </td>
    <td>
        <span title="%%GLOBAL_Subject%%">%%GLOBAL_Short_Subject%%</span>
    </td>
    <td>
        %%GLOBAL_Created%%
    </td>
    <td>
        %%GLOBAL_LastSent%%
    </td>
    <td>
        %%GLOBAL_Owner%%
    </td>
    <td>
        <center>%%GLOBAL_ActiveAction%%</center>
    </td>
    <td>
        <center>%%GLOBAL_ArchiveAction%%</center>
    </td>
    <td>
        <div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
                %%GLOBAL_NewsletterAction%%
            </div>
        </div>
    </td>
</tr>
