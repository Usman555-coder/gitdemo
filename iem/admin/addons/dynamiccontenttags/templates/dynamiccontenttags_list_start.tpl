<script>
parent.postMessage({'task': 'scroll_top'});
</script>
<div>
	<div class="toolTipBox" style="padding:10px; margin: 10px 10px 0 10px; background-image: url('images/infoballon.gif'); background-repeat: no-repeat; padding-left: 24px; background-position: 5px 10px;{$ShowInfo}">
		%%LNG_InsertDynamicContentTags_Description%%
	</div>
	<div>
		{$FlashMessages}
	</div>
        {$CloseButton}
</div>

<style>
div.title{
	background-color:#EBF5FA!important;
}
.ui-window .content-container, #ModalContentContainer{
	background:#ffffff!important;
}
</style>