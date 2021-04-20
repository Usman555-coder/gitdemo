{foreach from=$widget.fields item=field}
	<dd{if $field.isLast} class="last"{/if}>
		{if $field.is_other}
			
			<label class="customRadio" for="WidgetField_{$field.id}"><input id="WidgetField_{$field.id}" type="radio" name="widget[{$widget.id}][field][0][value]" value="__other__"{if $field.is_selected} checked="checked"{/if} /> {$langvars.editResponseOtherText}<span class="checkmarkRadio"></span></label>
			<input type="text" name="widget[{$widget.id}][field][0][other]" value="{$field.value}" />
		{else}
			
			<label class="customRadio" for="WidgetField_{$field.id}"><input id="WidgetField_{$field.id}" type="radio" name="widget[{$widget.id}][field][0][value]" value="{$field.value}"{if $field.is_selected} checked="checked"{/if} /> {$field.value}<span class="checkmarkRadio"></span></label>
		{/if}
	</dd>
{/foreach}
