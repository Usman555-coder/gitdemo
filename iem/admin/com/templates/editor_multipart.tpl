<style>
    #dynamicContentTextButton, #dynamicContentHtmlButton { white-space:nowrap }
    #dynamicContentText, #dynamicContentHtml { display:none; width:130px }
    #dynamicContentText img, #dynamicContentHtml img { border:0; padding:0 5px 0 0; margin:0; vertical-align:middle }
    #dynamicContentText .ItemContainer, #dynamicContentHtml .ItemContainer {width:210px;}
</style>

<script>
    function ImportCheck(importtype) {
        if (importtype.toLowerCase() == 'html') {
            var checker = document.getElementById('newsletterurl');
        } else {
            var checker = document.getElementById('textnewsletterurl');
        }

        if (checker.value.length <= 7) {
            alert('%%LNG_Editor_ChooseWebsiteToImport%%');
            checker.focus();
            return false;
        }
        return true;
    }


    $(function () {
        if (%%GLOBAL_UsingWYSIWYG%% == 0) Using= false;
                Application.Ui.Menu.PopDown('button#dynamicContentHtmlButton', {topMarginPixel: -3});
        Application.Ui.Menu.PopDown('button#dynamicContentTextButton', {topMarginPixel: -3});
    });
</script>

<style>
.customRadio {
    width:100% !important;
}
</style>
<tr class="whiteBackground">
    <td colspan="2">
        <table id="tabContents_HTMLEditor" width="100%">
            <tr class="tinyEditorTr whiteBackground">
                <td valign="top" class="FieldLabel width20Percent" style="width:20%;">
                    {template="Required"}
                    %%LNG_HTMLContent%%:
                </td>
                <td valign="top">
                    <table width="%%GLOBAL_EditorWidth%%" border="0" class="WISIWYG_Editor_Choices">
                        <tr class="whiteBackground">
                            <td colspan="2">
                                <label for="hct1" class="customRadio Field"><input onClick="switchContentSource('html', 1)" id="hct1" name="hct" type="radio" checked><span class="checkmarkRadio"></span>%%LNG_HTML_Using_Editor%%</label>
                            </td>
                        </tr>
                        <tr class="whiteBackground">
                            <td colspan="2">
                                <label for="hct2" class="customRadio Field"><input onClick="switchContentSource('html', 2)" id="hct2" name="hct" type="radio"><span class="checkmarkRadio"></span>%%LNG_Editor_Upload_File%%</label>
                            </td>
                        </tr>
                        <tr id="htmlNLFile" style="display:none">
                            <td></td>
                            <td class="isNodeImg">
                                <img src="images/nodejoin.gif" alt="." align="top" />
                                <iframe class="iframeWidthFix" src="%%GLOBAL_APPLICATION_URL%%/admin/functions/remote.php?DisplayFileUpload&ImportType=HTML" frameborder="0" height="30" width="326" id="newsletterfile"></iframe>
                            </td>
                        </tr>
                        <tr class="whiteBackground">
                            <td colspan="2">
                                <label for="hct3" class="customRadio Field"><input onClick="switchContentSource('html', 3)" id="hct3" name="hct" type="radio"><span class="checkmarkRadio"></span>%%LNG_Editor_Import_Website%%</label>
                            </td>
                        </tr>
                        <tr id="htmlNLImport" style="display:none">
                            <td></td>
                            <td class="isNodeImg">
                                <img src="images/nodejoin.gif" alt="." />
                                <input type="text" name="newsletterurl" id="newsletterurl" value="http://" class="Field form-control widthFix" style="width:200px;display:inline;">
                                <input class="FormButton Field goButton" type="button" name="upload" value="%%LNG_ImportWebsite%%" onclick="ImportWebsite(this, '%%LNG_Editor_Import_Website_Wait%%', 'html', '%%LNG_Editor_ImportButton%%', '%%LNG_Editor_ProblemImportingWebsite%%')" class="Field" style="width:60px;height:35px;background-color:#f5f5f5;">
                            </td>
                        </tr>
                    </table>
                    <div class="tinyEditorDiv">
                        <div id="htmlEditor" style="padding-top: 5px;">
                            %%GLOBAL_HTMLContent%%
                        </div>
                    </div>
                </td>
            </tr>
            <tr id="htmlCF">
                <td colspan="2">
                    <button id="dynamicContentHtmlButton" class="SmallButton marginButtonFix form-control" style="width:150px;">%%LNG_ShowAvalableDynamicContent%%&nbsp;&nbsp;<img src="images/arrow_blue.gif" /></button>
                    <div id="dynamicContentHtml" class="DropDownMenu DropShadow">
                        <ul>

                            <li>
                                <a href="#" title="%%LNG_ShowCustomFields%%..." onclick="javascript: ShowCustomFields('html', 'myDevEditControl', '%%PAGE%%');
                                        return false;">
                                    <img src="images/mce_customfields.gif" alt="icon" />%%LNG_ShowCustomFields%%...</a>
                            </li>
                            <li>
                                <a href="#" title="%%LNG_InsertUnsubscribeLink%%" onclick="javascript: InsertUnsubscribeLink('html');
                                        return false;">
                                    <img src="images/mce_unsubscribelink.gif" alt="icon" />%%LNG_InsertUnsubscribeLink%%</a>
                            </li>
                            %%GLOBAL_tagButtonHtml%%
                            %%GLOBAL_surveyButtonHtml%%
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
        <table id="tabContents_TextEditor" width="100%" >
            <tr class="whiteBackground tinyEditorTr" style="padding-top:15px;">
                <td valign="top" class="FieldLabel width20Percent"  style="width:20%;">
                    {template="Required"}
                    %%LNG_TextContent%%:
                </td>
                <td valign="top">
                    <table width="100%" border="0" class="WISIWYG_Editor_Choices">
                        <tr class="whiteBackground">
                            <td colspan="2">
                                <label for="tct1" class="customRadio Field"><input onClick="switchContentSource('text', 1)" id="tct1" name="tct" type="radio" checked><span class="checkmarkRadio"></span>%%LNG_Text_Type%%</label>
                                
                            </td>
                        </tr>
                        <tr class="whiteBackground">
                            <td colspan="2">
                            <label for="tct2" class="customRadio Field">
                                <input onClick="switchContentSource('text', 2)" id="tct2" name="tct" type="radio">
                                <span class="checkmarkRadio"></span>%%LNG_Editor_Upload_File%%
                                </label>
                            </td>
                        </tr>
                        <tr id="textNLFile" style="display:none">
                            <td></td>
                            <td class="isNodeImg">
                                <img src="images/nodejoin.gif" alt="." align="top" />
                                <iframe class="iframeWidthFix" src="%%GLOBAL_APPLICATION_URL%%/admin/functions/remote.php?DisplayFileUpload&ImportType=Text" frameborder="0" height="30" width="259" id="newsletterfile"></iframe>
                            </td>
                        </tr>
                        <tr class="whiteBackground">
                            <td colspan="2">
                                <label for="tct3" class="customRadio Field"><input onClick="switchContentSource('text', 3)" id="tct3" name="tct" type="radio">%%LNG_Editor_Import_Website%%
                                <span class="checkmarkRadio"></span>
                                </label>
                            </td>
                        </tr>
                        <tr id="textNLImport" style="display:none">
                            <td></td>
                            <td class="isNodeImg">
                                <img src="images/nodejoin.gif" alt="." />
                                <input type="text" name="textnewsletterurl" id="textnewsletterurl" value="http://" class="Field form-control widthFix" style="width:200px;display:inline;">
                                <input class="FormButton Field goButton" type="button" name="upload" value="%%LNG_ImportWebsite%%" onclick="ImportWebsite(this, '%%LNG_Editor_Import_Website_Wait%%', 'text');" class="Field" style="width:60px;height:35px;background-color:#f5f5f5;">
                            </td>
                        </tr>
                    </table>
                    <div id="textEditor" style="padding-top: 5px;">
                        <div class="ContentsTextEditorP">
                        <textarea name="TextContent" id="TextContent" rows="10" cols="60" class="ContentsTextEditor">%%GLOBAL_TextContent%%</textarea>
                        </div>
                        <div class="aside">%%LNG_TextWidthLimit_Explaination%%</div>
                    </div>
                </td>
            </tr>
            <tr id="textCF">
                <td colspan="2">
                    <button id="dynamicContentTextButton" class="SmallButton marginButtonFix form-control" style="width:150px;">%%LNG_ShowAvalableDynamicContent%%<img src="images/arrow_blue.gif" /></button>
                    <div id="dynamicContentText" class="DropDownMenu DropShadow">
                        <ul>
                            <li>
                                <a href="#" title="%%LNG_ShowCustomFields%%..." onclick="javascript: ShowCustomFields('TextContent', null, '%%PAGE%%');
                                        return false;">
                                    <img src="images/lists_view.gif" alt="icon" />%%LNG_ShowCustomFields%%...</a>
                            </li>
                            <li>
                                <a href="#" title="%%LNG_InsertUnsubscribeLink%%" onclick="javascript:InsertUnsubscribeLink('TextContent');
                                        return false;">
                                    <img src="images/lists_view.gif" alt="icon" />%%LNG_InsertUnsubscribeLink%%</a>
                            </li>
                            %%GLOBAL_tagButtonText%%
                            %%GLOBAL_surveyButtonText%%
                            <li>
                                <a href="#" title="%%LNG_GetTextContent%%"  onClick="grabTextContent('TextContent', 'myDevEditControl');">
                                    <img src="images/lists_view.gif" alt="icon" />%%LNG_GetTextContent%%</a>
                            </li>
                        </ul>
                    </div>

                </td>
            </tr>
        </table>
    </td>
</tr>
<style>
@media screen and (max-width:540px){
    .iframeWidthFix{
        width:259px!important;

    }
}
</style>