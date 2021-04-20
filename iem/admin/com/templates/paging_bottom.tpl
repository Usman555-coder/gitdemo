&nbsp;
<div align="right" style="display: flex;">
    <table width="100%" class="paginationTable">
        <tr class="d-flex justify-content-between align-items-center pagingNew">
            <td>%%GLOBAL_pageofpage%%</td>
            <td>
                <span style="font-weight:600;">%%LNG_ResultsPerPage%%:</span>&nbsp;
                <select name="PerPageDisplay%%GLOBAL_PPDisplayName%%" id="PerPageDisplay%%GLOBAL_PPDisplayName%%" style="padding: 8px;width: 64px;padding: 0.5rem 0.45rem;" onChange="ChangePaging('%%PAGE%%', '%%GLOBAL_FormAction%%', '%%GLOBAL_PPDisplayName%%', '%%LNG_Paging_Confirm_All%%')">%%GLOBAL_PerPageDisplayOptions%%</select>
            </td>
            <td>
                <div class="d-flex">%%GLOBAL_DisplayPage%%</div>
            </td>            
        </tr>
    </table>    
</div>
