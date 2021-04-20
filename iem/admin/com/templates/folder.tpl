{capture name=folder_id}%%GLOBAL_FolderID%%{/capture}
<li style="list-style-type:none; margin:0; padding:0;" class="Folder SortableRow not-nestable" id="folder-%%GLOBAL_FolderID%%" expanded="%%GLOBAL_Expanded%%">
    <table cellpadding="0" cellspacing="0" width="100%" class="Text" style="margin:0; padding:0;">
        <tr class="GridRow" style="cursor:pointer;height:40px">
            <td width="28" nowrap align="center" style="cursor:pointer;padding-left: 2px;vertical-align: middle;
             padding-bottom: 6px;">
             <label class="customCheckBox">
                           <input type="checkbox" name="Folders[]" class="UICheckboxToggleRows" value="1" onclick="$('input:checkbox', $('#folder-%%GLOBAL_FolderID%%')).attr('checked', this.checked);">
                            <span class="checkmark"></span>
            </label>
               
            </td>
            <td width="22" onclick="Application.Ui.Folders.ToggleFolder(%%GLOBAL_FolderID%% , '%%GLOBAL_FolderType%%');" style="cursor:pointer;padding-left: 3px;height: 15px;padding-top:8px">
                <img src="images/add.svg" border="0" alt="Expand" class="Toggle" />
            </td>
            <td style="padding-left: 10px;padding-right: 20px;word-break:break-all ;width:735px" onclick="Application.Ui.Folders.ToggleFolder(%%GLOBAL_FolderID%% , '%%GLOBAL_FolderType%%');" style="cursor:pointer;">
                %%GLOBAL_FolderName%%
            </td>
            
			<td width="75px" class="HideOnDrag">
				{if $folder_id !== '0'}
                    <div class="dropdown ml-1">
                        <button style="position: absolute;" class="btn p-0" type="button" id="dropdownMenuButton9" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
                        </button>
                        <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton9">
                            <a class="dropdown-item" href="#" onclick="tb_show('{$lang.Folders_RenameFolder}', 'index.php?Page=Folders&Action=Rename&FolderID=%%GLOBAL_FolderID%%&FolderName=%%GLOBAL_FolderName_Encoded%%&keepThis=true&TB_iframe=true&height=80&width=325', '');">{$lang.Folders_Rename}</a>
                            <a class="dropdown-item" href="#" onclick="Application.Ui.Folders.RemoveFolder(%%GLOBAL_FolderID%%);">{$lang.Folders_Delete}</a>
                        </div>
                    </div>
				{/if}
				&nbsp;
			</td>
        </tr>
    </table>
    <ul class="SortableList Folder" style="display:none;">
        %%GLOBAL_Items%%
    </ul>
</li>