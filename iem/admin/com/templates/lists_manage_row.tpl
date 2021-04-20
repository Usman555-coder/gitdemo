<li class="SortableRow no-nesting" id="ele-%%GLOBAL_List%%">
    <table cellpadding="0" cellspacing="0" width="100%" class="Text" style="margin:0; padding:0;cursor: pointer;">
        <tr class="GridRow">
            <td width="37" style="padding-bottom: 5px;" align="center">
                <label class="customCheckBox">
                           <input type="checkbox" name="Lists[]" value="%%GLOBAL_List%%" class="UICheckboxToggleRows">
                            <span class="checkmark"></span>
                </label>
            </td>
            <td width="50" style="height:74px;width: 34px;padding-top: 8px;" class="DragMouseDown sort-handle">
                <img src="images/folderShared.svg" />
            </td>
            <td class="DragMouseDown sort-handle rtb-name">
                %%GLOBAL_Name%%
            </td>
            <td class="HideOnDrag rtb-dates">
                %%GLOBAL_Created%%
            </td>
            <td class="HideOnDrag rtb-contacts">
                %%GLOBAL_SubscriberCount%%
            </td>
            <td class="HideOnDrag rtb-owners">
                %%GLOBAL_Fullname%%
            </td>
            <td class="HideOnDrag rtb-wifi">
                <a href="../rss.php?List=%%GLOBAL_List%%" target="_blank"><img src="images/rss.svg" border="0" title="%%LNG_RSS_Tip%%"></a>
            </td>
            <td class="HideOnDrag rtb-action">
            <div class="dropdown ml-1">
                            <button class="btn p-0" type="button" id="dropdownMenuButton9" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
                            </button>
                <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton9">
                 %%GLOBAL_ListAction%% 
                </div>
         </div>
                
            </td>
        </tr>
    </table>
</li>
<style>
td.DragMouseDown.sort-handle.rtb-name {
    width: 27%;
}
td.HideOnDrag.rtb-dates {
    width: 14%;
}
td.HideOnDrag.rtb-contacts {
    width: 13%;
}
td.HideOnDrag.rtb-owners {
    width: 21%;
}
td.HideOnDrag.rtb-wifi {
    width: 10%;
}
</style>