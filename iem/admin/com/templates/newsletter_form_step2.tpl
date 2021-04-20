<script src="includes/js/jquery/plugins/jquery.plugin.js"></script>
<script src="includes/js/jquery/plugins/jquery.tableSelector.js"></script>
<script src="includes/js/imodal/imodal.js"></script>
<script src="includes/js/jquery/plugins/jquery.window.js"></script>
<script src="includes/js/jquery/plugins/jquery.window-extensions.js"></script>

<link rel="stylesheet" href="includes/js/imodal/imodal.css" type="text/css" media="screen" />


<script>

    var newsletterData = '';

    $(function () {
        $(document.frmEditNewsletter).submit(function () {
            if (this.subject.value == '') {
                alert("%%LNG_PleaseEnterNewsletterSubject%%");
                this.subject.focus();
                return false;
            }
            syncHTMLEditor();
            Application.Modules.SpamCheck.form = document.frmEditNewsletter;
            if ('%%GLOBAL_ForceSpamCheck%%' == '1' && !Application.Modules.SpamCheck.check_passed) {
                tb_show('%%LNG_Spam_Guide_Heading%%', 'index.php?Page=Newsletters&Action=CheckSpamDisplay&Force=true&keepThis=true&TB_iframe=tue&height=480&width=600', '');
                return false;
            }
            return true
        });

        $('.CancelButton').click(function () {
            if (confirm("%%GLOBAL_CancelButton%%")) {
                document.location = "index.php?Page=Newsletters"
            }
        });
        $('.SaveButton').click(function () {
            document.frmEditNewsletter.action = 'index.php?Page=Newsletters&Action=%%GLOBAL_SaveAction%%';
            $(document.frmEditNewsletter).submit();
        });
        $('.SaveExitButton').click(function () {
            document.frmEditNewsletter.action = 'index.php?Page=Newsletters&Action=%%GLOBAL_Action%%';
        });

        $(document.frmEditNewsletter.cmdCheckSpam).click(function () {
            syncHTMLEditor();
            tb_show('%%LNG_Spam_Guide_Heading%%', 'index.php?Page=Newsletters&Action=CheckSpamDisplay&keepThis=true&TB_iframe=tue&height=480&width=600', '');
            return true;
        });

        $(document.frmEditNewsletter.cmdViewCompatibility).click(function () {
            var f = document.frmEditNewsletter;
            f.target = "_blank";

            prevAction = f.action;
            f.action = "index.php?Page=Newsletters&Action=ViewCompatibility&ShowBroken=1";
            f.submit();

            f.target = "";
            f.action = prevAction;
        });

        $(document.frmEditNewsletter.cmdSendPreview).click(function () {
            if (document.frmEditNewsletter.PreviewEmail.value == "") {
                alert("%%LNG_EnterPreviewEmail%%");
                document.frmEditNewsletter.PreviewEmail.focus();
                return false;
            }

            tb_show('%%LNG_SendPreview%%', 'index.php?Page=Newsletters&Action=SendPreviewDisplay&keepThis=true&TB_iframe=tue&height=250&width=550', '');
            return true;
        });

    });

    // Create an instance of the multiSelector class, pass it the output target and the max number of files
    {if $ShowAttach === true}
    $(function () {
        var multi_selector = new MultiSelector(document.getElementById('files_list'), 5);
        multi_selector.addElement(document.getElementById('fileUpload'));
    });
    {/if}

    function Upload() {
        if (document.frmEditNewsletter.newsletterfile.value == "") {
            alert('%%LNG_NewsletterFileEmptyAlert%%');
            document.frmEditNewsletter.newsletterfile.focus();
            return false;
        }
        $('.SaveButton').click();
    }

    function Import() {
        if (document.frmEditNewsletter.newsletterurl.value == "" || document.frmEditNewsletter.newsletterurl.value == 'http://') {
            alert('%%LNG_NewsletterURLEmptyAlert%%');
            document.frmEditNewsletter.newsletterurl.focus();
            return false;
        }
        $('.SaveButton').click();
    }

    function closePopup() {
        tb_remove();
    }

    function getMessage() {
        var message = {};
        if (document.frmEditNewsletter.myDevEditControl_html)
            message['myDevEditControl_html'] = document.frmEditNewsletter.myDevEditControl_html.value;
        if (document.frmEditNewsletter.TextContent)
            message['TextContent'] = document.frmEditNewsletter.TextContent.value;
        return message;
    }

    function getSendPreviewParam() {
        var f = document.frmEditNewsletter;
        var html = f.myDevEditControl_html ? f.myDevEditControl_html.value : '';
        // if the WYSIWYG editor is not disabled, get the very latest HTML
        if (Application.WYSIWYGEditor.isWysiwygEditorActive()) {
            html = Application.WYSIWYGEditor.getContent();
        }
        return {'subject': f.subject.value,
            'myDevEditControl_html': html,
            'TextContent': f.TextContent ? f.TextContent.value : '',
            'PreviewEmail': f.PreviewEmail.value,
            'FromPreviewEmail': f.FromPreviewEmail.value,
            'id': %%GLOBAL_PreviewID%%
    };
    }

    function syncHTMLEditor() {
        if (Application.WYSIWYGEditor.isWysiwygEditorActive()) {
            if (document.frmEditNewsletter.myDevEditControl_html) {
                document.frmEditNewsletter.myDevEditControl_html.value = Application.WYSIWYGEditor.getContent();
            }
        }
    }

