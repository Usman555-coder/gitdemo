<form method="post" action="index.php?Page=Subscribers&Action=Import&SubAction=Step3" onsubmit="return CheckForm();" enctype="multipart/form-data">
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Subscribers_Import_Step2%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo" internalAnchor>
                <p class="PageIntroP">
                    %%LNG_Subscribers_Import_Step2_Intro%%&nbsp; 
                </p>
            </td>
        </tr>
        <tr>
            <td style="font-size:13px;color: #212529;">
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style="margin-top:10px ; border-bottom:0px">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_ImportDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                {template="Required"}
                            %%LNG_ImportStatus%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="status" class="Field350" style="border-radius: 0.25rem;">
                                <option value="active" SELECTED>%%LNG_Active%%
                            </select>%%LNG_HLP_ImportStatus%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                {template="Required"}
                            %%LNG_ImportConfirmedStatus%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="confirmed" class="Field350"  style="border-radius: 0.25rem;">
                                <option value="confirmed" SELECTED>%%LNG_Confirmed%%
                                <option value="unconfirmed">%%LNG_Unconfirmed%%
                            </select>%%LNG_HLP_ImportConfirmedStatus%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                {template="Required"}
                            %%LNG_ImportFormat%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="format" onchange="ChangeOptions();"  style="border-radius: 0.25rem;" class="Field350">
                                %%GLOBAL_ListFormats%%
                            </select>%%LNG_HLP_ImportFormat%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                {template="Required"}
                            %%LNG_OverwriteExistingSubscriber%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customCheckBox" style="margin-right: 5px;" for="overwrite"><input type="checkbox" name="overwrite" id="overwrite" value="1">&nbsp;%%LNG_YesOverwriteExistingSubscriber%% <span class="checkmark"></span></label> %%LNG_HLP_OverwriteExistingSubscriber%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                {template="Required"}
                            %%LNG_IncludeAutoresponder%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customCheckBox" style="margin-right: 5px;" for="autoresponder"><input type="checkbox" name="autoresponder" id="autoresponder" value="1">&nbsp;%%LNG_YesIncludeAutoresponder%% <span class="checkmark"></span></label> %%LNG_HLP_IncludeAutoresponder%%
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="EmptyRow">
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="whiteBackground" style="display:none">
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_ImportType%%
                        </td>
                    </tr>
                    <tr style="display:none" class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                {template="Required"}
                            %%LNG_ImportType%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="importtype">
                                %%GLOBAL_ImportTypes%%
                            </select>%%LNG_HLP_ImportType%%
                        </td>
                    </tr>
                    <tr class="whiteBackground" style="display:none">
                        <td colspan="2" class="EmptyRow">
                            &nbsp;
                        </td>
                    </tr>
                    <!-- here we go for importing of files. //-->
                    <div id="importinfo_file">
                        <tr>
                            <td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                                %%LNG_ImportFileDetails%%
                            </td>
                        </tr>
                        <tr class="whiteBackground">
						    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
        		                {template="Required"}
                                %%LNG_ContainsHeaders%%:
                            </td>
                            <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                                <label class="customCheckBox" style="margin-right: 5px;" for="headers"><input type="checkbox" class="checkbox" style="margin-right: 4px; "  name="headers" id="headers" value="1">&nbsp;%%LNG_YesContainsHeaders%% <span class="checkmark"></span></label> %%LNG_HLP_ContainsHeaders%%
                            </td>
                        </tr>
                        <tr class="whiteBackground">
                            <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                {template="Required"}
                                %%LNG_FieldSeparator%%:
                            </td>
                            <td class="gff" style="font-family: 'Roboto', Arial, Tahoma, sans-serif;display: flex; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                                <input type="text" name="fieldseparator" class="form-control Field350" value="%%GLOBAL_fieldseparator%%">%%LNG_HLP_FieldSeparator%%
                            </td>
                        </tr>
                        <tr id="fieldenclosed_info" style="display: %%GLOBAL_ShowFieldEnclosed%%" class="whiteBackground">
                            <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                {template="Required"}
                                %%LNG_FieldEnclosed%%:
                            </td>
                            <td class="gff" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;display: flex; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                                <input type="text" name="fieldenclosed" class="form-control Field350" value="%%GLOBAL_fieldenclosed%%">%%LNG_HLP_FieldEnclosed%%
                            </td>
                        </tr>
                        <tr class="whiteBackground">
						    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
    		                    {template="Required"}
                                %%LNG_ImportFile%%:
                            </td>
                            <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                                <div>
                                    
                                    <label class="customRadio" style="margin-right: 5px;" for="SubscriberImportUseUpload"><input style="margin-right:4px" id="SubscriberImportUseUpload" type="radio" name="useserver" value="0" checked="checked" onClick="FileSourceFromServer(false);" /> %%LNG_ImportFile_SourceUpload%% <span class="checkmarkRadio"></span></label>
                                    %%LNG_HLP_ImportFile%%
                                </div>
                                <div id="SubscriberImportUploadField">
                                    <input type="file" name="importfile" class="Field250 fileInput" />
                                </div>
                            </td>
                        </tr>
                        <tr class="whiteBackground">
                            <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">&nbsp;</td>
                            <td >
                                <div class="importFromServerDiv" style="font-size: 14px;font-family: 'Roboto', Arial, Tahoma, sans-serif;">
                                    
                                    <label class="customRadio" style="margin-right: 5px;" for="SubscriberImportUseServer"> <input  style="margin-right:4px" id="SubscriberImportUseServer" type="radio" name="useserver" value="1" onClick="FileSourceFromServer(true);" />%%LNG_ImportFile_SourceServer%% <span class="checkmarkRadio"></span></label>
                                    %%LNG_HLP_ImportFileFromServer%%
                                </div>
                                <div id="SubscriberImportServerField" style="margin-left: 25px; display:none;">
                                    <select name="serverfile" class="Field250" disabled="disabled">
                                        %%GLOBAL_fieldServerFiles%%
                                    </select>
                                </div>
                                <div id="SubscriberImportServerNoList" style="margin: 5px 0 0 25px; font-family: 'Roboto', Arial, Tahoma, sans-serif; display:none; width:300px; font-style: italic;" class="importFromServer">
                                    %%LNG_ImportFile_ServerFileEmptyList%%
                                </div>
                            </td>
                        </tr>
                    </div>
                    <!-- end of importing files //-->
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_NextButton%%" />
                            <input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%LNG_Subscribers_Import_CancelPrompt%%")) {
                                        document.location = "index.php?Page=Subscribers&Action=Import"
                                    }'>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

