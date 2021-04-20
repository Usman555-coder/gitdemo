<tr class="GridRow">
	<td align="center">
	<label class="customCheckBox">
		<input type="checkbox" name="survey_select[]" value="{$surveyid}" />
	<span class="checkmark"></span></label>
	<td>
		<img src="images/mnu_surveys_button.gif">
	</td>
	<td>
		{$name}
	</td>
	<td>
		{$created}
	</td>
	<td>
		{$updated}
	</td>
	<td>
		{$numresponses}
	</td>	
	<td align="center">
		<div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
                {$preview_link}{$view_results}{$export_responses}{$edit_link}{$delete_link}
            </div>
        </div>	
	</td>
</tr>

