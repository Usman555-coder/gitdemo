<form action="{$AdminUrl}&Action=Create" method="post">
<input type="hidden" name="Page" value="Surveys">
<table cellspacing="0" cellpadding="0" width="100%" align="center">
	<tr>
		<td class="Heading1">%%LNG_Addon_surveys_TemplatesManage%%</td>
	</tr>
	<tr>
		<td class="body pageinfo"><p>%%LNG_Addon_surveys_TemplatesManageIntro%%</p></td>
	</tr>
	<tr>
		<td class="body">
			<div style='background-color:#faa527 !important; padding:8px; margin-bottom:10px;
    color:#000000;'>
				<img src='images/success.gif' width='18' height='18' align='left' style='padding-right:4px; margin-top:-2px' />%%LNG_Addon_surveys_NoTemplates%%
			</div>
		</td>
	</tr>
	<tr><td class="body">{$Add_Button}</td></tr>
</table>
</form>