<link rel="stylesheet" type="text/css" href="addons/surveys/styles/view.response.css" />

<script src="includes/js/jquery/plugins/jquery.jFrame.js"></script>
<script src="includes/js/jquery/plugins/jquery.tableSelector.js"></script>

<script type="text/javascript">
	// form module jFrame instance
		new jFrame({
			controllerPath : 'addons/surveys/js/',
			cache          : false
		}, 'moduleForm');

	jFrame.getInstance('moduleForm').dispatch('edit.response', {
			formId         : {$form.id}, 
			responseNumber : {$responseNumber},
			responseId     : {$responseId}
		});

</script>

<div>
	<h1 class="PageTitle Heading1 Heading1New">{$lang.Addon_Surveys_editResponseTitle|sprintf,$responseNumber,$responseCount,$form.name}</h1>
	<div class="PageDescription" style="padding:5px 0px 20px 0px;">{$lang.Addon_Surveys_editResponseDescription}</div>
	
	{$flashMessage}
	
	<div class="Buttons FloatLeft">
		<button class=" btn save-btn save-and-view ">{$lang.Addon_Surveys_editResponseButtonSaveAndView}</button>
		<button class="btn save-btn save-and-view-next "{if $responseNumber == $responseCount} disabled="disabled"{/if}>{$lang.Addon_Surveys_editResponseButtonSaveAndViewNext}</button>
		<button class="btn save-btn save-and-keep-editing ">{$lang.Addon_Surveys_editResponseButtonSaveAndKeepEditing}</button>
		<button class="btn cancel-btn delete ">{$lang.Addon_Surveys_editResponseButtonDelete}</button>
		<button class="btn cancel-btn cancel">{$lang.Addon_Surveys_editResponseButtonCancel}</button>
	</div>
	
	{if $responseCount > 1}
		<div class="Buttons FloatRight" style="display:none;">
			<button class="prev Field"{if $responseNumber == 1} disabled="disabled"{/if}>{$lang.Addon_Surveys_editResponseButtonPrevious}</button>
			<select class="Field" name="responseNumber" style="width: 133px;">
					{foreach from=$responseNumbers key=index item=num}
						<option value="{$num}"{if $num == $responseId} selected="selected"{/if}>{$lang.Addon_Surveys_editResponseResponseNumber|sprintf,$index}</option>
					{/foreach}
			</select>
			<button class="next Field"{if $responseNumber == $responseCount} disabled="disabled"{/if}>{$lang.Addon_Surveys_editResponseButtonNext}</button>
		</div>
	{/if}
	<div class="Clear"></div>
	<form id="edit-response-form" action="index.php?Page=Addons&Addon=surveys&Action=saveresponse&ajax=1" method="post" enctype="multipart/form-data">
		<input type="hidden" name="formId" value="{$form.id}" />
		<input type="hidden" name="responseId" value="{$responseId}" />
		<input type="hidden" name="responseNumber" value="{$responseNumber}" />
		
		{if $responseCount}
			<dl class="widgets">
				{foreach from=$widgets item=widget}
					{if $widget.type != 'section.break'}
						<dt>{$widget.number}. {$widget.name} {if $widget.is_required}<span class="required">*</span>{/if}</dt>
						
						{if $widget.errors}
							{foreach from=$widget.errors item=error}
								<dd class="required">{$error}</dd>
							{/foreach}
						{/if}
						
						{$widget.template}
					{/if}
				{/foreach}
			</dl>
		{else}
			<p>{$lang.Addon_Surveys_editResponseNoResponses|sprintf,$form.name}</p>
		{/if}
	</form>

	{if $responseCount > 1}
		<div class="Buttons FloatRight d-flex">
			<button class="btn save-btn prev "{if $responseNumber == 1} disabled="disabled"{/if}>{$lang.Addon_Surveys_editResponseButtonPrevious}</button>
			<select class="ml-2 form-control ButtonWidth" name="responseNumber">
					{foreach from=$responseNumbers key=index item=num}
						<option value="{$num}"{if $num == $responseId} selected="selected"{/if}>{$lang.Addon_Surveys_editResponseResponseNumber|sprintf,$index}</option>
					{/foreach}
			</select>
			<button class="ml-2 btn save-btn next "{if $responseNumber == $responseCount} disabled="disabled"{/if}>{$lang.Addon_Surveys_editResponseButtonNext}</button>
		</div>
	{/if}
	
	<div class="Clear"></div>
</div>
<style>
.BodyContainer {
    width: 98%;
    margin: 0 10px 10px 10px;
}
.ButtonWidth{
    width: 7.5rem;
}
.FloatRight {
    float: unset;
    //margin-left: 500px;
}
.FloatLeft
{
 padding-bottom: 1rem;
 float: left;
}
.widgets dd {
	background-color:#ffffff !important;
}
.widgets dd textarea, .widgets dd input[type="text"], .widgets dd .customRadio, .widgets dd .customCheckbox, .widgets dd select{
	width:16rem !important;
	font			:  14px 'Roboto', Arial, Tahoma, sans-serif;
	
}
dl.widgets dt {
	color            : #000;
	background-color : #edecec;
	padding          : 10px;
	margin           : 0;
	font			:  14px 'Roboto', Arial, Tahoma, sans-serif;
	font-weight		: 600;
	background-image : unset !important;
}
@media screen and (max-width:1024px){
.FloatRight {
    float: unset;
    margin-left: 315px;
}
.FloatLeft
{
 padding-bottom: 1rem;
 float: left;
}}
@media screen and (max-width:823px){
.FloatRight {
    float: unset;
    margin-left: 210px;
}
}
@media screen and (max-width:568px){
	.FloatRight {
		float: unset;
		margin-left: 20px;
	}
	.FloatLeft > .save-btn:nth-child(-n+2) {
		margin-bottom:10px;
	}
}
@media screen and (max-width:414px){
	.FloatRight {
		float: unset;
		margin-left: 50px;
	}
	.FloatLeft > .save-btn:nth-child(-n+2) {
		margin-bottom:10px;
	}
}
@media screen and (max-width:411px){
	.FloatRight {
		float: unset;
		margin-left: 40px;
	}
	.FloatLeft > .save-btn:nth-child(-n+2) {
		margin-bottom:10px;
	}
}
@media screen and (max-width:375px){
	.FloatRight {
		float: unset;
		margin-left: 20px;
	}
	.FloatLeft > .save-btn:nth-child(-n+2) {
		margin-bottom:10px;
	}
}
@media screen and (max-width:360px){
	.FloatRight {
		float: unset;
		margin-left: 25px;
	}
	.FloatLeft > .save-btn:nth-child(-n+2) {
		margin-bottom:10px;
	}
}
@media screen and (max-width:320px){
	.FloatRight {
		float: unset;
		margin-left: 5px;
	}
	.FloatLeft > .save-btn:nth-child(-n+2) {
		margin-bottom:10px;
	}
	.FloatLeft > .save-btn:nth-child(5) {
		margin-top:10px;
	}
}
</style>