</script>
<form name="frmEditNewsletter" method="post" action="index.php?Page=Newsletters&Action=%%GLOBAL_Action%%" enctype="multipart/form-data">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr class="whiteBackground">
            <td class="Heading1 col-sm-4 Heading1New">
                %%GLOBAL_Heading%%
            </td>
        </tr>
        <tr class="whiteBackground">
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%GLOBAL_Intro%%
                </p>
            </td>
        </tr>
        <tr class="whiteBackground">
            <td>
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style="margin-top:10px ; border-bottom:0px">
                    <tr class="whiteBackground">
                        <td colspan="2" class="Heading2">
                            %%LNG_Newsletter_Details%%
                        </td>
                    </tr>
                    <tr style="height:15px;"></tr>
                    <tr class="whiteBackground">
                        <td class="FieldLabel width20Percent fixScreenSize" style="width:20%;">
                            {template="Required"}
                            %%LNG_NewsletterSubject%%:
                        </td>
                        <td class="tdValue">
                            <input type="text" name="subject" value="%%GLOBAL_Subject%%" class="form-control Field250" style="width:300px;float:left;">&nbsp;%%LNG_HLP_NewsletterSubject%%
                            <br/>%%LNG_Subject_Guide_Link%%
                        </td>
                    </tr>

                    %%GLOBAL_Editor%%

                    <tr>
                        <td colspan="2" class="EmptyRow">
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td colspan="2" class="Heading2">
                           %%LNG_Attachments%%
                        </td>
                    </tr>

                    {if $ShowAttach === true}
                        <tr>
                            <tr class="whiteBackground" >
                            <td valign="top" class="FieldLabel" style="padding-top:20px;">
                                {template="Not_Required"}
                                %%LNG_Attachments%%:&nbsp;
                            </td>
                            <td>
                                <table border="0" cellspacing="0" cellpadding="0" id="AttachmentsTable">
                                    <tr>
                                        <td class="flexibleWidth">
                                            <input type="file" name="attachments[]" value="" class="FormButton" id="fileUpload" style="width: 186px;margin-top:-7px;">&nbsp;%%LNG_HLP_Attachments%%
                                            <div id="files_list" style="margin-top: 5px"></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr class="whiteBackground">
                            <td colspan="2" align="left">
                                %%GLOBAL_AttachmentsList%%
                            </td>
                        </tr>
                    {else}
                        <tr class="whiteBackground">			
                            <td class="FieldLabel">
                            </td>
                            <td colspan="2">
                                <p>
                                    %%GLOBAL_AttachmentsMsg%%
                                </p>
                            </td>
                        </tr>
                    {/if}
                    <tr class="whiteBackground">
                        <td colspan="2" class="Heading2">
                            %%LNG_EmailValidation%%
                        </td>
                    </tr>
                    <tr style="height:15px;"></tr>
                    <tr class="whiteBackground">
                        <td class="FieldLabel width20Percent" style="padding-top: 10px;">
                            {template="Not_Required"}
                            %%LNG_SpamKeywordsCheck%%:
                        </td>
                        <td>
                            <input type="button" name="cmdCheckSpam"   class="Field300 buttonWidthFix newButtonGo" value="%%LNG_SpamKeywordsCheck_Button%%"/>
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td class="FieldLabel width20Percent" style="padding-top: 10px;">
                            {template="Not_Required"}
                            %%LNG_EmailClientCompatibility%%:
                        </td>
                        <td>
                            <input type="button" name="cmdViewCompatibility" class="Field300 buttonWidthFix newButtonGo" value="%%LNG_EmailClientCompatibility_Button%%"/>
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td colspan="2" class="EmptyRow">
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td colspan="2" class="Heading2">
                            %%LNG_MiscellaneousOptions%%
                        </td>
                    </tr>
                    <tr style="height:15px;"></tr>
                    <tr class="whiteBackground">
                        <td valign="top" class="FieldLabel" style="padding-top: 15px;">
                            {template="Not_Required"}
                            %%LNG_NewsletterIsActive%%:
                        </td>
                        <td class="miscellenousLable" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ;  color: #000;">
                            <label for="active" class="customCheckBox">
                                <input type="checkbox" name="active" id="active" value="1"%%GLOBAL_IsActive%%>
                                %%LNG_NewsletterIsActiveExplain%%
                                <span class="checkmark"></span>
                            </label>
                            %%LNG_HLP_NewsletterIsActive%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td valign="top" class="FieldLabel" style="padding-top: 15px;">
                            {template="Not_Required"}
                            %%LNG_NewsletterArchive%%:
                        </td>
                        <td class="miscellenousLable" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ;  color: #000;">
                            <label for="archive" class="customCheckBox">
                                <input type="checkbox" name="archive" id="archive" value="1"%%GLOBAL_Archive%%>
                                %%LNG_NewsletterArchiveExplain%%
                                <span class="checkmark"></span>
                            </label>
                            %%LNG_HLP_NewsletterArchive%%
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="EmptyRow">
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td colspan="2" class="Heading2">
                            %%LNG_SendPreview%%
                        </td>
                    </tr>
                    <tr style="height:15px;"></tr>
                    <tr class="whiteBackground">
                        <td valign="top" class="FieldLabel" style="padding-top: 15px;">
                            {template="Not_Required"}
                            %%LNG_SendPreviewFrom%%:
                        </td>
                        <td>
                            <input type="text" name="FromPreviewEmail" value="%%GLOBAL_FromPreviewEmail%%" class="Field form-control inputBoxWidth" style="width:305px">
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td valign="top" class="FieldLabel" style="padding-top: 15px;">
                            {template="Not_Required"}
                            %%LNG_SendPreviewTo%%:
                        </td>
                        <td class="flexibleWidth">
                            <input type="text" name="PreviewEmail" value="" class="Field form-control inputBoxWidth" style="width:305px">
                            <input class="Field300 buttonWidthFix newButtonGo" type="button" name="cmdSendPreview" value="%%LNG_SendPreview%%" class="Field"/>&nbsp;%%LNG_HLP_SendPreview%%
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain">
                    <tr class="whiteBackground">
                        <td class="paddingTable flexibleWidth">
                            <input class="SmallButton btn save-btn FormButton SaveButton" type="button" value="%%LNG_SaveAndKeepEditing%%" style="width:140px" />
                             <input class="SmallButton btn save-btn FormButton SaveExitButton" type="submit" value="%%LNG_SaveAndExit%%" style="width:140px"/>
                            <input class="SmallButton btn cancel-btn FormButton CancelButton" type="button" value="%%LNG_Cancel%%" style="width:140px"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>

