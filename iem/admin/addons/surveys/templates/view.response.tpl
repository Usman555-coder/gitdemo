<link rel="stylesheet" type="text/css" href="addons/surveys/styles/view.response.css" />
<script src="includes/js/jquery/plugins/jquery.jFrame.js"></script>
<script src="includes/js/jquery/plugins/jquery.tableSelector.js"></script>

<script type="text/javascript">
// form module jFrame instance
new jFrame({
controllerPath : 'addons/surveys/js/',
cache          : false
}, 'moduleForm');

jFrame.getInstance('moduleForm').dispatch('view.response', {
surveyId       : {$form.id},
responseNumber : {$responseNumber},
responseId     : {$responseId}
});

</script>
<div>
{if $responseCount}
<h1 class="PageTitle Heading1 Heading1New">{$lang.Addon_Surveys_viewResponseTitle|sprintf,$responseNumber,$responseCount,$form.name}</h1>
{else}
<h1 class="PageTitle Heading1 Heading1New">{$lang.Addon_Surveys_viewResponseTitleNoResponses|sprintf,$form.name}</h1>
{/if}
<div class="PageDescription" style="padding:5px 0px 20px 0px;">{$lang.Addon_Surveys_viewResponseDescription}</div>

<div id="MainMessage">{$FlashMessages}</div>

{if $responseCount}
<div class="Buttons FloatLeft">
<button class="btn save-btn edit-response">{$lang.Addon_Surveys_viewResponseButtonEdit}</button>
<button class="btn cancel-btn delete">{$lang.Addon_Surveys_viewResponseButtonDelete}</button>
<button class="btn cancel-btn cancel">{$lang.Addon_Surveys_viewResponseButtonCancel}</button>
</div>

<div class="Clear"></div>

<dl style="background-color:white" class="mt-3 widgets">
{foreach from=$widgets item=widget}
{if $widget.type != 'section.break'}
<dt>{$widget.number}. {$widget.name}</dt>
{if $widget.values}
{foreach from=$widget.values item=value}
{if $value.value}
<dd{if $value.isLast} style="background-color: white;" class="last"{/if}>
{if $widget.type == 'file'}
<a href="index.php?Page=Addons&Addon=surveys&Action=downloadAttach&formId={$form.id}&responseId={$responseId}&value={$value.file_encode}&ajax=1">{$value.value}</a>
{elseif $widget.type == 'textarea'}
{$value.value|nl2br}
{else}
{$value.value}
{/if}
</dd>
{else}
<dd{if $value.isLast} style="background-color: white;" class="last"{/if}>{$lang.Addon_Surveys_viewResponseNotProvided}</dd>
{/if}
{/foreach}
{else}
<dd style="background-color: white;" class="last">{$lang.Addon_Surveys_viewResponseNotProvided}</dd>
{/if}
{/if}
{/foreach}
</dl>

{if $responseCount > 1}
<div class="Buttons d-flex Alignment">
<button class="ml-2 btn save-btn prev"{if $responseNumber == 1} disabled="disabled"{/if}>{$lang.Addon_Surveys_viewResponseButtonPrevious}</button>
<select class="ml-2 form-control ButtonWidth" name="responseNumber">
{foreach from=$responseNumbers key=index item=num}
<option value="{$num}"{if $num == $responseId} selected="selected"{/if}>{$lang.Addon_Surveys_editResponseResponseNumber|sprintf,$index}</option>
{/foreach}
</select>
<button class="ml-2 btn save-btn next"{if $responseNumber == $responseCount} disabled="disabled"{/if}>{$lang.Addon_Surveys_viewResponseButtonNext}</button>
</div>
{/if}

<div class="Clear"></div>
{/if}
</div>
<style>
.BodyContainer {
    width: 95%;
    margin: 0 10px 10px 10px;
}
.ButtonWidth{
    width: 8rem;
}
.widgets dd {
    background-color:#FFFFFF !important;
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
.Alignment {
    //margin-left: 500px;
}
@media screen and (max-width:1024px){
    .Alignment {
    margin-left: 315px;
}
}@media screen and (max-width:823px){
    .Alignment {
    margin-left: 210px;
}
}
@media screen and (max-width:568px){
    .ButtonWidth{
    width: 7rem;}
}
@media screen and (max-width:414px){
    .Alignment{
    margin-left: 50px;}
}
@media screen and (max-width:411px){
    .Alignment{
    margin-left: 40px;}
}
@media screen and (max-width:375px){
.Alignment{
    margin-left: 20px;}
}
@media screen and (max-width:360px){
    .Alignment{
    margin-left: 25px;}
}
@media screen and (max-width:320px){
    .Alignment {
    margin-left: 5px;}
    }
    .prev {
        margin-left:0px !important;
    }
}
</style>