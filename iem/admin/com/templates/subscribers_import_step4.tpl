<script>
    $(function () {
        $('input#startImportSubscriber').click(function (event) {
            tb_show('', 'index.php?Page=Subscribers&Action=Import&SubAction=ImportIFrame&keepThis=true&TB_iframe=tue&height=385&width=450&modal=true', '');
            event.preventDefault();
            event.stopPropagation();
        });
    });
</script>
<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
    <tr>
        <td class="Heading1 Heading1New">
            %%LNG_Subscribers_Import_Step4%%
        </td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP" >
                %%LNG_Subscribers_Import_Step4_Intro%%
                <hr>
                <input id="startImportSubscriber" type="button " value="%%LNG_ImportStart%%" class="FormButton_wide SaveAddButton btn save-btn" style="margin-top: 5px;"/>
            </p>
        </td>
    </tr>
</table>
<style>
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.BodyContainer {
    width: 99.2%;
    margin: 0 10px 10px 4.45px !important;
}
.tableContainer {
    //display: flex;
    flex:wrap;
    //overflow:auto;
}
#TB_window, .ui-window {
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
#TB_iframeContent {
    height:610px !important;
    width:100% !important;
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
    #TB_iframeContent {
        height:360px;
        width:100% !important;
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
        width: 98.8% !important;
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
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    #TB_iframeContent {
        height:360px ​!important;
        width:285px !important;
    }
    #ProgressReportProgressBar {
        width:auto !important;
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
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    #TB_iframeContent {
        height:360px ​!important;
        width:285px !important;
    }
    #ProgressReportProgressBar {
        width:auto !important;
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
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    #TB_iframeContent {
        height:360px ​!important;
        width:285px !important;
    }
    #ProgressReportProgressBar {
        width:auto !important;
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
        width: 97.5% !important;
        margin: 0 10px 10px 10px;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    #TB_iframeContent {
        height:360px ​!important;
        width:285px !important;
    }
    #ProgressReportProgressBar {
        width:auto !important;
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
        width:138px;
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
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    #TB_iframeContent {
        height:360px ​!important;
        width:285px !important;
    }
    #ProgressReportProgressBar {
        width:auto !important;
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
        width:100px;
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
        width: 97% !important;
        margin: 0 10px 10px 10px;
    }
    #TB_window {
        width:300px !important;
        margin-left:-150px !important;
    }
    #TB_iframeContent {
        height:360px ​!important;
        width:285px !important;
    }
    #ProgressReportProgressBar {
        width:auto !important;
    }
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