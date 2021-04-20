<tr class="GridRow" id="subscriber%%GLOBAL_SubscriberID%%">
    <td width="5%" align="center">
    <label class="customCheckBox">
        <input type="checkbox" name="subscribers[]" value="%%GLOBAL_subscriberid%%" class="UICheckboxToggleRows">
        <span class="checkmark"></span></label>
    </td>
    <td width="36" class="eventButton" style="padding-left: 4px;padding-top: 13px;">
        <img src="images/customContact.svg">
        <span class="eventButton" style="padding-left:1.5px;">%%GLOBAL_EventButton%%</span>
    </td>
        %%GLOBAL_Columns%%
        
        <td>
        <div class="dropdown ml-1">
                           <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
                           </button>
               <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
               %%GLOBAL_SubscriberAction%%
               </div>
        </div>
   </td>
</tr>
<tr class="subscriberEventRow subscriberEventRowActive" id="subscriber%%GLOBAL_SubscriberID%%_Events" style="width:100%;">
    <td colspan="%%GLOBAL_ColumnCount%%" class="dataCol"><div class="dataArea"></div></td>
</tr>
   