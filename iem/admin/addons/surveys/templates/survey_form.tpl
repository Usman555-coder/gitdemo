<script src="includes/js/jquery/ui.js"></script>
<script src="includes/js/jquery/form.js"></script>
<script src="includes/js/jquery/plugins/jquery.form.js"></script>
<script src="includes/js/jquery/plugins/jquery.plugin.js"></script>
<script src="includes/js/jquery/plugins/jquery.bond.js"></script>
<script src="includes/js/jquery/plugins/jquery.fill.js"></script>
<script src="includes/js/jquery/plugins/jquery.exampleField.js"></script>
<script src="includes/js/jquery/plugins/jquery.float.js"></script>
<script src="includes/js/jquery/plugins/jquery.jFrame.js"></script>
<script src="includes/js/jquery/plugins/jquery.keys.js"></script>
<script src="includes/js/jquery/plugins/jquery.metadata.js"></script>
<script src="includes/js/jquery/plugins/jquery.tableSelector.js"></script>
<script src="includes/js/jquery/plugins/jquery.template.js"></script>
<script src="includes/js/jquery/plugins/jquery.utils.js"></script>
<script type="text/javascript">//<!--
    // set registry variables
    jFrame.registry.set('lang',
    {"Addon_Surveys_WidgetValueField":"Option #"});
    // form module jFrame instance
    new jFrame({
        controllerPath: 'addons/surveys/js/',
        cache: false
    }, 'moduleForm');
    jFrame.getInstance('moduleForm').dispatch('edit.form');
    $(document).ready(function () {
        jQuery.fn.errorMessage = function (error, arrMsgs) {
            var val = '';
            var whichTab = 0;
            if (arrMsgs && arrMsgs.length > 0) {
                val = error + "<ul>";
                for (i = 0; i < arrMsgs.length; i++) {
                    val += '<li>' + arrMsgs[i] + '</li>';
                    if (arrMsgs[i] == "{$lang.Addon_Surveys_ErrorMessage_mustHaveWidgets_numberRange}") {
                        whichTab = 1;
                    }
                }
                val += "</ul>";
            } else {
                val = error;
            }
          $(this).html('<table cellspacing="0" cellpadding="0" width="100%" id="MessageTable" ><tr><td><table border="0" cellspacing="0" cellpadding="0"><tr><td class="Message" width="20" valign="top"><img  id="MessageImage" src="images/error.gif"  hspace="10" vspace="5"></td><td class="Message" width="100%" style="padding-top: 8px;padding-bottom: 5px;" id="MessageText">' + val + '</td></tr>    </table></td></tr></table>');
          if ($(this).css('display') == 'none') {
                $(this).show('slow');
            }
            $('#' + $(this).attr('id') + ' .Message').animate({backgroundColor: '#FFAEAE'}).animate({backgroundColor: '#F4F4F4'});

            var $tabs = $('.ui-tabs').tabs();
            if (whichTab == '1') {
                $tabs.tabs('select', '#tab-survey-designers');
            } else {
                $tabs.tabs('select', '#tab-survey-options');
            }
        }
        jQuery.fn.successMessage = function (msg) {
          $(this).html('<table cellspacing="0" cellpadding="0" width="100%" id="MessageTable" ><tr><td ><table border="0" cellspacing="0" cellpadding="0"><tr><td class="Message" width="20" valign="top"><img  id="MessageImage" src="images/success.gif"  hspace="10" vspace="5"></td><td class="Message" width="100%" style="padding-top: 8px;padding-bottom: 5px;" id="MessageText">' + msg + '</td></tr>    </table></td></tr></table>');
              if ($(this).css('display') == 'none') {
                $(this).show('slow');
            }
           $('#' + $(this).attr('id') + ' .Message').animate({backgroundColor: '#99FF66'}).animate({backgroundColor: '#F4F4F4'});
         }
    });
    $(function () {
        $('.CancelButton').click(function () {
            if (confirm("{$lang.Addon_surveys_ConfirmCancel}")) {
                document.location = "index.php?Page=Addons&Addon=surveys"
            }
        });
        $('.SaveButton').click(function () {
            document.frmSurvey.action = 'index.php?Page=Addons&Addon=surveys&Action=Save&ajax=1';
            $(document.frmSurvey).submit();
        });
        $('.SaveExitButton').click(function () {
            document.frmSurvey.action = 'index.php?Page=Addons&Addon=surveys&Action=Save&exit=1&ajax=1';
            $(document.frmSurvey).submit();
        });
        $('#show-headertext-container').hide();
        $('#show-headerlogo-container').hide();
        $('#show-aftersubmit-message-container').hide();
        $('#show-aftersubmit-uri-container').hide();
        if ($('input[name="form[surveys_header]"]:checked').val() == 'headertext') {
            $('#show-headertext-container').show();
        } else {
            $('#show-headerlogo-container').show();
        }
        if ($('input[name="form[after_submit]"]:checked').val() == 'show_message') {
            $('#show-aftersubmit-message-container').show();
        } else {
            $('#show-aftersubmit-uri-container').show();
        }
        //$('#show-headerlogo-container').hide();
        //$('#show-aftersubmit-uri-container').hide();
        $('input[name="form[surveys_header]"]').click(function () {
            if ($('input[name="form[surveys_header]"]:checked').val() == 'headertext') {
                $('#show-headertext-container').show();
                $('#show-headerlogo-container').hide();
            } else if ($('input[name="form[surveys_header]"]:checked').val() == 'headerlogo') {
                $('#show-headerlogo-container').show();
                $('#show-headertext-container').hide();
            }
        });
        $('input[name="form[after_submit]"]').click(function () {
            if ($('input[name="form[after_submit]"]:checked').val() == 'show_message') {
                $('#show-aftersubmit-message-container').show();
                $('#show-aftersubmit-uri-container').hide();
            } else if ($('input[name="form[after_submit]"]:checked').val() == 'show_uri') {
                $('#show-aftersubmit-message-container').hide();
                $('#show-aftersubmit-uri-container').show();
            }
        });
    });
