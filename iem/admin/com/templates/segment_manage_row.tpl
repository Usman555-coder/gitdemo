<tr class="GridRow">
    <td align="center">
     <label class="customCheckBox">
        <input type="checkbox" name="Segments[]" class="SegmentManageSegmentSelection" value="%%GLOBAL_SegmentID%%" title="%%GLOBAL_SegmentName%%" />
        <span class="checkmark"></span>
        </label>
    </td>
    <td><img src="images/icon.svg" /></td>
    <td>%%GLOBAL_SegmentName%%</td>
    <td>%%GLOBAL_Created%%</td>
    <td><div class="SegmentSubscriberCount SegmentSubscriberCount_Unprocessed" id="sectionSegmentSubscriberCount_%%GLOBAL_SegmentID%%" style="text-align: center;"><img src="images/loading.gif" alt="wait..." /></div></td>
    <td>
    <div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="sectionSegmentSubscriberCount_%%GLOBAL_SegmentID%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
                %%GLOBAL_SegmentAction%%
            </div>
        </div>
    {* <div class="SegmentSubscriberCount SegmentSubscriberCount_Unprocessed" id="sectionSegmentSubscriberCount_%%GLOBAL_SegmentID%%" style="text-align: center;"> *}
    {* <img src="images/loading.gif" alt="wait..." /></div> *}
    </td>
    {* <td>%%GLOBAL_SegmentAction%%</td> *}
</tr>

