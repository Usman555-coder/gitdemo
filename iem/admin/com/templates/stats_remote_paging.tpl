<div align="right" style="display: flex;">
    <table width="100%" class="paginationTable">
        <tr class="d-flex justify-content-between align-items-center pagingNew margin">
            <td>%%GLOBAL_pageofpage%%</td>
            <td>
                <span style="font-weight:600;">%%LNG_ResultsPerPage%%:</span>
                <select name="PerPageDisplay%%GLOBAL_PPDisplayName%%" id="PerPageDisplay%%GLOBAL_TableType%%" style="margin-bottom: 4px; width: 55px" onChange="REMOTE_parameters = '&amp;PerPageDisplay=' + $('#PerPageDisplay%%GLOBAL_TableType%%').val();
                    REMOTE_admin_table($('#adminTable%%GLOBAL_TableType%%'), '%%GLOBAL_TableURL%%', '', '%%GLOBAL_TableType%%', '%%GLOBAL_TableToken%%', 1, '%%GLOBAL_SortColumn%%', '%%GLOBAL_SortDirection%%');">%%GLOBAL_PerPageDisplayOptions%%</select>
            </td>
            <td>
                <div class="d-flex pagingNewButtons">%%GLOBAL_DisplayPage%%</div>
            </td>            
        </tr>
    </table>    
</div>
