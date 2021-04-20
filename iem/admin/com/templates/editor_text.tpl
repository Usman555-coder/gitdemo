<script>
    function ImportCheck() {
        var checker = document.getElementById('textnewsletterurl');
        if (checker.value.length <= 7) {
            alert('%%LNG_Editor_ChooseWebsiteToImport%%');
            checker.focus();
            return false;
        }
        return true;
    }
</script>

<tr>
    <td valign="top" width="150" class="FieldLabel">
        {template="Required"}
        %%LNG_TextContent%%:
    </td>
    <td valign="top">
        <table width="100%" border="0" class="WISIWYG_Editor_Choices">
            <tr>
                <td width="20">
                    <input onClick="switchContentSource('text', 1)" id="tct1" name="tct" type="radio" checked>
                </td>
                <td>
                    <label for="tct1">%%LNG_Text_Type%%</label>
                </td>
            </tr>
            <tr>
                <td width="20">
                    <input onClick="switchContentSource('text', 2)" id="tct2" name="tct" type="radio">
                </td>
                <td>
                    <label for="tct2">%%LNG_Editor_Upload_File%%</label>
                </td>
            </tr>
            <tr id="textNLFile" style="display:none">
                <td></td>
                <td>
                    <img src="images/nodejoin.gif" alt="." align="top" />
                    <iframe src="%%GLOBAL_APPLICATION_URL%%/admin/functions/remote.php?DisplayFileUpload&ImportType=Text" frameborder="0" height="30" id="newsletterfile"></iframe>
                </td>
            </tr>
            <tr>
                <td width="20">
                    <input onClick="switchContentSource('text', 3)" id="tct3" name="tct" type="radio">
                </td>
                <td>
                    <label for="tct3">%%LNG_Editor_Import_Website%%</label>
                </td>
            </tr>
            <tr id="textNLImport" style="display:none">
                <td></td>
                <td>
                    <img src="images/nodejoin.gif" alt="." />
                    <input type="text" name="textnewsletterurl" id="textnewsletterurl" value="http://" class="Field" style="width:200px">
                    <input class="FormButton" type="button" name="upload" value="%%LNG_ImportWebsite%%" onclick="ImportWebsite(this, '%%LNG_Editor_Import_Website_Wait%%', 'text');" class="Field" style="width:60px">
                </td>
            </tr>
        </table>
        <div id="textEditor">
            <textarea name="TextContent" id="TextContent" rows="10" cols="60" class="ContentsTextEditor">%%GLOBAL_TextContent%%</textarea>
            <div class="aside">%%LNG_TextWidthLimit_Explaination%%</div>
        </div>
    </td>
</tr>
<tr id="textCF">
    <td>
        &nbsp;
    </td>
    <td>
        <input type="button" onclick="javascript: ShowCustomFields('TextContent', null, '%%PAGE%%');
                return false;" value="%%LNG_ShowCustomFields%%..." class="FormButton btnsstylse btn" style="width: 150px;" />
        <input type="button" onclick="javascript: InsertUnsubscribeLink('TextContent');
                return false;" value="%%LNG_InsertUnsubscribeLink%%" class="FormButton btnsstylse btn" style="width: 150px;" />
        <input type="button" onclick="javascript: InsertSurveyLink('TextContent');
                return false;" value="%%LNG_InsertSurveyLink%%" class="FormButton btnsstylse btn" style="width: 150px;" />
    </td>
</tr>
<style>
#textEditor {
    margin-top: 15px;
}
.FormButton.btnsstylse.btn {
    background-color: #0d5085;
    color: #ffffff;
    border-color: #0d5085;
    font-size: 13px !important;
    box-shadow: 0 2px 5px rgb(0 0 0 / 16%), 0 2px 10px rgb(0 0 0 / 12%);
    max-width: 160px !important;
    white-space: nowrap;
    width: fit-content !important;
}
input.Field300.buttonWidthFix.newButtonGo{
    background-color: #0d5085;
    color: #ffffff;
    border-color: #0d5085;
    font-size: 13px !important;
    box-shadow: 0 2px 5px rgb(0 0 0 / 16%), 0 2px 10px rgb(0 0 0 / 12%);
    white-space: nowrap;
    width: fit-content !important;
}
</style>