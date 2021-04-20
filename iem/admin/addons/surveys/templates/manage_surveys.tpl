<script>
$(document).ready(function() {
	$('#toggleCheck').click(function() {
		if ($('#toggleCheck')[0].checked) {
			$('input[type="checkbox"]').attr('checked','checked');
		} else {
			$('input[type="checkbox"]').attr('checked','');
		}
	});
	
	$('a.deleteButton').click(function() {
		var con = confirm("{$lang.Addon_survey_Confirm_Delete_Multi}");
		if (!con) {
			return false;	
		}
	});

	$('#deleteButton').click(function() {
		var selected = 	$('input[name="survey_select[]"]').filter(function() { return this.checked; });

		if (selected.length < 1) {
			alert("{$lang.Addon_surveys_SurveyDeleted_PleaseSelect}");
			return false;
		}
	
		var con = confirm("{$lang.Addon_survey_Confirm_Delete_Multi}");
		if (con) {				
			document.manageSurvey.action = 'index.php?Page=Addons&Addon=surveys&Action=Delete'; 
			$(document.manageSurvey).submit();
		}
	});
	
	
});

</script>

<div class="parentTableDiv">
	<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
		<tr>
			<td class="Heading1 col-sm-4 Heading1New">
			%%LNG_Addon_surveys_Manage%%
			</td>
		</tr>
	    <tr>
			<td class="body pageinfo internalAnchor">
				<p class="PageIntroP">%%LNG_Addon_surveys_ManageIntro%%</p>
			</td>
		</tr>
		<tr>
			<td>
				{$FlashMessages}
			</td>
		</tr>
	    <tr>
			<td class=body height="10">
				%%GLOBAL_Subscribers_AddButton%%
			</td>
    	</tr>
		<tr>
			<td class="body">
			<form action="{$AdminUrl}" name="manageSurvey" method="post">
				<table width="100%" border="0">
					<tr class="twoButtons">
                        <td valign="top">
                            <div style="padding-bottom:10px">
                                {$Add_Button} 
                            </div>
                        </td>
                        <td valign="top" align="right">
                            <div style="padding-bottom:10px;padding-right: 10px;">
                                {$Delete_Button}
                            </div>
                        </td>
                    </tr>
				</table>
			<div class="thirdPartyTable">
				<table border=0 cellspacing="0" cellpadding="0" width=100% class="Text table" id="SubscribersBannedManageList">
					<tr class="Heading3">	
						<td nowrap align="center">
                        <label class="customCheckBox">
							<input type="checkbox" id="toggleCheck" class="UICheckboxToggleSelector" />
                            <span class="checkmark"></span></label>
						</td>
						<td>&nbsp;</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
								<span>
									<a href='{$AdminUrl}&SortBy=Name&Direction=Up'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&SortBy=Name&Direction=Down'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>					
							%%LNG_Addon_Surveys_Default_TableHead_Name%%
						</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
								<span>
									<a href='{$AdminUrl}&SortBy=Created&Direction=Up'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&SortBy=Created&Direction=Down'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>					
							%%LNG_Addon_Surveys_Default_TableHead_Created%%
						</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
								<span>
									<a href='{$AdminUrl}&SortBy=Updated&Direction=Up'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&SortBy=Updated&Direction=Down'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>					
							%%LNG_Addon_Surveys_Default_TableHead_Updated%%
						</td>
						<td>
							<div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
								<span>
									<a href='{$AdminUrl}&SortBy=ResponseCount&Direction=Up'>
										<i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
									</a>
								</span>
								<span>
									<a href='{$AdminUrl}&SortBy=ResponseCount&Direction=Down'>
										<i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
									</a>
								</span>
							</div>
							%%LNG_Addon_Surveys_Default_TableHead_Responses%%
						</td>
						<td align="center">
							%%LNG_Action%%
						</td>
					</tr>
					{$Items}
				</table>
			</div>
            &nbsp;
			{$Paging}
			</form>
			</td>
		</tr>
	</table>
</div>
<style>
.disabled-item {
	font-size: 14px !important;
    font-family: 'Roboto', Arial, Tahoma, sans-serif !important;
    color: #cacaca !important;
}
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.multiselectTd{
    display:flex;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
.parentTableDiv {
    width:100%;
}
.nextCancelButton {
    margin-top:11.5%;
}
.submitTableBtn{
    width:180px;
}
.Field250{
    width:410px;
    margin-right:0px;
}
.Field350 {
    width:410px !important;
    padding-right:0px;
}
.form-control {
    display:inline;
}
.BodyContainer{
    width:98.5%;
    margin:10px 10px 10px 7px;
}
.createSurveyButton {
    width:8rem !important;
}
TR.GridRow TD:nth-child(3) {
    width:30%;
    word-break:break-all;
}
@media screen and (max-width:1024px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:0px !important;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:98.5%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:925px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:end !important;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .thirdPartyTable{
        width:920px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        //flex-direction: column !important;
        //padding:10px 0px;
        //align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 0px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 0px !important;
    }
}
@media screen and (max-width:823px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px !important;  
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:end !important;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:768px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px !important;  
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:end !important;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:730px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px !important;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:98%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:665px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:end !important;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .thirdPartyTable{
        width:655px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:600px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px !important;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:98%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:550px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:end !important;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .thirdPartyTable{
        width:550px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:568px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px !important;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
}
@media screen and (max-width:414px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:-2px !important;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:411px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:-2px !important;  
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:335px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:end !important;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:375px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px !important;  
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:345px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:-2px !important;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer {
		width: 100%;
		margin: 0px 0px 10px 0px;
	}
    .parentTableDiv{
        width:300px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:end !important;
    }
    .thirdPartyTable{
        width:300px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:320px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:-1px !important;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:270px !important;
    }
    .twoButtons {
        display: contents;
    }
    .twoButtons:nth-child(1) {
        text-align:start !important;
    }
    .twoButtons td:nth-child(2) {
        text-align:start !important;
    }
    .thirdPartyTable{
        width:265px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .createSurveyButton {
        width:8rem !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2) {
        padding-right: 15px !important;
    }
}
</style>