.content-container {
    padding-bottom:10px;
}
#TB_window, .ui-window {
    top:0 !important;
    margin-top:210px !important;
}

label+span img{
    vertical-align:sub;
}
.newButtonGo {
    height: 30px;
    width: 300px;
    border-radius: 5px;
    margin-left: 0px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
}
*{
    box-sizing:border-box;
}
.Heading2{
    font-family: 'Roboto', Arial, Tahoma, sans-serif !important; 
    font-size:18px !important;
    padding: 20px 0px !important;
    background-color:#FFFFFF !important;
    font-weight:normal !important;
    height:62px !important;
    background-image:none !important;
     border-top :1px solid rgba(204, 204, 204, 0.35) !important;
    border-bottom :1px solid rgba(204, 204, 204, 0.35) !important;
}
.paddingTable{
    padding-left:350px!important;
}
.tdValue span img{
    margin-top:5px!important;
}
.ContentContainer {
    width:100% !important;
}
.parentTableDiv {
    width:100%;
}
.parentTable {
    margin-top: 20px;
}
.nextCancelButton {
    margin-top:15px;
} 
.FormButton{
    margin-top:4px;   
}
.buttonWidthFix{
    width:305px;
}
.customRadio {
    padding-bottom:7px;
    width:46%;
    left:-3px;
    margin-top: 0px;
    vertical-align: top;
}

