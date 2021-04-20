<link rel="stylesheet" href="includes/styles/ui.datepicker.css" type="text/css">
<link rel="stylesheet" href="includes/styles/timepicker.css" type="text/css">
<script src="includes/js/jquery/ui.js"></script>
<script>
    var SegmentID = '%%GLOBAL_SegmentID%%';
// Show the loading indicator
    $(document).ajaxSend(function () {
        $('#loading_indicator').css('display', 'block');
    });
    $(document).ajaxStop(function () {
        $('#loading_indicator').css('display', 'none');
    });
</script>
<script src="includes/js/jquery/timepicker.js"></script>
<script src="includes/js/jquery/form.js"></script>
<style>
    .tdKey{
        font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; width:13em; font-size:14px ; padding-top:1.25rem; padding-left: 1.25rem ;  color: #000;
    }
    .tdValue{
        padding-top: 1.35rem;
    }
</style>
<style>
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
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
    margin-top:11.5%;
} 
.ISSelectDiv{
    height:150px !important;
    width:410px !important;
    overflow-x: auto;
    margin-top: 10px;
}
.submitTableBtn{
    width:180px;
}
.HelpToolTipDiv{
    margin-left:10px !important;
}
.HelpToolTip img:first-child{
    margin-top:0px;
    margin-left:2px;
}
.Field250{
    width:410px;
    margin-right:0px;
}
.Field350 {
    width:410px !important;
    padding-right:0px;
}
input.ISSelectSearch {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.form-control {
    display:inline;
}
.customRadio {
    width:410px;
}
.customCheckBox {
    width:405px;
    margin-left:0px;
}
.buttons {
    padding-left: 0px !important;
}
@media screen and (max-width:1024px){
    .multiselectTd{
        display:inline;
    }
    .form-control {
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:410px !important;
        overflow-x: auto;
        margin-top: 10px;
    }
    .nextCancelButton {
        margin-top:0%;
    } 
    .HelpToolTipDiv{
        margin-left:10px !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:410px;
    }
    .customCheckBox {
        width:405px;
        margin-left:0px;
    }
    .submitTableBtn{
        width:182px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -130px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px;
        margin-left:2px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    input.ISSelectSearch {
        width:410px;
    }
    .width20Percent{
        width:13em !important;
        font-size:14px !important;
    }
    .Field250{
        width:410px;
        margin-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    .Field350 {
        width:410px !important;
        padding-right:0px;
    }
    select {
        width:410px !important;
    }
    .datefield {
        width:100px !important;
    }
    .thirdPartyTable{
        width:920px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .tdValue {
        //padding-top: 0.5rem !important;
    }
}
@media screen and (max-width:823px){
    .multiselectTd{
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:400px !important;
        overflow-x: scroll;
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
    input.ISSelectSearch {
        width:400px;
    }
    .width20Percent{
        width:13em !important;
        font-size:14px !important;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
        width:320px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:320px;
    }
    .submitTableBtn{
        width:168px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:2px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:12em !important;
        padding-top: 20px;
        font-size:14px !important;
    }
    .Field250 {
        width:320px !important;
        margin-right:5px;
    }
    .Field350 {
        width:320px !important;
        padding-right:0px;
        margin-right:5px;
    }
    select {
        width:320px !important;
        margin-right:5px;
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
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:320px !important;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
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
        margin-top: 20px;
    }
    .customCheckBox {
        width:210px;
    }
    .submitTableBtn{
        width:156px;
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
        padding-top: 20px;
        font-size:14px !important;
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
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:170px !important;
    }
    .thirdPartyTable{
        width:375px !important;
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
    }
    .BodyContainer {
        margin:0px 0px;
        width: 100%;
    }
    .twoColumns {
        display:flex;
        flex-direction:column;
        font-size:14px !important;
    }
    .twoColumns td{
        width:100%
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .twoColumnsTable {
        font-size: 14px !important;
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
        margin-top: 20px;
    }
    .customCheckBox {
        width:210px;
    }
    .submitTableBtn{
        width:156px;
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
        width:13em !important;
        font-size:14px !important;
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
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:210px !important;
    }
    .datefield {
        width:70px !important;
    }
    .thirdPartyTable{
        width:375px !important;
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
    }
    .BodyContainer {
        margin:0px 5px;
        width: 100%;
    }
    .twoColumns {
        display:flex;
        flex-direction:column;
        font-size:14px !important;
    }
    .twoColumns td{
        width:100%
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .twoColumnsTable {
        font-size: 14px !important;
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
        width:185px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:200px;
        margin-top:15px;
    }
    .submitTableBtn{
        width:135px;
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
        width:13em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top:15px;
    }
    select {
        width:200px !important;
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
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width:70px !important;
    }
    .thirdPartyTable{
        width:335px !important;
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
    }
    .BodyContainer {
        margin:0px 0px;
        width: 100%;
    }
    .twoColumns {
        display:flex;
        flex-direction:column;
        font-size:14px !important;
    }
    .twoColumns td{
        width:100%
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .twoColumnsTable {
        font-size: 14px !important;
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
        width:200px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:200px;
    }
    .submitTableBtn{
        width:156px;
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
        width:12em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
    }
    select {
        width:200px !important;
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
    .secondRow{
        padding-top:15px;
        padding-bottom:10px;
    } 
    .ISSelectDiv{
        height:150px !important;
        width:200px !important;
    }
    .datefield {
        width:70px !important;
    }
    .thirdPartyTable{
        width:335px !important;
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
    }
    .BodyContainer {
        margin:0px 0px;
        width: 100%;
    }
    .twoColumns {
        display:flex;
        flex-direction:column;
        font-size:14px !important;
    }
    .twoColumns td{
        width:100%
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .twoColumnsTable {
        font-size: 14px !important;
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
        width:200px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 18px;
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
        width:10em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 18px;
    }
    select {
        width:200px !important;
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
        width:70px !important;
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
    }
    .BodyContainer {
        margin:0px 0px;
        width: 100%;
    }
    .twoColumns {
        display:flex;
        flex-direction:column;
        font-size:14px !important;
    }
    .twoColumns td{
        width:100%
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .twoColumnsTable {
        font-size: 14px !important;
    }
}
@media screen and (max-width:320px){
    .BodyContainer {
        margin:0px 0px;
        width: 100%;
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
        margin-top: 20px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:95px;
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
        width:8.5em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:170px !important;
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
        width:170px !important;
    }
    .datefield {
        width:70px !important;
    }
    .thirdPartyTable{
        width:270px !important;
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
    }
    .BodyContainer {
        margin:0px 0px;
        width: 100%;
    }
    .twoColumns {
        display:flex;
        flex-direction:column;
        font-size:14px !important;
    }
    .twoColumns td{
        width:100%
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .twoColumnsTable {
        font-size: 14px !important;
    }
}
</style>
<script>%%GLOBAL_DatePickerJavascript%%</script>
<div id="eventAddFormDiv" style="display:none;">
    %%GLOBAL_EventAddForm%%
</div>


<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
    <tr class="whiteBackground">
        <td class="Heading1 col-sm-4 Heading1New">
            %%LNG_Subscribers_View%%
        </td>
    </tr>
    <tr class="whiteBackground">
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP">
                %%LNG_Subscribers_View_Intro%%
            </p>
        </td>
    </tr>
    <tr class="whiteBackground">
        <td>
            %%GLOBAL_Message%%
        </td>
    </tr>
    <tr class="whiteBackground">
        <td>
            %%GLOBAL_EditButton%%
            %%GLOBAL_DeleteButton%%
            <input class="FormButton SaveAddButton btn save-btn" type="button" value="%%LNG_Done%%" onClick='document.location = "index.php?Page=Subscribers&Action=Manage&SubAction=Step3"'>
            <br />&nbsp;
            <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground col-sm" style="border-bottom:none">
                <tr class="whiteBackground">
                    <td colspan="4" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                        &nbsp;&nbsp;%%LNG_EditSubscriberDetails%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Required"}
                        %%LNG_Email%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_emailaddress%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Required"}
                        %%LNG_Format%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_FormatList%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Required"}
                        %%LNG_ConfirmedStatus%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_ConfirmedList%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Required"}
                        %%LNG_SubscriberStatus%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_StatusList%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Not_Required"}
                        %%LNG_SubscribeRequestDate%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_requestdate%%&nbsp;%%LNG_HLP_SubscribeRequestDate%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Not_Required"}
                        %%LNG_SubscribeRequestIP%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_requestip%%&nbsp;%%LNG_HLP_SubscribeRequestIP%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Not_Required"}
                        %%LNG_SubscribeConfirmDate%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_confirmdate%%&nbsp;%%LNG_HLP_SubscribeConfirmDate%%
                    </td>
                </tr>
                <tr class="whiteBackground">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Not_Required"}
                        %%LNG_SubscribeConfirmIP%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_confirmip%%&nbsp;%%LNG_HLP_SubscribeConfirmIP%%
                    </td>
                </tr>
                <tr style='display: %%GLOBAL_ShowUnsubscribeInfo%%' class="FieldLabel col-form-label col-md-4 col-12 tdKey">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Not_Required"}
                        %%LNG_UnsubscribeTime%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_unsubscribetime%%&nbsp;%%LNG_HLP_UnsubscribeTime%%
                    </td>
                </tr>
                <tr style='display: %%GLOBAL_ShowUnsubscribeInfo%%' class="FieldLabel col-form-label col-md-4 col-12 tdKey">
                    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
                        {template="Not_Required"}
                        %%LNG_UnsubscribeIP%%:&nbsp;
                    </td>
                    <td class="tdValue">
                        %%GLOBAL_unsubscribeip%%&nbsp;%%LNG_HLP_UnsubscribeIP%%
                    </td>
                </tr>
                %%GLOBAL_CustomFieldInfo%%
            </table>
        </td>
    </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%" align="center" style="border-collapse: collapse; border-bottom:none">
    <tr class="whiteBackground">
        <td class="Heading1 col-sm-4 Heading1New" style="padding: 20px 0px; border-top :1px solid rgba(204, 204, 204, 0.35);border-bottom :1px solid rgba(204, 204, 204, 0.35);">
            %%LNG_SubscriberEvents%%
        </td>
    </tr>
    <tr class="whiteBackground">
        <td class="body pageinfo internalAnchor" style="padding-top: 1.2rem;">
            <p class="PageIntroP">%%GLOBAL_SubscriberEvents_Intro%%</p>
        </td>
    </tr>
    <tr class="whiteBackground">
        <td>
            <div id="eventsTable"></div>
        </td>
    </tr>
</table>

<script>
    {template="subscribers_events_table_javascript"}
</script>



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
<style>
input.ISSelectSearch {
	margin-top: 15px;
	 display: initial;
	 font-size: 14px;
	 padding: 0 10px;
}
</style>