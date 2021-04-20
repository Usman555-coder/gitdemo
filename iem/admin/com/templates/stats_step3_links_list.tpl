<div class="select-space" style="display: %%GLOBAL_DisplayStatsLinkList%%;">
    <select name="chooselink" id="chooselink" class="form-control selectBoxTrigger"><option value="a">%%LNG_AnyLink%%</option>%%GLOBAL_StatsLinkList%%</select>
    <input type="button" value="%%LNG_Go%%" class="body goButton Text" onclick="ChangeLink(%%GLOBAL_CurrentPage%%, '%%GLOBAL_SortColumn%%', '%%GLOBAL_SortDirection%%');">
</div>
<style>
.select-space{
    margin:15px 0;
}
</style>