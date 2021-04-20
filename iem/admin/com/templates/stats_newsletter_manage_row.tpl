<tr class="GridRow">
    <td valign="top" align="center">
        <label class="customCheckBox">
	        <input type="checkbox" name="stats[]" value="%%GLOBAL_StatID%%" class="UICheckboxToggleRows" />
	        <span class="checkmark"></span>
        </label>	
    </td>
    <td valign="top"><img src="images/m.svg"></td>
    <td>
        %%GLOBAL_Newsletter%%
    </td>
    <td>
        <span title="%%GLOBAL_MailingList_Full%%">%%GLOBAL_MailingList%%</span>
    </td>
    <td>
        %%GLOBAL_StartDate%%
    </td>
    <td>
        %%GLOBAL_FinishDate%%
    </td>
    <td align="center">
        %%GLOBAL_TotalRecipients%%
    </td>
    <td align="center">
        %%GLOBAL_UnsubscribeCount%%
    </td>
    <td align="center">
        %%GLOBAL_BounceCount%%
    </td>
    <td align="center">
        <div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="dropdownMenuButton{$statsDetails.jobid}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton{$statsDetails.jobid}" >
                %%GLOBAL_StatsAction%%
	        </div>
        </div>
    </td>
</tr>
