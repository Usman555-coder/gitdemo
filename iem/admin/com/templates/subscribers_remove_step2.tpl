<form method="post" action="index.php?Page=Subscribers&Action=Remove&SubAction=Step3&list=%%GLOBAL_list%%" enctype="multipart/form-data" onsubmit="return CheckForm();">
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Subscribers_Remove_Step2%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Subscribers_Remove_Step2_Intro%%
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
                            %%LNG_Subscribers_Remove_Heading%%
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff ; ">
                        <td width="20%" class=" col-md-4 col-12 FieldLabel col-form-label" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem; color: #000;">
                            {template="Required"}
                            %%LNG_RemoveEmails%%:&nbsp;
                        </td>
                        <td style="height:15px">
                             <label class="customRadio" style="margin-right: 5px;margin-top: 1.2rem;" for="radioTextbox"><input style="margin-right:4px" type="radio" name="howRemove" id="radioTextbox" /> %%LNG_RemoveViaTextbox%% <span class="checkmarkRadio"></span></label>
                        </td>
                    </tr>
                    <tr style=" background-color:#ffffff ;" id="trTextbox">
                        <td class="FieldLabel">&nbsp;</td>
                        <td valign="top" style="padding-left:20px;display: flex;flex-wrap: wrap;height: auto;margin-bottom: 10px;">
                            <img src="images/nodejoin.gif" style="float:left;height: 100%;" /><textarea name="RemoveEmailList" id="RemoveEmailList" cols="30" rows="5" style="width: 250px;" class="form-control removeTextarea"></textarea>&nbsp;%%LNG_HLP_RemoveEmails%%
                        </td>
                    </tr>
                    <tr style="height:15px; background-color:#ffffff ; ">
                        <td class="FieldLabel">&nbsp;</td>
                        <td style="padding:0px; margin:0px; height:15px">
                             <label class="customRadio" style="margin-right: 5px;" for="radioFile"> <input style="margin-right:4px" type="radio" name="howRemove" id="radioFile" />%%LNG_RemoveViaFile%% <span class="checkmarkRadio"></span></label>
                        </td>
                    </tr>
                    <tr style="display:none; background-color:#ffffff ;" id="trFile">
                        <td class="FieldLabel">&nbsp;</td>
                        <td valign="top" style="padding-left:20px; height:auto;">
                            <img src="images/nodejoin.gif" style="float:left" /><input type="file" style="width:185px;height: 100%;" name="RemoveFile" id="RemoveFile" class="Field250">%%LNG_HLP_RemoveFile%%
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff ; ">
                        <td width="20%" class=" col-md-4 col-12 FieldLabel col-form-label" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            {template="Required"}
                            %%LNG_RemoveOptions%%:&nbsp;
                        </td>
                        <td style="padding-top: 1rem;">
                            <select name="RemoveOption" id="RemoveOption" class="form-control removeSelect">
                                <option value="Unsubscribe">%%LNG_RemoveUnsubscribe%%</option>
                                <option value="Delete">%%LNG_RemoveDelete%%</option>
                            </select>&nbsp;%%LNG_HLP_RemoveOptions%%
                        </td>
                    </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%">
                            <input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%LNG_Subscribers_Remove_CancelPrompt%%")) {
                                        document.location = "index.php?Page=Subscribers&Action=Remove"
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
        if (f.RemoveEmailList.value == "" && f.RemoveFile.value == "") {
            alert("%%LNG_EnterEmailAddressesToRemove%%");
            f.RemoveEmailList.focus();
            return false;
        }

        // Double check they really want to do this if they selected the delete option (Added by Mitch)
        if (document.getElementById('RemoveOption').selectedIndex == 1) {
            if (!confirm('%%LNG_RemoveConfirmDelete%%')) {
                return false;
            }
        }

        return true;
    }

    // Added by Mitch when redesigning the removal process for IEM 5
    $('#trTextbox').hide();
    $('#radioTextbox').click(function () {
        $('#trTextbox').show();
        $('#trFile').hide();
        $('#RemoveEmailList').focus();
    });

    $('#radioFile').click(function () {
        $('#trTextbox').hide();
        $('#trFile').show();
    });

</script>
<style>
*{
    box-sizing:border-box;
}
.multiselectTd{
    display:flex;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
.nextCancelButton {
    margin-top:2.5%;
}
.submitTableBtn{
    width:200px;
}
.removeSelect {
    width:450px;
    display:inline;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:-2px;
}
.BodyContainer {
    width: 98.2%;
    margin: 0 10px 10px 10px;
}
@media screen and (max-width:1024px){
    .multiselectTd{
        display:flex;
    }
    .nextCancelButton {
        margin-top:2.5%;
    } 
    .HelpToolTipDiv{
        margin-left:10px !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:100%;
    }
    .submitTableBtn{
        width:200px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -130px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:1px;
        margin-left:0px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .BodyContainer {
        width: 98.2 % !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:823px){
    .multiselectTd{
        display:inline;
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
    .removeTextarea{
        width:100px;
    }
    .BodyContainer {
        width: 97.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:768px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:15px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:450px;
    }
    .submitTableBtn{
        width:200px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:5px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .removeTextarea{
        width:300px !important;
    }
    .removeSelect {
        width:270px !important;
    }
    .removeSelect option {
        width:270px !important;
    }
    input[type="file"]{
    }
    .BodyContainer {
        width: 97.5% ​!important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:568px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:0px
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
    .removeTextarea{
        width:100px;
    }
    .BodyContainer {
        width: 98.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:414px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:25px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:170px;
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
    .removeTextarea{
        width:100px !important;
    }
    .removeSelect {
        width:135px !important;
    }
    .removeSelect option {
        width:135px !important;
    }
    input[type="file"]{
        color: transparent;
        width:90px !important;
    }
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:411px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:15px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:168px;
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
    .removeTextarea{
        width:100px;
    }
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:375px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:15px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:163px;
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
    .removeTextarea{
        width:100px !important;
    }
    .removeSelect {
        width:135px !important;
    }
    .removeSelect option {
        width:135px !important;
    }
    input[type="file"]{
        color: transparent;
        width:100px !important;
    }
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:360px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:15px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:133px;
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
    .removeTextarea{
        width:100px !important;
    }
    .removeSelect {
        width:135px !important;
    }
    .removeSelect option {
        width:135px !important;
    }
    input[type="file"]{
        color: transparent;
        width:90px !important;
    }
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:320px){
    .nextCancelButton {
        margin-top:15px
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:100px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -150px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:0px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .removeTextarea{
        width:100px !important;
    }
    .removeSelect {
        width:135px !important;
    }
    .removeSelect option {
        width:135px !important;
    }
    input[type="file"]{
        color: transparent;
        width:90px !important;
    }
    .BodyContainer {
        width: 93% !important;
        margin: 0 10px 10px 10px;
    }
}
</style>