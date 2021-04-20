<div style="display: none" id="ProgressWindow">
    <div id="ProgressBarDiv" style="text-align: center;"><br/><span id="ProgressBarText" class="ProgressBarText">%%LNG_ImageManagerImageUpload%%</span><br/><br/><br/>
        <div style="border: 1px solid #ccc; width: 300px; padding: 0px; margin: 0 auto; position: relative;">
            <div class="progressBarPercentage" style="margin: 0; padding: 0; background: url('images/progressbar.gif') no-repeat; height: 20px; width: 0%; ">
                &nbsp;
            </div>
            <div style="position: absolute; top: 0px; left: 0; text-align: center; width: 300px; font-weight: bold;line-height:1.5;color:#333333;font-family:Tahoma;font-size:11px;" class="progressPercent">&nbsp;</div>
        </div>
        <span id="progressBarStatus" class="progressBarStatus" style="text-align: center; font-size: 10px; color: gray; padding-top: 5px;">&nbsp;</span>
    </div>

</div>

<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">%%LNG_ImageManagerManage%%</td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP">%%LNG_Help_ImageManagerManage%%</p>
        </td>
    </tr>
    <tr>
        <td>
            <div id="MainMessage">
                %%GLOBAL_Message%%
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0">
                <tr class="twoButtons">
                    <td valign="top" style="float:left;" >
                        <span id="spanButtonPlaceholder"></span>
                        %%GLOBAL_ImageManager_AddButton%%
                        %%GLOBAL_ImageManager_DeleteButton%%
                    </td>
                    <td id="pagination" align="right" valign="top" style="display:%%GLOBAL_DisplayImagePanel%%;">
                        
                        <div class="SortBy" >
                            %%LNG_SortBy%%: <select name="SortBy" class="Field form-control" style="width: 170px; margin-bottom:4px;" onChange="ChangeImageManagerSorting(this, '{$PageNumber}');">
                                %%GLOBAL_SortList%%
                            </select>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<div id="hasImages" style="display: %%GLOBAL_DisplayImagePanel%%;">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td class="body">
                <table border=0 cellspacing="0" cellpadding="0" width=100% class="Text">
                    <tr class="Heading3">
                        <td nowrap>
                            <label class="customCheckBox"><input type="checkbox" name="toggleAllChecks" class="UICheckboxToggleSelector" id="toggleAllChecks" onclick="AdminImageManager.CheckAllCheckBoxes(this);"/><span class="checkmark"></span></label> <label for="toggleAllChecks"><span id="ImgNum">%%GLOBAL_NumImageShown%%</span></label>
                        </td>
                    </tr>
                    <tr class="GridRow">
                        <td style="padding:0pt;">
                            <div id="imagesList"><script type="text/javascript">
                                <!--
						%%GLOBAL_dirImages%%
                                        //-->
                                </script>

                            </div>
                            
                        </td>
                </table>
                &nbsp;
                <div>{$Pagination}</div>
            </td>
        </tr>
    </table>
</div>
<style>
*{
    box-sizing:border-box;
}
#ImgNum{
    font-family:'Roboto', Arial, Tahoma, sans-serif;
}
.SortBy{
    float:right;
    padding-right:10px;
}
.ContentContainer {
    width:100% !important;
}
.BodyContainer{
    width:98.5%;
    margin:10px 10px 10px 7px;
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
.ui-window .content-container, #ModalContentContainer {
    height: auto !important;
    margin-bottom: 10px;
    padding-bottom: 10px;
}
.modalData, .ModalContainer {
    height: auto !important;
}
.ManageImageBox {
    width: 235px;
}
#btnUpload, #deleteButton {
    margin-top:4px;
}

@media screen and (max-width:1024px){    
    .ManageImageBox {
        width: 232px;
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
        width:98.5%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:925px !important;
    }
    .twoButtons {
        //display: flex;
        //flex-direction: column;
    }
    .twoButtons td {
        //text-align: right;
    }
    .thirdPartyTable{
        width:920px !important;
        overflow-x:scroll !important;
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
    .ManageImageBox {
        width: 230px;
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
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .SortBy{
        //float:left;
    }
}
@media screen and (max-width:768px){
    .ManageImageBox {
        width: 230px;
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
        overflow-x:scroll !important;
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
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .ManageImageBox {
        width: 100%;
    }
    .imageNavDiv {
        width: 100% !important;
        height: 150px;
        margin-top: 5px;
    }
    .SortBy{
        float:left;
        margin-top: 5px;
    }
}
@media screen and (max-width:414px){
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
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .ManageImageBox {
        width: 100%;
    }
    .imageNavDiv {
        width: 100% !important;
        height: 150px;
        margin-top: 5px;
    }
    .SortBy{
        float:left;
        margin-top: 5px;
    }
}
@media screen and (max-width:411px){
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
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .ManageImageBox {
        width: 100%;
    }
    .imageNavDiv {
        width: 100% !important;
        height: 150px;
        margin-top: 5px;
    }
    .SortBy{
        float:left;
        margin-top: 5px;
    }
}
@media screen and (max-width:375px){
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
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .ManageImageBox {
        width: 100%;
    }
    .imageNavDiv {
        width: 100% !important;
        height: 150px;
        margin-top: 5px;
    }
    .SortBy{
        float:left;
        margin-top: 5px;
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
        margin:10px 10px 10px 10px;
    }
    .parentTableDiv{
        width:335px !important;
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
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .ManageImageBox {
        width: 100%;
    }
    .imageNavDiv {
        width: 100% !important;
        height: 150px;
        margin-top: 5px;
    }
    .SortBy{
        float:left;
        margin-top: 5px;
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
        overflow-x:scroll !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
    .ManageImageBox {
        width: 100%;
    }
    .imageNavDiv {
        width: 100% !important;
        height: 150px;
        margin-top: 5px;
    }
    .SortBy{
        float:left;
        margin-top: 5px;
    }
}
</style>