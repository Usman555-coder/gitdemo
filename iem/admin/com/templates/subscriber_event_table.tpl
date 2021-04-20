<script>
    var subscribers = new Array();
    $(function () {
        Application.Ui.CheckboxSelection('table#subscriberEvents',
            'input.ToggleSelector',
            'input.event_checkbox');
    });
</script>
<div class="thirdPartyTable">
    <table class="Text table" id="subscriberEvents" cellspacing="0" cellpadding="2" style="width: 100%;">
        <tr>
            <td width="100%" colspan="7" style="padding: 0px; border:none;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="buttons" valign="bottom">
                            %%GLOBAL_Event_AddButton%%
                            %%GLOBAL_Event_DeleteButton%%
                        </td>
                        <td class="pagination" valign="bottom" align="right" nowrap="nowrap">
                            %%GLOBAL_Paging%%
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="Heading3" >
            <td nowrap align="center">
                <input type="checkbox" class="ToggleSelector">
            </td>
            <td>&nbsp;</td>
            <td>
                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                    <span>
                        <a href="#" onclick="eventsTable('eventsubject', 'asc'); return false;">
                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                        </a>
                    </span>
                    <span>
                        <a href="#" onclick="eventsTable('eventsubject', 'desc'); return false;">
                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                        </a>
                    </span>
                </div>
                %%LNG_Subject%%&nbsp;
            </td>
            <td>
                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                    <span>
                        <a href="#" onclick="eventsTable('eventtype', 'asc');return false;">
                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                        </a>
                    </span>
                    <span>
                        <a href="#" onclick="eventsTable('eventtype', 'desc');return false;">
                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                        </a>
                    </span>
                </div>
                %%LNG_EventType%%
            </td>
            <td>
                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                    <span>
                        <a href="#" onclick="eventsTable('lastupdate', 'asc'); return false;">
                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                        </a>
                    </span>
                    <span>
                        <a href="#" onclick="eventsTable('lastupdate', 'desc'); return false;">
                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                        </a>
                    </span>
                </div>
                %%LNG_LastUpdated%%
            </td>
            <td>
                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                    <span>
                        <a href="#" onclick="eventsTable('username', 'asc'); return false;">
                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                        </a>
                    </span>
                    <span>
                        <a href="#" onclick="eventsTable('username', 'desc'); return false;">
                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                        </a>
                    </span>
                </div>
                %%LNG_CreatedBy%%
            </td>
            <td>
                %%LNG_Action%%
            </td>
        </tr>
        %%GLOBAL_Events%%
    </table>
</div>