</script>
<link rel="stylesheet" type="text/css" href="addons/surveys/styles/edit.form.css" />
<link rel="stylesheet" href="addons/surveys/styles/surveys.css" type="text/css">
<style>
#show-headertext-container {
}
.form-control-textarea {
    height:150px !important;
}
    * {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
    }
    .SaveAddButton{
        font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;
    }
    .pageinfo p {
        margin-top: 5px;
        margin-bottom: 20px;
        margin-right:10px;
    }
    #tab-survey-designers .tab-survey-designers-panel ul li {
        font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;
    }
    .tabnav .ui-tabs-selected a {
        font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;
    }
    .tabnav a:link, .tabnav a:visited {
        font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size: 14px;
    }
    #canvas * {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
    }
   {* .surveyFormControl {
        //display: block;
        width: 100%;
        height: calc(1.5em + 0.75rem + 2px);
        font-size: 14px;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
    }
    .surveyFormControlFile {
        font-size: 14px;
        width: 100%;
        height: calc(1.5em + 0.75rem + 2px);
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border-radius: 0.25rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
    }
    .form-control-textarea {
        font-weight: 400;
        line-height: 1.5;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        height:150px !important;
    }*}
    .Panel td {
        font-size: 14px;
        font-family: "Roboto", Arial, Tahoma, sans-serif;
        vertical-align: top;
        //padding-top: 10px;
    }
    .space {
        height: 0px;
    }
    .tabnav {
        height: 36px;
    }
    .tabnav a:link, .tabnav a:visited {
        font-family: 'Roboto', Arial, Tahoma, sans-serif;
        font-size: 14px;
        padding: 10px 25px;
        background-color: #0D5085;
        color: #FFFFFF;
        background-image:none;

    }
    #tab-survey-designers .tab-survey-designers-panel ul li {
        background-color: #e5eef7;
    }
    .form-control-tabs {
        font-size: 1rem;
        font-weight: 400;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }
