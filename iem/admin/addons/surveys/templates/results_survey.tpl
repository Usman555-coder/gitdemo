<link rel="stylesheet" type="text/css" href="addons/surveys/styles/tableselector.css" />
<link rel="stylesheet" type="text/css" href="addons/surveys/styles/view.response.css" />
<link rel="stylesheet" type="text/css" href="addons/surveys/styles/survey_result.css" />

<script src="includes/js/jquery/plugins/jquery.tableSelector.js"></script>
<script src="includes/js/jquery/plugins/jquery.jFrame.js"></script>

<script type="text/javascript">
		// form module jFrame instance
		new jFrame({
			controllerPath : 'addons/surveys/js/',
			cache          : false
		}, 'moduleForm');

	jFrame.getInstance('moduleForm').dispatch('result.survey');
</script>

<div>
	{if $responseCount}
		<h1 class="PageTitle Heading1 Heading1New">{$lang.Addon_Surveys_resultsResponseTitle|sprintf,$survey_name}</h1>
	{else}
		<h1 class="PageTitle Heading1 col-sm-4 Heading1New">{$lang.Addon_Surveys_resultsResponseTitleNoResponses|sprintf,$form.name}</h1>
	{/if}
	<div class="PageIntroP">{$lang.Addon_Surveys_resultsResponseDescription}</div>
	<form id="form-responses" action="index.php?Page=Addons&Addon=surveys&Action=export&ajax=1" method="post">
		<div class="Buttons SubtitleBtnMargin">
			<input type="hidden" id="survey_id" value="{$survey_id}" />
			<button class="export btn save-btn btnMargin" type="button">{$lang.Addon_Surveys_Results_exportResponses}</button>
			<button class="browse btn save-btn" type="button">{$lang.Addon_Surveys_Results_browseResponse}</button>
		</div>
	</form>
	{if $responseCount}
	<dl class=" mt-3 widgets">	
		{foreach from=$survey_results item=each_result}
			{$each_result}
		{/foreach}
	</dl>
	{/if}		
</div>	
<style>
.SubtitleBtnMargin {
    margin-top: 20px !important;
}
table.survey_results tr.winner {
	background-color:unset !important;
}
.ContentContainer{
	width: 100% !important;
}
.BodyContainer {
	width: 98%;
}
.thirdPartyTable {
    width: 375px !important;
    overflow-x: scroll !important;
}
table.survey_results tr th {
    height: 25px;
    border-bottom: solid 2px white;
    text-align: left;
    padding-left: 14px;
    padding-top: 0.3rem;
}
dl.widgets dt {
    color: #000;
    background-color: #edecec;
    padding: 10px;
    margin: 0;
    font: 14px 'Roboto', Arial, Tahoma, sans-serif;
    font-weight: 600;
    background-image: unset !important;
	height: 37px;
}

table.survey_results td {
     padding: .2em; 
    border-left: 1px solid #fff;
    background-color: white !important;
}
dl.widgets dd {
    margin: 0;
    padding: 0px;
    background-color: #FFFFFF;
    border-bottom: 1px solid #ddd;
}
.tablewidth{
	width:66%
}
table.survey_results th.survey_stats, table.survey_results td.survey_stats {
    width: 8%;
    background: white;
    border-left: 1px solid #fff;
    border-right: 1px solid #fff;
    padding-left: 0px;
    padding-right: 0px;
    text-align: center;
    vertical-align: middle;
}

table.survey_results tr.winner td {
    background-color: #fff !important;
    color: #000;
}
table.survey_results tr.winner td.winner {
    padding-left: 0px;
    vertical-align: middle;
    text-align: center;
    padding-right: 0px !important;
}
dl.widgets dd {
	padding : 0px;
	Border-bottom: 0px;
}
dl.widgets dt {
	height:auto;
}
table.survey_results tr th {
	padding:0px 5px !important;
}
.SubtitleBtnMargin{
	margin-top: 9px;
	}

@media screen and (max-width:1024px){
	.tablewidth{
	width:66%
}
}
@media screen and (max-width:823px){
	.tablewidth{
		width:66%
	}
}
@media screen and (max-width:568px){
	.tablewidth{
		width:66%
	}
	table.survey_results tr.winner td {
    background-color: #fff !important;
    color: #000;
	word-break: break-word;
    width: 25%;
}
	.BodyContainer {
		width: 94%;
	}
}
@media screen and (max-width:414px){
	.tablewidth{
		width:66%
	}
	.btnMargin{
    margin-top: 9px;
	margin-bottom: 4px;
	}
	table.survey_results tr.winner td {
    background-color: #fff !important;
    color: #000;
	word-break: break-word;
    width: 25%;
}
	.BodyContainer {
		width: 94%;
	}
}
@media screen and (max-width:411px){
	.tablewidth{
		width:66%
	}
	.btnMargin{
    margin-top: 9px;
	margin-bottom: 4px;
	}
	table.survey_results tr.winner td {
    background-color: #fff !important;
    color: #000;
	word-break: break-word;
    width: 25%;
}
	.BodyContainer {
		width: 94%;
	}
}
@media screen and (max-width:375px){
	.btnMargin{
	margin-top: 9px;
    margin-bottom: 4px;
	}
		.tablewidth{
		width:66%
	}
	table.survey_results tr.winner td {
    background-color: #fff !important;
    color: #000;
	word-break: break-word;
    width: 25%;
}
	.BodyContainer {
		width: 94%;
	}
}
@media screen and (max-width:360px){
	.btnMargin{
	margin-top: 9px;    
	margin-bottom: 4px;
	}
		.tablewidth{
		width:66%
	}
	table.survey_results tr.winner td {
    background-color: #fff !important;
    color: #000;
	word-break: break-word;
    width: 25%;
}
	.BodyContainer {
		width: 94%;
	}
}
@media screen and (max-width:320px){
	.btnMargin{
	margin-top: 9px;
    margin-bottom: 4px;
	}
	.tablewidth{
		width:66%
	}
	table.survey_results tr.winner td {
		background-color: #fff !important;
		color: #000;
		word-break: break-word;
		width: 37%;
	}
	.BodyContainer {
		width: 94%;
	}
}
</style>
