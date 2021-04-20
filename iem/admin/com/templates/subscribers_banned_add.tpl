<form method="post" action="index.php?Page=Subscribers&Action=Banned&SubAction=Ban" enctype="multipart/form-data" onsubmit="return CheckForm();">
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Subscribers_Banned_Add%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Subscribers_Banned_Add_Intro%%
                </p>
            </td>
        </tr>
        <tr>
            <td style="font-size:14px;color: #212529;">
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style="margin-top:10px ; border-bottom:0px">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_BannedEmailDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_BannedEmailsChooseList%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <select name="list" class="form-control supressionSelect">
                                %%GLOBAL_SelectList%%
                            </select>
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_BannedEmails%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                             <label class="customRadio" style="margin-right: 5px;" for="listRadio"><input style="margin-right:4px" id="listRadio" name="bannedType" type="radio">%%LNG_Banned_AddEmailsUsingForm%% <span class="checkmarkRadio"></span></label>
                        </td>
                    </tr>
                    <tr style="display:none; background-color:#ffffff;" id="trList">
                        <td>&nbsp;</td>
                        <td valign="top" style="padding-left:20px;display: flex;flex-wrap: wrap;height: auto;margin-bottom: 10px;">
                            <img src="images/nodejoin.gif" style="float:left;height: 100%" class="nodeImg" />
                            <textarea name="BannedEmailList" cols="30" rows="5" class="form-control removeTextarea"></textarea>
                            %%LNG_HLP_BannedEmails%%
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff ; ">
                        <td>&nbsp;</td>
                        <td style="padding:0px; padding-top:5px; margin:0px; height:15px">	
                        <label class="customRadio" style="margin-right: 5px;" for="fileRadio"><input style="margin-right:4px" id="fileRadio" name="bannedType" type="radio">%%LNG_Add_Banned_From_File%% <span class="checkmarkRadio"></span></label>
                        </td>
                    </tr>
                    <tr style="display:none; background-color:#ffffff ;" id="trFile" >
                        <td>&nbsp;</td>
                        <td style="padding-left:20px" valign="top">
                            <img src="images/nodejoin.gif" style="float:left" class="nodeImg" /><input type="file" style="width:185px;height: 100%;" name="BannedFile" class="fileInput Field250">%%LNG_HLP_BannedFile%%
                        </td>
                    </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Save%%" />
                            <input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%LNG_Subscribers_Banned_CancelPrompt%%")) {
                                        document.location = "index.php?Page=Subscribers&Action=Banned"
                                    }' />
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

        if (!f.listRadio.checked && !f.fileRadio.checked) {
            alert('%%LNG_Banned_Choose_Action%%');
            return false;
        }

        if (f.BannedEmailList.value == "" && f.listRadio.checked) {
            alert("%%LNG_Banned_Add_EmptyList%%");
            f.BannedEmailList.focus();
            return false;
        }

        if (f.BannedFile.value == "" && f.fileRadio.checked) {
            alert("%%LNG_Banned_Add_EmptyFile%%");
            f.BannedFile.focus();
            return false;
        }

        if (f.list.selectedIndex == -1) {
            alert("%%LNG_Banned_Add_ChooseList%%");
            f.list.focus();
            return false;
        }
        return true;
    }

    $('#listRadio').click(function () {
        $('#trList').show();
        $('#trFile').hide();

    });

    $('#fileRadio').click(function () {
        $('#trList').hide();
        $('#trFile').show();

    });

</script>
<style>
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.width20Percent {
    font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; width:20em; font-size:14px ; padding-top: 1.35rem; padding-left:18px;
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
    width:280px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:3px;
}
.supressionSelect {
    width:400px !important;
}
.removeTextarea{
    width:300px;
    resize:none;
}
.BodyContainer {
    width: 98.7%;
    margin: 0 10px 10px 10px;
}
@media screen and (max-width:1024px){
    .BodyContainer {
        width: 98.5% !important;
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:510px;
        left:-3px;
        color:#000;
    }
    .submitTableBtn{
        width:275px;
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
        width:20em !important;
    }
    .Field250 {
        width:250px !important;
    }
    select {
        width:250px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:823px){
    .BodyContainer {
        width: 98% !important;
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
        color:#000;
    }
    .submitTableBtn{
        width:103px;
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
        width:8em !important;
    }
    .Field250 {
        width:170px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:768px){
    .BodyContainer {
        width: 97.5% ​!important;
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:400px;
        left:-3px;
        color:#000;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:235px;
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
        width:17em !important;
    }
    .Field250 {
        width:185px !important;
    }
    .Field350 {
        width:250px !important;
        padding-right:0px;
        display:inline;
    }
    select {
        width:250px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:568px){
    .BodyContainer {
        width: 98.5% !important;
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:111px;
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
        width:8em !important;
    }
    .Field250 {
        width:170px !important;
    }
    select {
        width:150px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:414px){
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:210px;
    }
    .submitTableBtn{
        width:170px;
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
        width:13em !important;
    }
    .Field250 {
        width:180px !important;
        height: 25px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    .supressionSelect {
        width:210px !important;
    }
    .removeTextarea {
        width:180px !important;
    }
    .nodeImg {
        display:none;
    }
    .fileInput {
        width:180px;
        overflow: hidden;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:411px){
    .BodyContainer {
        width: 94.5% !important;
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:210px;
    }
    .submitTableBtn{
        width:123px;
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
        width:10em !important;
    }
    .Field250 {
        width:180px !important;
        height: 25px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    .supressionSelect {
        width:210px !important;
    }
    .removeTextarea {
        width:180px !important;
    }
    .nodeImg {
        display:none;
    }
    .fileInput {
        width:180px;
        overflow: hidden;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:375px){
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:210px;
    }
    .submitTableBtn{
        width:130px;
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
        width:10em !important;
    }
    .Field250 {
        width:180px !important;
        height: 25px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    .supressionSelect {
        width:210px !important;
    }
    .removeTextarea {
        width:180px !important;
    }
    .nodeImg {
        display:none;
    }
    .fileInput {
        width:180px;
        overflow: hidden;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:360px){
    .BodyContainer {
        width: 93.5% !important
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:85px;
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
        width:8em !important;
    }
    .Field250 {
        width:170px !important;
        height: 25px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    .supressionSelect {
        width:200px !important;
    }
    .removeTextarea {
        width:170px !important;
    }
    .nodeImg {
        display:none;
    }
    .fileInput {
        width:150px;
        overflow: hidden;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
@media screen and (max-width:320px){
    .BodyContainer {
        width: 93% !important;
        margin: 0 10px 10px 10px;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:81px;
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
        width:8em !important;
    }
    .Field250 {
        width:170px !important;
        height: 25px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    .supressionSelect {
        width:170px !important;
    }
    .removeTextarea {
        width:150px !important;
    }
    .nodeImg {
        display:none;
    }
    .fileInput {
        width:150px !important;
        overflow: hidden;
    }
    .FieldLabel{
        padding-left:0px;
    }
}
</style>