</style>
<div id="MainMessage">{$FlashMessages}</div>
<form id="form-canvas" enctype="multipart/form-data" name="frmSurvey" method="post">
    <input type="hidden" name="form[id]"{if $form.id}value="{$form.id}"{/if} />
    <table cellspacing="0" cellpadding="0" width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                {$Heading}
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    {$Intro}
                </p>
            </td>
        </tr>
        <tr>
            <td id="message">
                {$Message}
            </td>
        </tr>
        <tr>
            <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 0px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                <br />
                <div class="form-menu ui-tabs">
                    <ul class="tabnav">
                        <li><a id="tab1" href="#tab-survey-designers">{$lang.Addon_Surveys_tabSurveysDesigner}</a></li>
                        <li id="tab-tabnav-options"><a id="tab2" href="#tab-survey-options">{$lang.Addon_Surveys_tabSurveysSettings}</a></li>
                    </ul>
                    <div id="tab-survey-designers">
					    <div class="thirdPartyTable">
                            <div class="tab-survey-designers-panel">
                                <ul>  
                                    <li id="form-element-text" class="{type: 'text'}  form-control-tabs">{$lang.Addon_Surveys_Menu_Text}</li>
                                    <li id="form-element-textarea" class="{type: 'textarea'} form-control-tabs">{$lang.Addon_Surveys_Menu_TextArea}</li>
                                    <li id="form-element-radio" class="{type: 'radio'} form-control-tabs">{$lang.Addon_Surveys_Menu_Radio}</li>
                                    <li id="form-element-checkbox" class="{type: 'checkbox'} form-control-tabs">{$lang.Addon_Surveys_Menu_Checkbox}</li>
                                    <li id="form-element-select" class="{type: 'select'} form-control-tabs">{$lang.Addon_Surveys_Menu_Select}</li>
                                    <li id="form-element-select-country" class="{type: 'select-country'} form-control-tabs">{$lang.Addon_Surveys_Menu_SelectCountries}</li>
                                    <li id="form-element-file" class="{type: 'file'} form-control-tabs">{$lang.Addon_Surveys_Menu_File}</li>
                                    <li id="form-element-section-break" class="{type: 'section-break'} form-control-tabs">{$lang.Addon_Surveys_Menu_SectionBreak}</li>
                                </ul>
                            </div>
                            <div class="FloatLeft">
                                <div id="canvas">
                                    <h2><input id="form-title" class="form-control Field350 edit-in-place example-field" type="text" name="form[name]" value="{$form.name}" title="{$lang.Addon_Surveys_DefaultName}"  /></h2>
                                    <p ><input class="form-control Field350 edit-in-place example-field" type="text" name="form[description]" value="{$form.description}" title="{$lang.Addon_Surveys_DefaultDescription}"  /></p>
                                    <div class="hr"></div>
                                    <ul>
                                        {if $widgetTemplates}
                                            {foreach from=$widgetTemplates item=widgetTemplate}
                                                {$widgetTemplate}
                                            {/foreach}
                                        {/if}
                                    </ul>
                                    <div id="canvas-empty">
                                        {$lang.Addon_Surveys_canvasEmptyText}
                                    </div>
                                </div>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
				    </div>	
                    <div id="tab-survey-options">
                        <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="border:0px;">
                            <tr>
                                <td colspan="2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px; background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35); color:#1f2327;">
                                    %%LNG_Addon_Surveys_Heading_DisplayFeedbackOption%%
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                    
                                    {template="Required"}
                                    %%LNG_Addon_Surveys_DisplayHeaderTextLogo%%:
                                </td>
                                <td class="inputPadding">
                                    <div id="show-headertext-container-top" style="clear: both;">
                                        <label for="form-display-text" class="customRadio fontcolor">
                                            <input type="radio" id="form-display-text" name="form[surveys_header]" value="headertext" checked="checked" />
                                            {$lang.Addon_Surveys_DisplayHeaderText}:
                                            <span class="checkmarkRadio"></span>
                                        </label>
                                        <img class="tooltip" src="assets/images/infoIconBlue.svg" alt="{$lang.Addon_Surveys_TooltipTitleHeaderText}" title="{$lang.Addon_Surveys_TooltipHeaderDescription}" />
                                        <div id="show-headertext-container">
                                            <img src="images/nodejoin.gif"  />
                                            <input class="surveyFormControl form-control Field350 fontcolor" name="form[surveys_header_text]" type="text" value="{$form.surveys_header_text}" />
                                        </div>
                                    </div>
                                    <label for="form-display-logo" class="customRadio fontcolor">
                                        <input type="radio" id="form-display-logo" name="form[surveys_header]" value="headerlogo" {if $form.surveys_header == 'headerlogo'}checked="checked"{/if} />
                                        {$lang.Addon_Surveys_DisplayHeaderLogo}:
                                        <span class="checkmarkRadio"></span>
                                    </label>
                                    <img class="tooltip" src="assets/images/infoIconBlue.svg" alt="{$lang.Addon_Surveys_TooltipTitleHeaderLogo}" title="{$lang.Addon_Surveys_TooltipHeaderLogoDescription}" />								
                                    <div id="show-headerlogo-container">
                                        {if $form.surveys_header_logo != ""}
                                            <br />
                                            <img src="temp/surveys/{$form.id}/{$form.surveys_header_logo}" />
                                            <br />
                                        {else}
                                            <img src="images/nodejoin.gif"  />
                                        {/if}
                                        <input class="surveyFormControlFile" style="position:absolute" name="form[surveys_header_logo]" type="file" value="{$form.surveys_header_logo}"  />
                                        <input name="form[surveys_header_logo_filename]" type="hidden" value="{$form.surveys_header_logo}"  />
                                    </div>
                                    <div class="space"></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                    
                                    {template="Required"}
                                    %%LNG_Addon_Surveys_WhenSurveyCompleted%%
                                </td>
                                <td class="inputPadding">
                                    <div id="show-aftersubmit-message-container-top">		
                                        <label for="form-show-message" class="customRadio fontcolor">
                                            <input type="radio" id="form-show-message" name="form[after_submit]" value="show_message" checked="checked" />
                                            {$lang.Addon_Surveys_ShowMessageLabel}
                                            <span class="checkmarkRadio"></span>
                                        </label>
                                        <img class="tooltip" src="assets/images/infoIconBlue.svg" alt="{$lang.Addon_Surveys_TooltipTitleShowMessage}" title="{$lang.Addon_Surveys_TooltipDescriptionShowMessage}" />
                                        <div id="show-aftersubmit-message-container">
                                            <img src="images/nodejoin.gif" style="vertical-align: top;" />
                                            <textarea name="form[show_message]" class="Field350 form-control form-control-textarea fontcolor">{$form.show_message}</textarea>
                                        </div>
                                    </div>
                                    <label for="form-show-page" class="customRadio fontcolor">
                                        <input type="radio" id="form-show-page" name="form[after_submit]" value="show_uri" {if $form.after_submit == 'show_uri'}checked="checked"{/if} />
                                        {$lang.Addon_Surveys_ShowPageLabel}
                                        <span class="checkmarkRadio"></span>
                                    </label>
                                    <img class="tooltip" src="assets/images/infoIconBlue.svg" alt="{$lang.Addon_Surveys_TooltipTitleShowUri}" title="{$lang.Addon_Surveys_TooltipDescriptionShowUri}" />
                                    <div id="show-aftersubmit-uri-container">
                                        <img src="images/nodejoin.gif" />
                                        <input class="surveyFormControl form-control Field350 fontcolor" name="form[show_uri]" type="text" value="{$form.show_uri}"  />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" style="padding-top:20px" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                    <img src="images/blank.gif" width="0" height="1" />
                                    {template="Required"}
                                    %%LNG_Addon_Surveys_EmailFeedbackLabel%%?
                                </td>
                                <td class="inputPadding" style="padding-bottom: 20px;">
                                    <label for="email-feedback" class="customCheckBox fontcolor">
                                        <input type="checkbox" id="email-feedback" name="form[email_feedback]" value="1" {if $form.email_feedback == 1}checked="checked"{/if} />
                                        {$lang.Addon_Surveys_EmailFeedbackConfirm}
                                        <span class="checkmark"></span>
                                    </label>
                                    <img class="tooltip" src="assets/images/infoIconBlue.svg" alt="{$lang.Addon_Surveys_TooltipTitleEmailFeedback}" title="{$lang.Addon_Surveys_TooltipDescriptionEmailFeedback}" />
                                    <div id="email-feedback-to-container">
                                        <img src="images/nodejoin.gif" />
                                        <input class="surveyFormControl form-control Field350 fontcolor" id="email-feedback-to" name="form[email]" type="text" value="{$form.email}"/>
                                    </div>				
                                    <div class="space"></div>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px; background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35); color:#1f2327;">
                                     %%LNG_Addon_Surveys_Heading_AdvancedOption%%
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" style="padding-top:20px" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                    <img src="images/blank.gif" width="0" height="1" />
                                    {template="Required"}
                                    <label for="form-show-message">{$lang.Addon_Surveys_ErrorMessageLabel}:</label>		
                                </td>
                                <td class="inputPadding">
                                    <textarea name="form[error_message]"  class="Field350 form-control-textarea form-control fontcolor">{$form.error_message}</textarea>
                                    <img class="tooltip" src="assets/images/infoIconBlue.svg" alt="{$lang.Addon_Surveys_TooltipTitleErrorMessage}" title="{$lang.Addon_Surveys_TooltipDescriptionErrorMessage}" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                    <img src="images/blank.gif" width="0" height="1" />
                                    {template="Required"}
                                    <label for="form-show-message">{$lang.Addon_Surveys_SubmitButtonTextLabel}:</label>			
                                </td>
                                <td class="inputPadding">
                                    <input type="text" name="form[submit_button_text]" class="form-control Field350 lastBtn surveyFormControl fontcolor" value="{$form.submit_button_text}" />
                                    <img class="tooltip" src="assets/images/infoIconBlue.svg" alt="{$lang.Addon_Surveys_TooltipTitleSubmitButtonText}" title="{$lang.Addon_Surveys_TooltipDescriptionSubmitButtonText}" />
                                </td>
                            </tr>
                          </div>
                        </table>
                    </div>
            </td>
        </tr>
        <tr>
            
            <td style="padding-top: 15px;" class="buttonsAlign">
                <input type="button" value="%%LNG_Addon_surveys_ButtonSaveAndContinue%%" class="SaveButton SaveAddButton btn save-btn SubmitButton" value="1">
                <input type="button" value="%%LNG_Addon_surveys_ButtonSaveAndExit%%" class="SaveExitButton FormButton_wide btn save-btn" value="1">
                <input type="button" value="%%LNG_Addon_surveys_ButtonCancel%%" class="nextCancelButton CancelButton btn cancel-btn">
                <br />
            </td>
        </tr>
    </table>
