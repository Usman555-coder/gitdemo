<script>
    Application.Page.StatsNewsletterManage = {
        eventDOMReady: function (event) {
            Application.Ui.CheckboxSelection('table#StatisticsNewsletterManageList',
                    'input.UICheckboxToggleSelector',
                    'input.UICheckboxToggleRows');
        }
    };

    Application.init.push(Application.Page.StatsNewsletterManage.eventDOMReady);
</script>
<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td class="Heading1 Heading1New">%%LNG_Stats_NewsletterStatistics%%</td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor"><p class="PageIntroP">%%LNG_Stats_Newsletters_Step1_Intro%%</p></td>
    </tr>
    <tr>
        <td>
            %%GLOBAL_Message%%
        </td>
    </tr>
    <tr>
        <td class="body">
            <form name="mystatsform" method="post" action="index.php?Page=Stats&Action=Newsletters&SubAction=DoSelect">
                <table width="100%" border="0" style="margin-top: 15px;">
                    <tr>
                        <td valign="top">
                            <select name="SelectAction" class="form-control selectBoxTrigger">
                                <option value="" SELECTED>%%LNG_ChooseAction%%</option>
                                <option value="delete">%%LNG_Delete_Stats_Selected%%</option>
                                <option value="export">%%LNG_Export_Stats_Selected%%</option>
                                <option value="print">%%LNG_Print_Stats_Selected%%</option>
                            </select>
                            <input type="submit" name="cmdSelectAction" value="%%LNG_Go%%" class="goButton Text" onclick="return DoSelectedStats();" />
                        </td>
                    </tr>
                </table>
                <div class="thirdPartyTable"> 
                    <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Text table" id="StatisticsNewsletterManageList">
                        <tr class="Heading3">
                            <td align="center">
                                <label class="customCheckBox">
                                    <input type="checkbox" name="toggle" class="UICheckboxToggleRows UICheckboxToggleSelector" />
                                    <span class="checkmark"></span>
                                </label>
                            </td>
                            <td></td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Newsletter&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Newsletter&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_NewsletterName%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=List&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=List&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_ListName%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=StartDate&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=StartDate&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_DateStarted%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=FinishDate&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=FinishDate&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_DateFinished%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Recipients&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Recipients&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_TotalRecipients%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Unsubscribes&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Unsubscribes&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_UnsubscribeCount%%
                            </td>
                            <td>
                                <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Bounces&Direction=Up'>
                                            <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href='index.php?Page=Stats&Action=Newsletters&SubAction=Step1&SortBy=Bounces&Direction=Down'>
                                            <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                                %%LNG_BounceCount%%
                            </td>
                            <td>
                                %%LNG_Action%%
                            </td>
                        </tr>
                        %%TPL_Stats_Newsletter_Manage_Row%%
                    </table>
                </div>
            </form>
            <br/>
            %%TPL_Paging%%
        </td>
    </tr>
</table>
<script>

    function DoSelectedStats() {
        if (document.forms['mystatsform'].SelectAction.value == 'delete') {
            // Require confirmation to delete
            formObj = document.forms['mystatsform'];
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
        } else if (document.forms['mystatsform'].SelectAction.value == 'print') {
            var url = 'remote_stats.php?height=380&width=420&statstype=n&overflow=none&Action=print';

            formObj = document.forms['mystatsform'];
            stats_found = 0;
            for (var i = 0; i < formObj.length; i++)
            {
                fldObj = formObj.elements[i];
                if (fldObj.type == 'checkbox')
                {
                    if (fldObj.checked) {
                        url = url + '&stats[]=' + fldObj.value;
                    }
                }
            }
            tb_show('', url);
            return false;
        }
        return true;
    }

    function ConfirmDelete(StatsID) {
        if (!StatsID) {
            return false;
        }

        if (confirm("%%LNG_DeleteStatsPrompt%%")) {
            document.location = 'index.php?Page=Stats&Action=Newsletters&SubAction=DoSelect&SelectAction=Delete&id=' + StatsID;
        }
    }
</script>

<style>
.Heading3 TD:nth-child(2) {
    padding: 0px 22px;
}
#TB_ajaxContent {
    height: auto !important;
}
.button_div .FormButton
{
	width:106px;
}
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
    width: 155px;
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
    width: 93.5vw;
    overflow-x: scroll;
}
.GridRow TD:not(:first-child):(:last-child) {
    padding-left: 20px;
    padding-right: 0px;
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
    #SelectAction {
        width:140px !important;
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
        width:93.5vw !important;
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
    .Heading3 TD:nth-child(2) {
    padding: 0px 22px;
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
    .HelpToolTip_Placeholder {
        margin:26px -150px !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
    padding-right: 35px !important;
    }
}
@media screen and (max-width:568px){
	.HelpToolTip_Placeholder{
		margin-left:-90px!important;
	}
	#TB_window
	{
        margin-left: 4px !important;
        left: 0% !important;
        width: 98vw !important;
	}
	#TB_ajaxContent
	{
		width: 100% !important;
        font-family: "Roboto", Arial, Tahoma, sans-serif;
        font-size: 14px;
	}
    #TB_title {
        padding-bottom:0px;
    }
    #TB_ajaxWindowTitle {
        padding-bottom:7px;
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
    .SmallButton {
        width:10.5rem !important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-525px!important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-575px!important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-550px!important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-590px!important;
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
    .SmallButton {
        width:10.5rem !important;
    }
	.HelpToolTip_Placeholder{
		margin-left:-620px!important;
	}

}

.Heading3 TD:nth-child(2) {
    padding: 0px 24px !important;
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