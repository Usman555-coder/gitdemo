<form method="post" action="index.php?Page=Subscribers&Action=Banned&SubAction=Update&id=%%GLOBAL_BanID%%">
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Subscribers_Banned_Edit%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Subscribers_Banned_Edit_Intro%%
                </p>
            </td>
        </tr>
        <tr>
            <td style="font-size:13px;
            color: #212529;">
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
                            %%LNG_BanSingleEmail%%:;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;">
                            <input type="text" name="BannedEmail" value="%%GLOBAL_BannedAddress%%" class=" form-control Field350">&nbsp;%%LNG_HLP_BanSingleEmail%%
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff;">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Required"}
                            %%LNG_BannedEmailsChooseList_Edit%%:
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;" class="multiselectTd">
                            <select name="list" size="7" style="height:200px ; width:450px;font-size:14px" class="Field350 ISSelectDiv scroll1 form-control">
                                %%GLOBAL_SelectList%%
                            </select><div  class="HelpToolTipDiv">
                            %%LNG_HLP_BannedEmailsChooseList_Edit%%
                            </div>
                        </td>
                    </tr>
                </table>
                
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Save%%" />
                            <input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" onClick='if (confirm("%%LNG_Subscribers_Banned_Edit_CancelPrompt%%")) {
                                        document.location = "index.php?Page=Subscribers&Action=Banned"
                                    }' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>
*{
    box-sizing:border-box;
}
.HelpToolTipDiv{
    display: inline;
    vertical-align: top;
}
.Field350{
    width: 450px !important;
}
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
    width:256px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:3px;
}
.Field350 {
    display:inline;
}
.width20Percent {
    width:20em;
}
.BodyContainer {
    width: 98.2%;
    margin: 0 10px 10px 10px;
}
@media screen and (max-width:1024px){
    .HelpToolTipDiv{
    display: inline;
    vertical-align: top;
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
        width:193px;
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
        width:250px !important;
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
    .fileFormat360{
        padding-bottom:10px;
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
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:150px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
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
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:193px;
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
        width:250px !important;
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
    .fileFormat360{
        padding-bottom:10px;
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
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:150px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .BodyContainer {
        width: 98.5% !important;
        margin: 0 10px 10px 10px;
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
        width:190px;
        left:-3px;
    }
    .customCheckBox {
        width:190px;
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
        width:14em !important;
    }
    .Field250 {
        width:190px !important;
    }
    .Field350 {
        width:190px !important;
        padding-right:0px;
    }
    select {
        width:190px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
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
        width:190px;
        left:-3px;
    }
    .customCheckBox {
        width:190px;
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
        width:14em !important;
    }
    .Field250 {
        width:190px !important;
    }
    .Field350 {
        width:190px !important;
        padding-right:0px;
    }
    select {
        width:190px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
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
        width:12em !important;
    }
    .Field250 {
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:150px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
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
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:116px;
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
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:150px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
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
        width:170px;
        left:-3px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:88px;
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
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:150px !important;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileFormat360{
        padding-bottom:10px;
    }
    .BodyContainer {
        width: 93% !important;
        margin: 0 10px 10px 10px;
    }
}
</style>