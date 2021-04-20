<link rel="stylesheet" type="text/css" href="addons/surveys/styles/tableselector.css" />
<link rel="stylesheet" type="text/css" href="addons/surveys/styles/view.response.css" />
<script src="includes/js/jquery/plugins/jquery.tableSelector.js"></script>
<script src="includes/js/jquery/plugins/jquery.jFrame.js"></script>
<script type="text/javascript">
    // form module jFrame instance
    new jFrame({
        controllerPath: 'addons/surveys/js/',
        cache: false
    }, 'moduleForm');
    jFrame.getInstance('moduleForm').dispatch('result.survey');
</script>
<style>
    table.table-selector td {
        font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;
        margin:0px;
        padding:0px;
    }
    table.table-selector td:nth-child(1) {
        padding-left:5px !important;
        padding-right:5px !important;
    }
    table.table-selector td:nth-child(2) {
        word-break: break-word;
        width: 70%;
        padding-top:5px !important;
        padding-right:10px;
        vertical-align:top;
    }
    .FormButtonSurvey {
        font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;
    }
    table.table-selector tr.selected {
    background: #777a7d none repeat scroll 0 0;
}
</style>
<h1 class="PageTitle Heading1 col-sm-4 Heading1New">{$lang.Addon_Surveys_ResultsDefaultTitle}</h1>
<div class="PageDescription" style="padding:5px 0px 20px 0px">{$lang.Addon_Surveys_ResultsDefaultDescription}</div>
<div id="MainMessage">{$flashMessage}</div>
{if $surveys}
    <form id="form-responses" action="index.php?Page=Addons&Addon=surveys&Action=result" method="post">	
        <h3 class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35); color:#1f2327">{$lang.Addon_Surveys_ResultsDefaultForm}</h3>
        <fieldset class="inline">
            <ul>
                <li>
                    <label class="labelLi">
                        <span class="required">*</span>
                         {$lang.Addon_Surveys_ResultsSurveySelect}
                    </label>
                    <div style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000; " class="multiselectTd">
                        <div multiple class="table-selector-container form-control scroll1" style="height: 100%; font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;">
                            <table  class="table-selector " style="width:100%">
                                <tbody>
                                    {foreach from=$surveys key=k item=form}
                                        <tr>
                                            <td align="middle">
                                                <label class="customRadio">
                                                    <input {if $form.responseCount == 0}class="no-responses"{/if} type="radio" name="surveyId" value="{$form.id}" />
                                                    <span class="checkmarkRadio"></span>
                                                </label>
                                            </td>
                                            <td>{$form.name}</td>
                                            <td>
                                                {$form.responseCount}
                                                {if $form.responseCount == 1}
                                                    {$lang.Addon_Surveys_responseSingular}
                                                {else}
                                                    {$lang.Addon_Surveys_responsePlural}
                                                {/if}
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="formButtons">
                        <button class="FormButtonSurvey SaveAddButton btn save-btn SubmitButton" type="submit">{$lang.Addon_Surveys_ResultsViewResults}</button>
                        <button class="FormButtonSurvey nextCancelButton CancelButton btn cancel-btn cancel" type="button">{$lang.Addon_Surveys_exportResponsesCancel}</button>
                    </div>
                </li>
            </ul>
    </form>
{else}
    <div id="no-forms-message"></div>
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td class="body">
                <div style='background-color:#faa527 !important; padding:8px; margin-bottom:10px;
    color:#000000;'>
                    <img src='images/info.gif' width='18' height='18' align='left' style='padding-right:4px; margin-top:-2px' />{$lang.Addon_Surveys_NoResults}
                </div>
            </td>
        </tr>
        <tr><td class="body"><input type="submit" name="Action" value="%%LNG_Addon_surveys_Create%%" class=" createSurveyButton btn save-btn" style="width:16rem" onclick="location.href = 'index.php?Page=Addons&Addon=surveys&&Action=Create';
                        return false;"></td></tr>
    </table>
{/if}
<style>
*{
    box-sizing:border-box;
}
.multiselectTd {
    display: flex;
    width: 450px;
    height: 150px;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
.table-selector-container {
    border: 1px solid #ced4da;
}
.nextCancelButton {
    margin-top:0%;
} 
.ISSelectDiv{
    height:150px !important;
    width:450px !important;
}
.submitTableBtn{
    width:180px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:-2px;
}
.labelLi {
    font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem !important; padding-left:18px;
}
.formButtons {
    margin-left: 165px;
}
.customRadio {
    padding-bottom: 0px;
    padding-top: 0px;
    margin:7px 0px;
}
.ContentContainer {
    width:100% !important;
}
.BodyContainer {
    width:98.5%;
}

table.table-selector tr.selected {
    background: #316AC5 none repeat scroll 0 0 !important;
}
@media screen and (max-width:1024px){
    .BodyContainer {
        width:98%;
    }
    .multiselectTd {
        display: flex;
        width: 450px !important;
        height: 150px !important;
    }
    .ISSelectDiv{
        height:150px !important;
        width:400px !important;
        overflow-x: auto;
    }
    .nextCancelButton {
        margin-top:0px;
    } 
    .HelpToolTipDiv{
        margin-left:10px !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:0px;
    }
    .submitTableBtn{
        width:182px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -130px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .labelLi {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:13em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    .formButtons {
    margin-left: 180px;
}
}
@media screen and (max-width:823px){
    .BodyContainer {
        width:98.5%;
    }
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:400px !important;
        overflow-x: scroll;
    }
    .nextCancelButton {
        margin-top:0%
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:180px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .labelLi {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:13em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
}
@media screen and (max-width:768px){
    .BodyContainer {
        width:98.5%;
    }
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:400px !important;
        overflow-x: scroll;
        margin-top: 10px;
    }
    .nextCancelButton {
        margin-top:0px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:0px;
    }
    .submitTableBtn{
        width:180px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .labelLi {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:13em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    .formButtons {
    margin-left: 180px;
}
}
@media screen and (max-width:568px){
    .BodyContainer {
        width:98.5%;
    }
    .multiselectTd {
        width:150px !important;
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:260px !important;
        overflow-x: scroll;
        margin-top: 10px;
    }
    .nextCancelButton {
        margin-top:0px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:25px !important;
        padding-top:0px;
    }
    .submitTableBtn{
        width:180px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .labelLi {
        
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:8em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    table.table-selector td {
        padding:0px !important;
    }
    .formButtons {
        margin-left:112px !important;
    }
    fieldset.inline > ul > li > div {
        padding: 6px 8px 6px 0px !important;
    }
    fieldset.inline > ul > li > label {
        padding: 15px 2px 10px 0px !important;
    }
}
@media screen and (max-width:414px){
    .BodyContainer {
        width:98.5%;
    }
    .table-selector-container {
        min-width:180px !important;
        overflow-x:scroll !important;
    }
    .multiselectTd {
        width:150px !important;
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
        overflow-x: scroll;
    }
    .nextCancelButton {
        margin-top:5px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:25px !important;
        padding-top:0px;
    }
    .submitTableBtn{
        width:150px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .labelLi {
        
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:8em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    table.table-selector td {
        padding:0px !important;
    }
    .formButtons {
        margin-left:112px !important;
    }
    fieldset.inline > ul > li > div {
        padding: 6px 8px 6px 0px !important;
    }
    fieldset.inline > ul > li > label {
        padding: 15px 2px 10px 0px !important;
    }
    table.table-selector td:nth-child(2) {
        word-break: break-word;
        width: 38%;
        padding-top:5px !important;
        padding-right:10px;
        vertical-align:top;
    }
}
@media screen and (max-width:411px){
    .BodyContainer {
        width:94%;
    }
    .table-selector-container {
        min-width:180px !important;
        overflow-x:scroll !important;
    }
    .multiselectTd {
        width:340px !important;
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
        overflow-x: scroll;
    }
    .nextCancelButton {
        margin-top:0px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:25px !important;
        padding-top:0px;
    }
    .submitTableBtn{
        width:170px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-12px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .labelLi {
        
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:8em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    table.table-selector td {
        padding:0px !important;
    }
    .formButtons {
        margin-left:80px !important;
    }
    fieldset.inline > ul > li > div {
        padding: 6px 8px 6px 0px !important;
    }
    fieldset.inline > ul > li > label {
        padding: 15px 2px 10px 0px !important;
    }
    table.table-selector td:nth-child(2) {
        word-break: break-word;
        width: 64%;
        padding-top:5px !important;
        padding-right:10px;
        vertical-align:top;
    }
}
@media screen and (max-width:375px){
    .BodyContainer {
        width:98.5%;
    }
    .table-selector-container {
        min-width:auto !important;
        overflow-x:scroll !important;
    }
    .multiselectTd {
        width:335px !important;
        display:inline;
        overflow-x: scroll;
    }
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
        overflow-x: scroll;
    }
    .nextCancelButton {
        margin-top:0px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:25px !important;
        padding-top:0px;
    }
    .submitTableBtn{
        width:138px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .labelLi {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:8em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    table.table-selector td {
        padding:0px !important;
    }
    .formButtons {
        margin-left:112px !important;
    }
    fieldset.inline > ul > li > div {
        padding: 6px 8px 6px 0px !important;
    }
    fieldset.inline > ul > li > label {
        padding: 15px 2px 10px 0px !important;
    }
    table.table-selector td:nth-child(2) {
        word-break: break-word;
        width: 70%;
        padding-top:5px !important;
        padding-right:10px;
        vertical-align:top;
    }
}
@media screen and (max-width:360px){
    .BodyContainer {
        width:94.5%;
    }
    .table-selector-container {
        min-width:180px !important;
        overflow-x:scroll !important;
    }
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
        overflow-x: scroll;
    }
    .nextCancelButton {
        margin-top:0px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:25px !important;
        padding-top:0px;
    }
    .submitTableBtn{
        width:138px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-12px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .multiselectTd {
        width:295px !important;
        display:inline;
    }
    .labelLi {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:8em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    table.table-selector td {
        padding:0px 5px !important;
    }
    .formButtons {
        margin-left:55px !important;
    }
    fieldset.inline > ul > li > div {
        padding: 6px 8px 6px 0px !important;
    }
    fieldset.inline > ul > li > label {
        padding: 15px 2px 10px 0px !important;
    }
    table.table-selector td:nth-child(2) {
        word-break: break-word;
        width: 52%;
        padding-top:5px !important;
        padding-right:10px;
        vertical-align:top;
    }
}
@media screen and (max-width:320px){
    .BodyContainer {
        width:93%;
    }
    .table-selector-container {
        min-width:180px !important;
        overflow-x:scroll !important;
    }
    .ISSelectDiv{
        height:150px !important;
        width:100px !important;
        overflow-x: scroll;
    }
    .nextCancelButton {
        margin-top: 0px;
    } 
    .FormButton{
        margin-top:4px;  
        
    }
    .customRadio {
        width:25px !important;
        padding-top:0px;
    }
    .submitTableBtn{
        width:150px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -150px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-12px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .multiselectTd {
        width:265px !important;
        display:inline;
    }
    .labelLi {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        color: #000;
        width:9.5em !important;
        font-size:14px;
        padding-top: 1.35rem !important;
    }
    table.table-selector td {
        padding:0px !important;
    }
    .formButtons {
        margin-left: 45px !important; 
    }
    fieldset.inline > ul > li > div {
        padding: 6px 8px 6px 0px !important;
    }
    fieldset.inline > ul > li > label {
        padding: 15px 2px 10px 0px !important;
    }
    table.table-selector td:nth-child(2) {
        word-break: break-word;
        width: 55%;
        padding-top:5px !important;
        padding-right:10px;
        vertical-align:top;
    }
}
</style>