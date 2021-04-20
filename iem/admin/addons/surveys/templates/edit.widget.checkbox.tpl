{foreach from=$widget.fields item=field}
	<dd{if $field.isLast} class="last"{/if}>
		{if $field.is_other}
			
			<label class="customCheckBox" for="WidgetField_{$field.id}"><input id="WidgetField_{$field.id}" type="checkbox" name="widget[{$widget.id}][field][{$field.id}][value]" value="__other__"{if $field.is_selected} checked="checked"{/if} /> {$langvars.editResponseOtherText}<span class="checkmark"></span></label>
			<input type="text" name="widget[{$widget.id}][field][{$field.id}][other]" value="{$field.value}" />
		{else}
			
			<label class="customCheckBox" for="WidgetField_{$field.id}"><input id="WidgetField_{$field.id}" type="checkbox" name="widget[{$widget.id}][field][{$field.id}][value]" value="{$field.value}"{if $field.is_selected} checked="checked"{/if} /> {$field.value}<span class="checkmark"></span></label>
		{/if}
	</dd>
{/foreach}