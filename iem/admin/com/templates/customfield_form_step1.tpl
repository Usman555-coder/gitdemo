<form method="post" action="index.php?Page=CustomFields&Action=%%GLOBAL_Action%%" onsubmit="return CheckForm()">
    <table cellspacing="0" cellpadding="0" width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%GLOBAL_Heading%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
				<p class="PageIntroP">
                    %%GLOBAL_Intro%%
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
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel  col-sm" style=" margin-top:10px ; border-bottom:none">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_CustomFieldDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}

                            %%LNG_CustomFieldType%%:
                            
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.30rem;  color: #000;">
                            %%GLOBAL_FieldTypeList%%
                            <!-- Custom Help so we can make it show higher -->
                            <div id="cfHelp" style="display:none">
                                <img onMouseOut="HideHelp('sscVAaNTpt');" onMouseOver="ShowHelp('sscVAaNTpt', '%%LNG_CustomFieldType%%', '%%LNG_CustomFieldTypeHelp%%');" src="assets/images/infoIconBlue.svg" width="24" height="16" border="0"><div style="display:none; top: 0px;" class="BigToolTip" id="sscVAaNTpt"></div>
                            </div>
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                        {template="Required"}
                            %%LNG_CustomFieldName%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="FieldName" id="FieldName" class ="form-control Field350" value="%%GLOBAL_FieldName%%">&nbsp;%%LNG_HLP_CustomFieldName%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_CustomFieldRequired%%
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <label class="customCheckBox" for="FieldRequired"><input type="checkbox" id="FieldRequired" class="form-control" name="FieldRequired"%%GLOBAL_FieldRequired%%>%%LNG_CustomFieldRequiredExplain%% <span class="checkmark"></span></label>

                            %%LNG_HLP_CustomFieldRequired%%
                        </td>
                    </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                    <td class="submitTableBtn FieldLabel">&nbsp;</td>
                    <td valign="top" height="30">
                            <input class="FormButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%" />
                            <input class="FormButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%GLOBAL_CancelButton%%")) {
                                        document.location = "index.php?Page=CustomFields"
                                    }' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script>

    // Check the radio button custom fields (Added by Mitch during IEM5 alpha testing)
    var cf_selected = false;

    function CheckForm() {
        if ($('#FieldName').val() == '') {
            alert("%%LNG_EnterCustomFieldName%%");
            $('#FieldName').focus();
            return false;
        }

        if (!cf_selected) {
            alert("%%LNG_SelectCustomFieldType%%");
            $('#FieldName').focus();
            return false;
        }
    }

    $(document).ready(function () {
        document.getElementById('cfCustomHelp').innerHTML = document.getElementById('cfHelp').innerHTML;
        document.getElementById('cfHelp').innerHTML = '';
    });

</script>
<style>
.BigToolTip {
    font-size: 13px;
    width: 320px !important;
    background-color: #ffffff;
    webkit-border-radius: 0;
    -moz-border-radius: 0;
    -ms-border-radius: 0;
    border-radius: 0;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    border: unset !important;
    padding: 10px;
    margin: 26px -355px !important;
    z-index: 1 !important;
}
.BigToolTip table {
    width:100% !important;
}
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
.Field350 {
    display:inline;
}
.width20Percent {
    width:16em;
}
.Panel td {
    font-size:14px;
}
.BodyContainer {
    width:98%;
}
#cfCustomHelp {
    vertical-align:middle !important;
}
@media screen and (max-width:1024px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom: 10px;
        width: auto !important;
        left: -3px;
    }
    .customCheckBox {
        width:380px;
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
        margin-left:0px !important;
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
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .importFromServerDiv {
        margin-top:10px;
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
        width:98%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 320px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 26px -355px !important;
        z-index: 1 !important;
    }   
}
@media screen and (max-width:768px){
    #cfCustomHelp {
        vertical-align:top !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px !important;
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
        vertical-align: top;
        margin-top: 5px !important;
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
        width:98%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 320px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 26px -355px !important;
        z-index: 1 !important;
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
        width:210px !important;
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
        width:98%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 320px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 80px -170px !important;
        z-index: 1 !important;
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
        width:210px !important;
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
    #cfCustomHelp img {
        margin-bottom:10px;
    }
    .BodyContainer {
        width:94%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 320px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 80px -170px !important;
        z-index: 1 !important;
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
        width:205px !important;
        left:-3px;
    }
    .customCheckBox {
        width:205px;
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
        width:9em !important;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:205px !important;
        padding-right:0px;
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
    #cfCustomHelp img {
        margin-bottom:10px;
    }
    .BodyContainer {
        width:95%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 320px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 155px -140px !important;
        z-index: 1 !important;
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
        width:180px !important;
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
    #cfCustomHelp img {
        margin-bottom:10px;
    }
    .BodyContainer {
        width:94%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 320px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 26px -355px !important;
        z-index: 1 !important;
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
        width:180px !important;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:120px;
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
        width:9em !important;
    }
    .Field250 {
        width:140px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
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
    #cfCustomHelp img {
        margin-bottom:10px;
    }
    .BodyContainer {
        width:94%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 280px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 185px -130px !important;
        z-index: 1 !important;
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
        width:140px !important;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:118px;
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
    #cfCustomHelp img {
        margin-bottom:10px;
    }
    .BodyContainer {
        width:93%;
    }
    .BigToolTip {
        font-size: 13px;
        width: 250px !important;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: unset !important;
        padding: 10px;
        margin: 185px -140px !important;
        z-index: 1 !important;
    }
}
</style>
