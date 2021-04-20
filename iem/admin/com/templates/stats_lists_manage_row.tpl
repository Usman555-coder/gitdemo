<tr class="GridRow">
    <td valign="top"><img src="images/Contact_List_Statistics_image.svg"></td>
    <td>
        %%GLOBAL_MailingList%%
    </td>
    <td>
        %%GLOBAL_CreateDate%%
    </td>
    <td>
        %%GLOBAL_SubscribeCount%%
    </td>
    <td>
        %%GLOBAL_UnsubscribeCount%%
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
