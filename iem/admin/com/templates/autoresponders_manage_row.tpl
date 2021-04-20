<tr class="GridRow">
    <td align="center">
        <label class="customCheckBox">
            <input type="checkbox" name="autoresponders[]" class="UICheckboxToggleRows" value="%%GLOBAL_id%%">
            <span class="checkmark"></span>
        </label>
    </td>
    <td><img src="images/m_autoresponders.gif"></td>
    <td>%%GLOBAL_Name%%</td>
    <td>%%GLOBAL_Created%%</td>
    <td>%%GLOBAL_SentWhen%%</td>
    <td>%%GLOBAL_Owner%%</td>
    <td align="center">%%GLOBAL_ActiveAction%%</td>
    <td align="center">
        <div class="dropdown ml-1" style="position: inherit;">
            <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
                %%GLOBAL_AutoresponderAction%%
            </div>
        </div>
    </td>
</tr>
