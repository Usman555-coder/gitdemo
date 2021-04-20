<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td class="Heading1 Heading1New">%%LNG_Stats_List_Step1_Heading%%</td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor"><p>%%LNG_Stats_List_Step1_Intro%%</p></td>
    </tr>
    <tr>
        <td>
            %%GLOBAL_Message%%
        </td>
    </tr>
    <tr>
        <td class="body">

            <form>
                <div class="thirdPartyTable">
                    <table border=0 cellspacing="0" cellpadding="2" width=100% class="Text table">
                        <tr class="Heading3">
                            <td></td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Name&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Name&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_MailingList%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Date&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Date&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_Created%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Subscribers&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Subscribers&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_Subscribers%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Unsubscribes&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=List&SubAction=Step1&SortBy=Unsubscribes&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_UnsubscribeCount%%
                            </td>
                            <td align="center">
                                %%LNG_Action%%
                            </td>
                        </tr>
                        %%TPL_Stats_Lists_Manage_Row%%
                    </table>
                </div>
                %%TPL_Paging_Bottom%%
        </td>
    </tr>
    <tr>
    <td><br />
                <table width="100%" border="0">
                <tr>
                    <td align="right">
                        %%TPL_Paging%%
                    </td>
                </tr>
            </table>
    </td>
    </tr>
</table>

<script>

    function DeleteSelectedStats(formObj) {
        stats_found = 0;
        for (var i = 0; i < formObj.length; i++)
        {
            fldObj = formObj.elements[i];
            if (fldObj.type == 'checkbox')
            {
                if (fldObj.checked) {
                    stats_found++;
                }
            }
        }

        if (stats_found <= 0) {
            alert("%%LNG_ChooseStatsToDelete%%");
            return false;
        }

        if (confirm("%%LNG_DeleteStatsPrompt%%")) {
            return true;
        }
        return false;
    }

    function ConfirmDelete(StatsID) {
        if (!StatsID) {
            return false;
        }

        if (confirm("%%LNG_DeleteStatsPrompt%%")) {
            document.location = 'index.php?Page=Stats&Action=Autoresponders&SubAction=Delete&id=' + StatsID;
        }
    }
</script>


<style>
#TB_window {
    position: fixed;
    background: #ffffff;
    z-index: 102;
    color: #000000;
    display: none;
    border: 4px solid #525252;
    text-align: left;
    top: 10%;
    left: 50%;
}
.printDiv {
	padding:8px;
	font-size:14px;
	font-family: 'Roboto', Arial, Tahoma, sans-serif;
}
.customCheckBox {
    padding-bottom: 13px;
}
.HelpToolTip_Placeholder {
    z-index: 5;
}
.Heading3 TD {
    padding: 0.75rem;
    padding-right: 16px;
	padding-left: 16px;
}
.form-control {
	height:40px;
	display: initial;
    width: 130px;
}
.BodyContainer {
    width: 98.5%;
    margin: 10px 10px 10px 7px;
}
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
.parentTableDiv {
    width:100%;
}
.nextCancelButton {
    margin-top:11.5%;
}
.submitTableBtn{
    width:180px;
}
.Field250{
    width:410px;
    margin-right:0px;
}
.Field350 {
    width:410px !important;
    padding-right:0px;
}
.form-control {
    display:inline;
}
TR.GridRow TD {
    font-size: 14px !important;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    vertical-align: middle;
    font-size: 100%;
    border-bottom: solid 1px #edecec;
    word-break: break-word;
}
.thirdPartyTable {
    margin-top:25px;
}
@media screen and (max-width:1024px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:98.5%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:100% !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:100% !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        //flex-direction: column !important;
        //padding:10px 0px;
        //align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
}
@media screen and (max-width:945px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:905px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:895px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        //flex-direction: column !important;
        //padding:10px 0px;
        //align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
}
@media screen and (max-width:830px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:795px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:780px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        //flex-direction: column !important;
        //padding:10px 0px;
        //align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
}
@media screen and (max-width:823px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
}
@media screen and (max-width:768px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:98%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:720px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
}
@media screen and (max-width:568px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .SmallButton {
        width:10.5rem !important;
    }
    .Heading3 Td:nth-child(-n+5) {
        padding-right: 25px !important;
    }
}
@media screen and (max-width:414px){
        #TB_window {
            left: 1%;
            width:98vw !important;
            margin-left: 0px !important;
    }
    #TB_ajaxContent
    {
        width:100% !important;
        height: 630px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:375px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .SmallButton {
        width:10.5rem !important;
    }
    .Heading3 Td:nth-child(-n+5) {
        padding-right: 25px !important;
    }
}
@media screen and (max-width:411px){
    #TB_window {
            left: 1%;
            width:98vw !important;
            margin-left: 0px !important;
    }
    #TB_ajaxContent
    {
        width:100% !important;
        height: 600px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:385px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .SmallButton {
        width:10.5rem !important;
    }
    .Heading3 Td:nth-child(-n+5) {
        padding-right: 25px !important;
    }
}
@media screen and (max-width:375px){
            #TB_window {
            left: 1%;
            width:98vw !important;
            margin-left: 0px !important;
    }
    #TB_ajaxContent
    {
        width:100% !important;
        height: 640px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:345px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:335px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .SmallButton {
        width:10.5rem !important;
    }
    .Heading3 Td:nth-child(-n+5) {
        padding-right: 25px !important;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 8px;
    }
    .parentTableDiv{
        width:290px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:295px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .SmallButton {
        width:10.5rem !important;
    }
    .Heading3 Td:nth-child(-n+5) {
        padding-right: 25px !important;
    }
}
@media screen and (max-width:320px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .submitTableBtn{
        width:96px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
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
    .FieldLabel{
        padding-left:0px;
        color: #000 !important;
    }
    select {
        width:70px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:285px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:255px !important;
        overflow-x:auto !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .SmallButton {
        width:10.5rem !important;
    }
    .Heading3 Td:nth-child(-n+5) {
        padding-right: 25px !important;
    }
}
#TB_ajaxContent {
    height:auto !important;
}
.Heading3 TD:nth-child(2) {
    padding-right:200px !important;
}
.Heading3 TD:nth-child(3) {
    padding-right:50px !important;
}
.Heading3 TD:nth-child(4), .Heading3 TD:nth-child(5) {
    padding-right:16px;
}
TR.GridRow TD:nth-child(4), TR.GridRow TD:nth-child(5) {
    padding-left:50px;
}
.Heading3 TD:nth-child(6) {
    padding-left:10px;
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
    max-height: 400px !important;
    overflow-y: scroll !important;
    overflow-x: hidden !important;
}
</style>