.submitTableBtn{
    width:180px;
}
.FormButton_wide {
	margin-top:5px;
}
.HelpToolTip_Placeholder{
    margin:20px -125px;
}
.HelpToolTip img:first-child{
    margin-top:10px;
    margin-left:1px;
    //margin-bottom:10px;
}
.Panel {
    margin-bottom: 0px;
}
.tableContainer {
    margin-bottom:2.5%;
}
.tdValue {
    padding-top: 1.35rem;
    display: inline;
    //flex-direction: column;
}
.width20Percent{
    width:15em;
    font-size:14px;
}
.Field250 {
    width:300px;
}
.Field350 {
    width:300px;
    padding-right:0px;
    margin-top: 0px;
}
.FieldLabel{
    padding-left:0px;
    color: #000;
}
.fileFormat360{
    padding-bottom:10px;
}
.opentypeImg, .linktypeImg, .dateTypeImg {
    display:none;
}
.openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
    width:10rem;
}
.dateFieldTd {
    display:inline;
} 
.ISSelectDiv{
    height:150px;
    width:150px;
}
.datefield {
    width: 80px;
    padding: 5px 0px;
    margin: 0px 5px 0px 0px
}
.thirdPartyTable{
    width:100%;
    //overflow-x:scroll;
}
.buttons {
    padding-left: 0px;
}
.Heading3 TD:not(:first-child) {
    padding-right:20px;
}
.Panel td {
    height: fit-content;
    padding-top: 5px;
    vertical-align:top;
}
.TopFormButton:nth-child(2) {
    margin-top:4px;
}
.twoColumns td {
    width:8.5rem;
}
.customLabel {
    padding-left:0px;
    padding-right:10px;
}
.customTextArea, .customText, .customNumber, .customSelect {
    width:15.5rem;
}
.customTextArea {
    height:70px;
}
.twoColumns {
    //display:flex;
    //flex-direction:column;
}
.twoColumns td:nth-child(1) {
    padding-right:20px;
}
.twoColumns td:nth-child(2) {
    padding-left:20px;
}
.goButton {
    height: 40px;
    width: 40px;
    border-radius: 5px;
    margin-left: 0px;
    border: 1px solid #ccc;
    background-color: #ffff;
}
.mceLayout {
    //border-bottom: 1px solid #bbbbbb !important;
}
.mceStatusbar .mceFirst .mceLast {
    height: 100% !important;
}
#dynamicContentHtmlButton, #dynamicContentTextButton {
    width:208px !important;
}
.ItemContainer {
    width: 250px !important;
}
textarea.ContentsTextEditor {
    height: 380px;
}
.ContentsTextEditor {
    width:715px !important;
}
@media screen and (max-width:1920px){
    .paddingTable{
        padding-left:20%!important;
    }
    .marginButtonFix {
        margin-left: 22.5% !important;
    }
    .mceStatusbar .mceFirst .mceLast {
        height: 100% !important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 19.8% !important;
    }
}
@media screen and (max-width:1024px){
    .mceStatusbar .mceFirst .mceLast {
        height: 100% !important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 208px !important;
    }
    .parentTable {
        margin-top: 20px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
        vertical-align: top;
    }
    .customCheckBox {
        width:auto;
        margin-top: 8px;
        vertical-align: top;
    }
    .submitTableBtn{
        width:180px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:10px !important;
        margin-left:1px !important;
        //margin-bottom:10px !important;
    }
    .tdValue span img{
        margin-top:25px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:2.5% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: inline;
        //flex-direction: column;
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 80px !important;
        padding: 5px 0px !important;
        margin: 0px 5px 0px 0px !important
    }
    .thirdPartyTable{
        width:920px !important;
        //overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns td {
        width:50% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:15.5rem !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
    .paddingTable{
        padding-left:210px !important;
    }
}
@media screen and (max-width:823px){
    .mceStatusbar .mceFirst .mceLast {
        height: 100% !important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:100px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:180px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:690px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
    .twoColumns td {
        width:9rem !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
    }
}
@media screen and (max-width:768px){
    .ui-window {
        width:600px!important;
        left:88px!important;
        top:0 !important;
        margin-top:210px !important;
    }
    div.content{
        width:572px!important;
    }
    .mceStatusbar {
        height: 100% !important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:240px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:180px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:690px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
    .twoColumns td {
        width:9rem !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .paddingTable{
        padding-left:206px!important;
    }
    .tinyEditorDiv, .ContentsTextEditorP {
        width:477px !important;
        overflow-x: scroll;
    }
}
@media screen and (max-width:568px){
    td.miscellenousLable{
        display:flex;
        flex-direction:column;
    }
    label+span{
        margin-top:-15px;
    }
    .isNodeImg img:nth-child(1) {
        display:none !important;
    }
    .newButtonGo {
        height: auto;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 0px !important;
    }
    .mceStatusbar {
        height: 100% !important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 8px;
    }
    .submitTableBtn{
        width:96px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
    }
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .tinyEditorDiv, .ContentsTextEditorP {
        width:405px !important ;
        overflow-x: scroll;
    }
    .tinyEditorTr {
        display:flex;
        flex-direction:column;
    }
    .ContentsTextEditor {
        height:150px !important;
    }
    #TB_iframeContent {
        width:290px !important;
    }
}
@media screen and (max-width:540px){
    .ui-window {
        width:509px!important;
        left:6px!important;
        top:0 !important;
        margin-top:210px !important;
    }
    div.content{
        width:480px!important
    }
    .newButtonGo {
        height: auto;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 0px !important;
    }
    .marginButtonFix{
        margin-left:0px!important;
    }
    .flexibleWidth{
        display:flex;
        flex-direction:column;
        margin-top:12px;
    }
    .flexibleWidth span.HelpToolTip{
        margin-top:-15px;
    }
    .tdValue span.HelpToolTip{
        margin-top:-15px;
    }
    .paddingTable{
        padding-left:200px!important;
    }
    .buttonWidthFix{
       width: 200px;
        word-break: break-word;
        white-space: normal;
    }
    .inputBoxWidth{
        width:200px!important;
    }
    .isNodeImg img:nth-child(1) {
        display:none !important;
    }
    #TB_iframeContent {
        width:290px !important;
    }
}
@media screen and (max-width:414px){
    .ui-window {
        width:366px!important;
        left:6px!important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 0px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 8px;
    }
    .submitTableBtn{
        width:96px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
    }
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .tinyEditorDiv, .ContentsTextEditorP {
        width:334px!important;
        overflow-x: scroll;
    }
    .tinyEditorTr {
        display:flex;
        flex-direction:column;
    }
    .ContentsTextEditor {
        height:150px !important;
    }
    .paddingTable{
        padding-left:122px!important;
    }
    .fixScreenSize{
        width:20%!important;
        padding-top:15px!important;
    }
    .inputBoxWidth{
        width:200px!important;
    }
    .newButtonGo {
        height: auto;
    }
    .isNodeImg img:nth-child(1) {
        display:none !important;
    }
    #TB_iframeContent {
        width:290px !important;
    }
}
@media screen and (max-width:411px){
    div.content{
        width:339px!important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 0px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 8px;
    }
    .submitTableBtn{
        width:35px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:330px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
    }
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .tinyEditorDiv, .ContentsTextEditorP {
        width:334px !important;
        overflow-x: scroll;
    }
    .tinyEditorTr {
        display:flex;
        flex-direction:column;
    }
    .ContentsTextEditor {
        height:150px !important;
    }
    .buttonWidthFix{
       width: 200px;
        word-break: break-word;
        white-space: normal;
    }
    .BodyContainer{
        width:94.5%;
    }
    .newButtonGo {
        height: auto;
    }
    .isNodeImg img:nth-child(1) {
        display:none !important;
    }
    #TB_iframeContent {
        width:290px !important;
    }
}
@media screen and (max-width:375px){
    
    #TB_iframeContent {
        width:290px !important;
    }
    .ui-window {
        width:328px!important;
        left:6px!important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 0px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 8px;
    }
    .submitTableBtn{
        width:96px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
    }
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .tinyEditorDiv, .ContentsTextEditorP {
        width:225px !important;
        overflow-x: scroll;
    }
    .tinyEditorTr {
        display:flex;
        flex-direction:column;
    }
    .ContentsTextEditor {
        height:150px !important;
    }
    .paddingTable{
        padding-left:98px!important;
    }
    .fixScreenSize{
        width:20% !important;
    }
    .newButtonGo {
        height: auto;
    }
    .isNodeImg img:nth-child(1) {
        display:none !important;
    }
    #TB_iframeContent {
        width:290px !important;
    }
}
@media screen and (max-width:360px){
    .ui-window {
        width:312px!important;
        left:6px!important;
    }
    div.content{
        width:286px!important;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 0px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:180px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:180px;
        margin-top: 8px;
    }
    .submitTableBtn{
        width:10px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        font-size:14px !important;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:180px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
    }
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:180px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .tinyEditorDiv, .ContentsTextEditorP {
        width:276px !important;
        overflow-x: scroll;
    }
    .tinyEditorTr {
        display:flex;
        flex-direction:column;
    }
    .ContentsTextEditor {
        height:150px !important;
    }
    .paddingTable{
        padding-left:97px!important;
    }
    .BodyContainer{
        width:93.5%;
    }
    .newButtonGo {
        height: auto;
    }
    .isNodeImg img:nth-child(1) {
        display:none !important;
    }
    #TB_iframeContent {
        width:290px !important;
    }
}
@media screen and (max-width:320px){
    .inputBoxWidth{
        width:150px!important;
    }
     .buttonWidthFix{
       width: 150px;
        word-break: break-word;
        white-space: normal;
    }
    .isNodeImg img:nth-child(1) {
        display:none !important;
    }
    .widthFix{
        width:176px!important;
    }
    .ui-window {
        width:289px!important;
        left:6px!important;
        top:0 !important;
        margin-top:210px !important;
    }
    div.content{
        width:265px!important;
    }
    .newButtonGo {
        height: auto;
    }
    #dynamicContentHtmlButton, #dynamicContentTextButton {
        width:208px !important;
        margin-left: 0px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:150px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:150px;
        margin-top: 8px;
    }
    .submitTableBtn{
        width:115px;
		padding:0px !important;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:10% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: flex;
        flex-direction: column;
    }
    .width20Percent{
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:150px !important;
    }
    .Field350 {
        width:150px !important;
        padding-right:0px;
        margin-top: 0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .opentypeImg, .linktypeImg, .dateTypeImg {
        display:none;
    }
    .openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
        width:10rem !important;
    }
    .dateFieldTd {
        display:inline;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
    }
    .datefield {
        width: 42px !important;
        padding: 5px 0px !important;
        margin: 0px 1px 0px 0px !important;
    }
    .thirdPartyTable{
        width:260px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    .eventTypeInput, .eventTypeSubject, .eventTypeNote {
        width:180px !important
    }
    .eventTypeNote {
        height:140px !important;
    }
    .noteslabel{
        vertical-align:top !important;
    }
    #eventTime {
        display:flex !important;
        width:100px !important;
    }
    .Heading3 TD {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .tinyEditorDiv, .ContentsTextEditorP {
        width:246px !important;
        overflow-x: scroll;
    }
    .tinyEditorTr {
        display:flex;
        flex-direction:column;
    }
    .ContentsTextEditor {
        height:150px !important;
    }
    #TB_iframeContent {
        width:290px !important;
    }
}
 .tdKey{
        font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; width:13em; font-size:14px;padding-top:1.25rem;  color: #000;
    }
    .tdValue{
        padding-top: 1.35rem;
    }
    .mceLast{
        height:26px!important;
    }
</style>


<style>
#TB_window, .ui-window {
    margin-left: auto !important;
    margin-top: auto !important;
    top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: : translate(-50%, -50%);
	-webkit: translate(-50%, -50%);
	-moz-transform: : translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	-webkit-transform: -webkit-translate(-50%, -50%);
}
</style>