</form>
<div id="__template__form-element-drag-helper" style="display: none;">
    <div class="form-element-drag-helper" style="width: 220px; height: 70px;">
        #{img}
        <p>#{text}</p>
    </div>
</div>
<div id="__template__form-element-sort-helper" style="display: none;">
    <div class="form-element-sort-helper" style="width: 700px; height: 70px;"></div>
</div>
<style>
.fontcolor{
    color: #000 !important;
}
.ui-state-default a {
    font-family: 'Roboto', Arial, Tahoma, sans-serif !important;
    font-size: 14px !important;
    background-color: #cbd4d7 !important;
    color: #000000 !important;
    background-image: none !important;
    font-weight: 600 !important;
}
.ui-state-active a {
    background-color: #0D5085 !important;
    background-image: none !important;
    color: #FFFFFF !important;
}
.tooltip {
    display: inline !important;
    opacity: unset !important;
    margin-left: 5px !important;
    margin-top: 2px !important;
}
*{
    box-sizing:border-box;
    
}
.ContentContainer {
    width:100% !important;
}
.multiselectTd{
    display:flex;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
.parentTableDiv {
    width:100%;
}
.submitTableBtn{
    width:180px;
}
.Field250{
    width:410px;
    margin-right:0px;
}
.Field350 {
    width:410px !important;
    padding-right:0px;
}
.form-control {
    display:inline;
    margin-bottom:5px;
}
.BodyContainer{
        width:98.5%;
    }
    .inputPadding{
    padding-top: 1.35rem; 
}
.width20Percent{
    color: #000 !important;
    width:17em !important;
    font-size:14px !important;
    padding-top:20px !important;
}
.tab-survey-designers-panel {
    float: left;
    width: 235px;
    margin-right: 4px;
    left: 0 !important;
}
.buttonsAlign {
    padding-left:245px;
    padding-top:20px !important;
}
#tab-survey-designers {
    width: auto;
}
.Panel {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 0px;
}
.form-control-textarea {
    margin-bottom:0px;
}
@media screen and (max-width:1024px){
    .form-control-textarea {
        margin-bottom:0px;
    }
    .FormButton{
        margin-top:20px; 
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:17em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:98%;
    }
    .parentTableDiv{
        width:925px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:920px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        //flex-direction: column !important;
        //padding:10px 0px;
        //align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }.customRadio {
        padding-bottom:10px !important;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .surveyToolTip{
        margin:20px -125px;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .buttonsAlign {
        padding-left: 245px;
        padding-top: 20px !important;
    }
}
@media screen and (max-width:823px){
  
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:97%;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:10px !important;
        width:auto;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .surveyToolTip{
        margin:10px ​90px;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .buttonsAlign {
        padding-left: 245px;
        padding-top: 20px !important;
    }
}
@media screen and (max-width:768px){
    #canvas {
        width:440px;
    }
    .FormButton{
        margin-top:20px; 
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:17em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:97%;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:680px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:10px !important;
        width:auto;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .surveyToolTip{
        margin:10px ​90px;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .buttonsAlign {
        padding-left: 245px;
        padding-top: 20px !important;
    }
}
@media screen and (max-width:568px){
    
    .FormButton{
        
        margin-top:20px; 
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
        display: inline-flex;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:94%;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:3px;
        width:210px;
        left:-3px;
    }
    .customCheckBox {
        width:210px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .surveyToolTip{
        margin:0px ​126px;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .buttonsAlign {
        padding-left: 0px;
        padding-top: 20px !important;
    }
    .tab-survey-designers-panel {
        float: left;
        width: 297px;
        margin-right: 4px;
        left: 0 !important;
    }
    #canvas {
        width: 285px;
        margin-top: 10px;
    }
}
@media screen and (max-width:414px){
   
    .form-menu {
        width: 340px;
        margin-right: 0px;
    }
    .FormButton{
        margin-top:20px; 
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:10em !important;
        font-size:14px !important;
        display: inline-flex;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:94%;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:10px;
        width:210px;
        left:-3px;
    }
    .customCheckBox {
        width:210px;
        margin-top:0px !important;
        padding-bottom: 10px !important;
    }
    .surveyToolTip{
        margin:0px ​126px;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .buttonsAlign {
        padding-left: 0px;
        padding-top: 20px !important;
    }
    .tab-survey-designers-panel {
        float: left;
        width: 297px;
        margin-right: 4px;
        left: 0 !important;
    }
    #canvas {
        width: 285px;
        margin-top: 10px;
    }
}
@media screen and (max-width:411px){
   
    .FormButton{
          
        margin-top:20px; 
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
        font-size:14px !important;
        display: inline-flex;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:94%;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:10px;
        width:180px;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 10px !important;
    }
    .surveyToolTip{
        margin:5px ​85px;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .buttonsAlign {
        padding-left: 105px;
        padding-top: 20px !important;
    }
    .buttonsAlign > input {
        width:125px;
        margin-bottom:5px;
    }
    .tab-survey-designers-panel {
        float: left;
        width: 330px;
        margin-right: 4px;
        left: 0 !important;
    }
    #canvas {
        width: 320px;
        margin-top: 10px;
    }
    .form-menu {
        width:340px;
        margin-right:0px;
    }
}
@media screen and (max-width:375px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
        display: inline-flex;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:94%;
    }
    .parentTableDiv{
        width:345px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:10px;
        width:180px;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 10px !important;
    }
    .surveyToolTip{
        margin:5px ​90px;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .buttonsAlign {
        padding-left: 0px;
        padding-top: 20px !important;
    }
    .tab-survey-designers-panel {
        float: left;
        width: 297px;
        margin-right: 4px;
        left: 0 !important;
    }
    #canvas {
        width: 285px;
        margin-top: 10px;
    }
    
    .form-menu {
        width: 340px;
        margin-right: 0px;
    }
}
@media screen and (max-width:360px){
    .inputPadding > .form-control-textarea {
        width:150px !important;
    }
    .lastBtn {
        width:150px !important;
    }
    .form-menu {
        width: 340px;
        margin-right: 0px;
    }
    .nextCancelButton {
        margin-top:0px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:7em !important;
        font-size:14px !important;
        display: inline-flex;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:130px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:94%;
    }
    .parentTableDiv{
        width:335px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:10px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 10px !important;
    }
    .surveyToolTip{
        margin:18px 50px;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .form-menu {
        width: 298px;
        margin-right: 0px;
    }
    .buttonsAlign {
        padding-left: 90px;
        padding-top: 20px !important;
        display: flex;
        flex-direction: column;
    }
    .buttonsAlign > input {
        width:125px;
        margin-bottom:5px;
    }
    .tab-survey-designers-panel {
        float: left;
        width: 290px;
        margin-right: 4px;
        left: 0 !important;
    }
    #canvas {
        width: 280px;
        margin-top: 10px;
    }
    .tabnav {
        padding-left:8px;
    }
    .tabnav a:link, .tabnav a:visited {
        padding: 10px 7px;
    }
}
@media screen and (max-width:320px){
    .nextCancelButton {
        margin-top:0px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:6em !important;
        font-size:14px !important;
        display: inline-flex;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:125px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:94%;
    }
    .parentTableDiv{
        width:285px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:255px !important;
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .customRadio {
        padding-bottom:3px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:135px;
        margin-top:0px !important;
        padding-bottom: 3px !important;
    }
    .surveyToolTip{
        margin:18px 17px;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .form-menu {
        width: 265px;
        margin-right: 0px;
    }
    .buttonsAlign {
        padding-left: 75px;
        padding-top: 20px !important;
        display: flex;
        flex-direction: column;
    }
    .buttonsAlign > input {
        width:125px;
        margin-bottom:5px;
    }
    .tab-survey-designers-panel {
        float: left;
        width: 260px;
        margin-right: 4px;
        left: 0 !important;
    }
    #canvas {
        width: 250px;
        margin-top: 10px;
    }
    .tabnav {
        padding-left:8px;
    }
    .tabnav a:link, .tabnav a:visited {
        padding: 10px 7px;
    }
}
.form-menu {
	margin-right : 0px !important; 
}
</style>