<script>
    function CheckForm() {
        var f = document.forms[0];
        var import_index = f.importtype.selectedIndex;
        var importtype = f.importtype.options[import_index].value;

        if (importtype == 'file') {
            if (f.fieldseparator.value == '') {
                alert('%%LNG_ImportFile_FieldSeparatorEmpty%%');
                f.fieldseparator.focus();
                return false;
            }
            if (f.useserver[1].checked) {
                if (f.localfile.value == '') {
                    alert('%%LNG_ImportFile_ServerFileEmpty%%');
                    f.serverfile.focus();
                    return false;
                }
            } else {
                if (f.importfile.value == '') {
                    alert('%%LNG_ImportFile_FileEmpty%%');
                    f.importfile.focus();
                    return false;
                }
            }
            return true;
        }
    }

    function ChangeOptions() {
        var Options = Array('file');
        var f = document.forms[0];
        var import_index = f.importtype.selectedIndex;
        var importtype = f.importtype.options[import_index].value;
        for (var option in Options) {
            if (option == importtype) {
                document.getElementById('importinfo_' + option).display.style = '';
            } else {
                document.getElementById('importinfo_' + option).display.style = 'none';
            }
        }
    }

    function FileSourceFromServer(value) {
        var frm = document.forms[0];
        frm.importfile.disabled = value;
        document.getElementById('SubscriberImportUploadField').style.display = value ? 'none' : '';
        frm.serverfile.disabled = !value;
        document.getElementById(frm.serverfile.options.length == 0 ? 'SubscriberImportServerNoList' : 'SubscriberImportServerField').style.display = value ? '' : 'none';
    }

    function ImportTutorial()
    {
        window.open('index.php?Page=Subscribers&Action=Import&SubAction=ViewTutorial', "importWin", "left=" + (((screen.availWidth) / 2) - 225) + ", top=" + (((screen.availHeight) / 2) - 300) + ", width=450, height=600, toolbar=0, statusbar=0, scrollbars=1");
    }
</script>

<style>
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.width20Percent {
    font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem; padding-left:18px;  color: #000;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
.nextCancelButton {
    margin-top:1.5%;
}
.submitTableBtn{
    width:225px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:3px;
}
.cge {
    display:inline;
}
.width20Percent {
    width:16em;
}
.Panel td {
    font-size:14px;
}
.BodyContainer {
    width: 98.4%;
    margin: 0 10px 10px 10px;
}
@media screen and (max-width:1024px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:328px;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:3px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:15em !important;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:270px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .BodyContainer {
        width: 98.2 % !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:823px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:328px;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:3px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:15em !important;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:270px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .BodyContainer {
        width: 97.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:768px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:328px;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:3px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:15em !important;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:270px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .BodyContainer {
        width: 97.5% ​!important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:568px){
    .nextCancelButton {
        margin-top:15px;
    } 
    
    .FormButton{
        margin-top:4px;   
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
    .submitTableBtn{
        width:155px;
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
    .width20Percent{
        width:12em !important;
    }
    .Field250 {
        width:210px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    select {
        width:210px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 210px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .BodyContainer {
        width: 98.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width : 440px){
    .gff{
        height : unset!important;
        flex-direction : column;
    }
    .gff input{
        padding:10px 0px;
    }
}
@media screen and (max-width:414px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
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
    .submitTableBtn{
        width:155px;
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
    .width20Percent{
        width:12em !important;
    }
    .Field250 {
        width:210px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    select {
        width:210px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 210px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:411px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:180px;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:160px;
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
    .width20Percent{
        width:12em !important;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    select {
        width:180px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:375px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:180px;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:155px;
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
    .width20Percent{
        width:12em !important;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    select {
        width:180px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:160px;
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
    .width20Percent{
        width:15em !important;
    }
    .Field250 {
        width:140px !important;
    }
    .Field350 {
        width:140px !important;
        padding-right:0px;
    }
    select {
        width:140px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:320px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:125px;
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
    .width20Percent{
        width:15em !important;
    }
    .Field250 {
        width:140px !important;
    }
    .Field350 {
        width:140px !important;
        padding-right:0px;
    }
    select {
        width:140px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    .BodyContainer {
        width: 93% !important;
        margin: 0 10px 10px 10px;
    }
}
</style>