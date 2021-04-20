<link rel="stylesheet" type="text/css" href="addons/surveys/styles/tableselector.css" />
<link rel="stylesheet" type="text/css" href="addons/surveys/styles/view.response.css" />
<script type="text/javascript">
	// create the table selector
	jQuery(function($) {
		$('#tinymce-module-form-list').tableSelector({ select : false });
	});
	parent.postMessage({'task': 'scroll_top'});
</script>

{if $surveys}
	<div multiple="" class="table-selector-container form-control scroll1" style="height: 100%; font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;">
		<table class="table-selector" id="tinymce-module-form-list">
		
			<tbody>
				{foreach from=$surveys key=index item=survey}
					<tr>
						<td><input type="radio" style="vertical-align: middle;" name="surveyId" value="{$survey.id}" id="survey_{$survey.id}" />
						<label style="vertical-align: middle;" for="survey_{$survey.id}">{$survey.name}</label></td>
					</tr>
				{/foreach}
			</tbody>
			
		</table>
	</div>
{else}
	<div style='background-color:#EEE; padding:5px 5px 8px 10px; margin-bottom:10px; line-height:140%;'>
		<img src='images/warning.gif' width='18' height='18' align='left' style='padding-right:6px; margin-top:-2px;' /> {$lang.Addon_Surveys_tinymceNoSurveysAvailable}</p>
	</div>
{/if}

<div style="clear: both;"></div>

<style>
div.title{
    background-color:#EBF5FA!important;
}
div.content with-buttons{
	height:320px!important;
}
</style>