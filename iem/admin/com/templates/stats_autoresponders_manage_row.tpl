<tr class="GridRow">
    <td valign="top">
        <label class="customCheckBox">
	        <input type="checkbox" name="stats[]" value="%%GLOBAL_AutoresponderID%%" class="UICheckboxToggleRows" />
	        <span class="checkmark"></span>
        </label>	
    </td>
    <td valign="top" style="padding:0px;"><img src="images/Contact_List_Statistics_image.svg"></td>
    <td>
        %%GLOBAL_Autoresponder%%
    </td>
    <td>
        %%GLOBAL_MailingList%%
    </td>
    <td>
        %%GLOBAL_SentWhen%%
    </td>
    <td>
        %%GLOBAL_TotalRecipients%%
    </td>
    <td>
        %%GLOBAL_UnsubscribeCount%%
    </td>
    <td>
        %%GLOBAL_BounceCount%%
    </td>
    <td>
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
