<tr class="GridRow">
    <td align="center">
        <label class="customCheckBox">
        <input type="checkbox" name="subscribers[]" value="%%GLOBAL_BanID%%" class="UICheckboxToggleRows">
        <span class="checkmark"></span></label>
    </td>
    <td>
        <img src="images/m_banned.gif">
    </td>
    <td>
        %%GLOBAL_Email%%
    </td>
    <td>
        %%GLOBAL_BanDate%%
    </td>
    <td>
        <div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
                %%GLOBAL_SubscriberAction%%
            </div>
        </div>
    </td>
</tr>
