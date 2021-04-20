<tr class="GridRow">
    <td align="center">
        <label class="customCheckBox">
        <input type="checkbox" name="jobs[]" value="%%GLOBAL_JobID%%" class="UICheckboxToggleRows">
        <span class="checkmark"></span>
        </label>
    </td>
    <td>
        <img src="images/m.svg">
    </td>
    <td>
        %%GLOBAL_NewsletterName%%
        %%GLOBAL_NewsletterSubject%%
    </td>
    <td>
        %%GLOBAL_NewsletterType%%
    </td>
    <td>
        %%GLOBAL_ListName%%
    </td>
    <td>
        %%GLOBAL_JobTime%%
    </td>
    <td>
        %%GLOBAL_Status%%%%GLOBAL_AlreadySent%%
        <span id="send_status_%%GLOBAL_JobID%%_%%GLOBAL_RowID%%"></span>%%GLOBAL_RefreshLink%%
    </td>
    <td align="center">
        <div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
            %%GLOBAL_Action%%
            </div>
        </div>
    </td>
</tr>
