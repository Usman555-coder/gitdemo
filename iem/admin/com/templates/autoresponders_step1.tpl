<form method="get" action="index.php" onsubmit="return CheckForm();">
    <input type="hidden" name="Page" value="Autoresponders" />
    <input type="hidden" name="Action" value="Step2" />
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr class="whiteBackground">
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Autoresponder_Step1%%
            </td>
        </tr>
        <tr class="whiteBackground">
           <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Autoresponder_Step1_Intro%%
                </p>
            </td>
        </tr>
        <tr class="whiteBackground">
            <td>
                %%GLOBAL_CronWarning%%
            </td>
        </tr>
        <tr class="whiteBackground">
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel" style="margin-top:10px ; border-bottom:0px">
                    <tr class="whiteBackground">
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_MailingListDetails%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class=" col-md-4 col-12 FieldLabel col-form-label" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem; padding-left:18px;  color: #000;">
                            {template="Not_Required"}
                            %%LNG_MailingList%%:&nbsp;
                        </td>
                        <td style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px ; padding-top: 1.35rem;  color: #000;" class="multiselectTd">
                            <select name="list" style="height:200px; font-size:14px" multiple class="scroll1 ISSelectDiv" onDblClick="this.form.submit()">
                                %%GLOBAL_SelectList%%
                            </select>
                            <div style="margin-left: 6px;" class="HelpToolTipDiv">
                                %%LNG_HLP_MailingList%%
                            </div>
                        </td>
                    </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%" />
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
        if (f.list.selectedIndex < 0) {
            alert("%%LNG_SelectOneList%%");
            f.list.focus();
            return false;
        }
        return true;
    }
</script>

<style>
*{
    box-sizing:border-box;
}
.multiselectTd{
    display:inline-table;
    position:relative;
}
.HelpToolTipDiv {
    position: absolute;
    top: 23px;
    right: -30px;
}
.FormButton {
    margin-top: 0px !important;
}
select.scroll1.ISSelectDiv {
    margin-top: 25px;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
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
.ContentContainer {
    width:100% !important;
}
.BodyContainer {
    width: 98%;
    margin: 0 10px 10px 10px;
}
select option:hover, 
{
    background: linear-gradient(#CECECE,#CECECE) !important;
    background-color: #CECECE !important; /* for IE */
}
select option:focus, 
select option:active, 
select option:checked
{
    background: linear-gradient(#1E90FF,#1E90FF) !important;
    background-color: #1E90FF !important; /* for IE */
}
@media screen and (max-width:1024px){
    table.PanelPlain.nextCancelButton {
        margin-top: 15px;
    }
    
    .nextCancelButton {
        margin-top:15px;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:400px !important;
        overflow-x: auto;
    }
    .HelpToolTipDiv{
        margin-left:10px !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:182px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -130px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:1px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
}
@media screen and (max-width:823px){
    
    .ISSelectDiv{
        height:150px !important;
        width:300px !important;
        overflow-x: auto !important;
        //margin-top: 10px;
    }
    .HelpToolTipDiv{
        margin-left:10px !important;
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
        margin-top:1px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
}
@media screen and (max-width:768px){
    
    .ISSelectDiv{
        height:150px !important;
        width:300px !important;
        overflow-x: auto !important;
        //margin-top: 10px;
    }
    .HelpToolTipDiv{
        margin-left:10px !important;
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
        margin-top:1px;
        margin-left:-6px;
    }
    .Panel {
        margin-bottom: 0px;
    }
}
@media screen and (max-width:640px){
    .HelpToolTipDiv {
        position: static;
    }
}
@media screen and (max-width:568px){
    
    .ISSelectDiv{
        height:150px !important;
        width:260px !important;
        overflow-x: auto !important;
        margin-top: 10px;
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
    .ContentContainer {
        width:100% !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:414px){
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
        overflow-x: auto !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
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
    .ContentContainer {
        width:100% !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:411px){
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:225px !important;
        overflow-x: auto !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:111px;
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
    .ContentContainer {
        width:100% !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:375px){
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:150px !important;
        overflow-x: auto !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
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
    .ContentContainer {
        width:100% !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:360px){
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
        overflow-x: auto !important;
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
        margin:23px -100px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:5px;
        margin-left:-12px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .ContentContainer {
        width:100% !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:320px){
    .ISSelectDiv{
        height:150px !important;
        width:170px !important;
        overflow-x: auto !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:150px;
    }
    .submitTableBtn{
        width:95px;
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
    .ContentContainer {
        width:100% !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
</style>