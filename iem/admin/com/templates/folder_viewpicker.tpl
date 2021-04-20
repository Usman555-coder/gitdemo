{capture name=mode}%%GLOBAL_Mode%%{/capture}
<div class="ml-1 folderIcons" style="display: flex;
    align-items: center;">
    {if $mode == 'Folder'}
        <a href="index.php?Page={$IEM.CurrentPage}&amp;Mode=List"><img src="images/list.svg" width="25" height="18" alt="%%LNG_Folders_SwitchTo%% %%LNG_Folders_ListMode%%" title="%%LNG_Folders_SwitchTo%% %%LNG_Folders_ListMode%%" border="0" /></a>
        <img style="margin-bottom: 4px;margin-left:6px" src="images/folder.svg" width="25" height="18" alt="%%LNG_Folders_CurrentlyIn%% %%LNG_Folders_FolderMode%%" title="%%LNG_Folders_CurrentlyIn%% %%LNG_Folders_FolderMode%%" border="0" />
        <a href="#" onclick="tb_show('%%LNG_Folders_AddFolder%%', 'index.php?Page=Folders&Action=Add&FolderType=list&keepThis=true&TB_iframe=true&height=80&width=325', '');"><img src="images/addFolder.svg" width="25" height="25" style="margin-left:6px" alt="%%LNG_Folders_AddFolder%%" title="%%LNG_Folders_AddFolder%%" border="0" /></a>
        {else}
        <img src="images/list.svg" width="25" height="18" alt="%%LNG_Folders_CurrentlyIn%% %%LNG_Folders_ListMode%%" title="%%LNG_Folders_CurrentlyIn%% %%LNG_Folders_ListMode%%" border="0" />
        <a href="index.php?Page={$IEM.CurrentPage}&amp;Mode=Folder"><img style=" margin-left:6px;margin-top: 2px;" src="images/folder.svg" width="25" height="18" alt="%%LNG_Folders_SwitchTo%% %%LNG_Folders_FolderMode%%" title="%%LNG_Folders_SwitchTo%% %%LNG_Folders_FolderMode%%" border="0" /></a>
        {/if}
</div>
