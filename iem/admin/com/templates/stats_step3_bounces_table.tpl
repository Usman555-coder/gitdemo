
<div class="pager-row">

<div>
    <div class="view-all-links">
        <select name="choosebouncetype" id="choosebt" class="form-control">
            %%GLOBAL_StatsBounceList%%
        </select>
        <input type="button" value="%%LNG_Go%%" class="goButton" onclick="ChangeBounceType();">
    </div>
</div>
<br>

<div class="table-responsive rborder2">
<table border=0 width="100%" class="Text" style="padding-top: 0px; margin-top: 0px;">
    <tr>
        <td width="100%" colspan="4">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td valign="top">
                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="Heading3">
        <td nowrap align="left" width="20%">
            %%LNG_EmailAddress%%
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','email','up')"><i class="fa fa-caret-up" style="color: #d5d5d5; top:9px; position: absolute; left: 0;" aria-hidden="true"></i></a>
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','email','down')"><i class="fa fa-caret-down" style="color: #d5d5d5; top: 17px; position: absolute; left: 0;" aria-hidden="true"></i></a>
        </td>
        <td nowrap align="left" width="10%">
            %%LNG_BounceType%%
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','type','up')"><i class="fa fa-caret-up" style="color: #d5d5d5; top:9px; position: absolute; left: 0;" aria-hidden="true"></i></a>
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','type','down')"><i class="fa fa-caret-down" style="color: #d5d5d5; top: 17px; position: absolute; left: 0;" aria-hidden="true"></i></a>
        </td>
        <td nowrap align="left" width="35%">
            %%LNG_BounceRule%%
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','rule','up')"><i class="fa fa-caret-up" style="color: #d5d5d5; top:9px; position: absolute; left: 0;" aria-hidden="true"></i></a>
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','rule','down')"><i class="fa fa-caret-down" style="color: #d5d5d5; top: 17px; position: absolute; left: 0;" aria-hidden="true"></i></a>
        </td>
        <td nowrap align="left" width="35%">
            %%LNG_BounceDate%%
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','time','up')"><i class="fa fa-caret-up" style="color: #d5d5d5; top:9px; position: absolute; left: 0;" aria-hidden="true"></i></a>
            <a href="javascript:REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'),'%%GLOBAL_TableURL%%','','%%GLOBAL_TableType%%','%%GLOBAL_Token%%','%%GLOBAL_CurrentPage%%','time','down')"><i class="fa fa-caret-down" style="color: #d5d5d5; top: 17px; position: absolute; left: 0;" aria-hidden="true"></i></a>
        </td>
    </tr>
    %%GLOBAL_Stats_Step3_Bounces_List%%
    </table> 
</div>
</br>
%%GLOBAL_Paging%%
</div>

<style>
.Heading3 TD {
    position: relative;
}
</style>