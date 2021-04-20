<script>

    function sprintf() {
        var argv = sprintf.arguments;
        inputstring = argv[0];
        for (i = 1; i < argv.length; i++) {
            inputstring = inputstring.replace('%s', argv[i]);
        }
        return inputstring;
    }

    function TimeLeft(timediff) {
        if (timediff < 60) {
            if (timediff == 1) {
                return '%%LNG_TimeTaken_Seconds_One%%';
            }
            return sprintf('%%LNG_TimeTaken_Seconds_Many%%', timediff);
        }

        if (timediff >= 60 && timediff < 3600) {
            mins_left = (Math.floor(timediff / 60)).toFixed(0);
            secs_left = (Math.floor(timediff % 60)).toFixed(0);
            if (mins_left == 1) {
                mytimediff = '%%LNG_TimeTaken_Minutes_One%%';
            } else {
                mytimediff = sprintf('%%LNG_TimeTaken_Minutes_Many%%', mins_left);
            }
            if (secs_left > 0) {
                mytimediff += ', ' + sprintf('%%LNG_TimeTaken_Seconds_Many%%', secs_left);
            }
            return mytimediff;
        }

        hours_left = (Math.floor(timediff / 3600)).toFixed(0);

        if (hours_left < 24) {
            mins_left = (Math.floor(timediff % 3600) / 60).toFixed(0);

            if (hours_left == 1) {
                if (mins_left == 0) {
                    return '%%LNG_TimeTaken_Hours_One%%';
                }
                return sprintf('%%LNG_TimeTaken_Hours_One_Minutes%%', mins_left);
            }

            if (mins_left == 0) {
                return sprintf('%%LNG_TimeTaken_Hours_Many%%', hours_left);
            }
            return sprintf('%%LNG_TimeTaken_Hours_Many_Minutes%%', hours_left, mins_left);
        }

        days_left = (Math.floor(hours_left / 24)).toFixed(0);

        if (days_left < 30) {
            hours_left = hours_left - (days_left * 24);

            if (days_left == 1) {
                if (hours_left == 0) {
                    return '%%LNG_TimeTaken_Days_One%%';
                }
                return sprintf('%%LNG_TimeTaken_Days_One_Hours%%', hours_left);
            }

            if (hours_left == 0) {
                return sprintf('%%LNG_TimeTaken_Days_Many%%', days_left);
            }
            return sprintf('%%LNG_TimeTaken_Days_Many_Hours%%', days_left, hours_left);
        }

        // 24 months = 730
        if (days_left >= 30 && days_left <= 730) {
            months_left = (Math.floor(days_left / 30)).toFixed(0);
            days_left = days_left - (months_left * 30);

            if (months_left == 1) {
                if (days_left == 0) {
                    return '%%LNG_TimeTaken_Months_One%%';
                }
                return sprintf('%%LNG_TimeTaken_Months_One_Days%%', days_left);
            }

            if (days_left == 0) {
                return sprintf('%%LNG_TimeTaken_Months_Many%%', months_left);
            }
            return sprintf('%%LNG_TimeTaken_Months_Many_Days%%', months_left, days_left);
        }

        if (days_left > 730) {
            years_left = (Math.floor(days_left / 365)).toFixed(0);

            if (years_left == 1) {
                return sprintf('%%LNG_TimeTaken_Years_One%%');
            }
            return sprintf('%%LNG_TimeTaken_Years_Many%%', years_left);
        }

    }

    // have_refreshed is used to make sure the page doesn't continually refresh and never stop.
    function UpdateMyTimer(myid, updatetime, have_refreshed) {
        if (updatetime > 0) {
            docid = 'send_status_' + myid;
            document.getElementById(docid).innerHTML = TimeLeft(updatetime);
            if (updatetime > 3600) {
                setTimeout('UpdateMyTimer("' + myid + '", ' + (updatetime - 60) + ', ' + have_refreshed + ')', 60000);
            } else {
                setTimeout('UpdateMyTimer("' + myid + '", ' + (updatetime - 1) + ', ' + have_refreshed + ')', 1000);
            }
        } else {
            if (updatetime == 0) {
                if (have_refreshed == 0) {
                    setTimeout('document.location="index.php?Page=Schedule&R"', 2000);
                }
            } else {
                if (updatetime < 0) {
                    setTimeout('UpdateMyTimer("' + myid + '", ' + (updatetime + 1) + ', ' + have_refreshed + ')', 1000);
                }
            }
        }
    }

    function UpdateCronTimer(timediff, maxdiff, updatecrontime) {
        if (!updatecrontime) {
            return;
        }

        if (timediff <= 0) {
            timediff = maxdiff;
        }

        $('#cronscheduletime_container').show();
        document.getElementById('cronscheduletime').innerHTML = sprintf('%%LNG_CronWillRunInApproximately%%', TimeLeft(timediff));
        setTimeout('UpdateCronTimer(' + (timediff - 1) + ', ' + (maxdiff) + ', true)', 1000);
    }
</script>
<div class="parentTableDiv">
<form name="schedulesform" method="post" action="index.php?Page=Schedule&Action=Delete" onsubmit="return DeleteSelectedItems(this);">
<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">%%LNG_ScheduleManage%%</td>
    </tr>
    <tr id="cronscheduletime_container" style="display:none;">
        <td class="body pageinfo internalAnchor" >
            <p class="PageIntroP" >
                %%LNG_Help_ScheduleManage%%
            </p>
            <div id="cronscheduletime" style="background-color:#faa527 !important; padding:8px; margin-top:20px;color:#000000;"></div>
            <script>UpdateCronTimer('%%GLOBAL_CronTimeLeft%%', %%GLOBAL_CronTimeDifference%% , %%GLOBAL_UpdateCronTime%% );</script>
        </td>
    </tr>
    <tr>
        <td>
            %%GLOBAL_Message%%
        </td>
    </tr>
    <tr>
        <td>
            %%GLOBAL_CronWarning%%
        </td>
    </tr>
    <tr>
        <td class=body>
            <table width="100%" border="0">
                <tr>
                    <td class="Text">
                        <div style=" float:left;padding-top:10px; padding-bottom:10px">
                        %%GLOBAL_Newsletters_SendButton%%
                        <input type="submit" name="DeleteSchedulesButton" value="%%LNG_Delete_Selected%%" class="SmallButton btn save-btn deleteButton" style="width:180px">
                        </div>
                    </td>
                </tr>
            </table>
            <div class="thirdPartyTable">
                <table border=0 cellspacing="0" cellpadding="2" width=100% class="Text table">
                    <tr class="Heading3">
                        <td nowrap align="center">
                            <label class="customCheckBox">
                                <input type="checkbox" name="toggle" onClick="javascript: toggleAllCheckboxes(this);">
                                <span class="checkmark"></span>
                            </label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            %%LNG_NewsletterName%% -
                            %%LNG_NewsletterSubject%%
                        </td>
                        <td>%%LNG_Schedule_NewsletterType%%</td>
                        <td>%%LNG_MailingList%%</td>
                        <td>%%LNG_DateScheduled%%</td>
                        <td>%%LNG_Status%%</td>
                        <td>%%LNG_Action%%</td>
                    </tr>
                    %%TPL_Schedule_Manage_Row%%
                </table>
            </div>
            &nbsp;
            %%TPL_Paging%%
        </td>
    </tr>
</table>
</form>
</div>
<script>
    function DeleteSelectedItems(formObj) {
        items_found = 0;
        for (var i = 0; i < formObj.length; i++)
        {
            fldObj = formObj.elements[i];
            if (fldObj.type == 'checkbox')
            {
                if (fldObj.checked) {
                    items_found++;
                    break;
                }
            }
        }

        if (items_found <= 0) {
            alert("%%LNG_ChooseSchedulesToDelete%%");
            return false;
        }

        if (confirm("%%LNG_ConfirmRemoveSchedules%%")) {
            return true;
        }
        return false;
    }

    function ConfirmDelete(JobID) {
        if (!JobID) {
            return false;
        }
        if (confirm("%%LNG_DeleteSchedulePrompt%%")) {
            document.location = 'index.php?Page=Schedule&Action=Delete&job=' + JobID;
            return true;
        }
    }
</script>
<style>
.SmallButton {
    white-space: nowrap !important;
}
    .selectField{
        float:right;
        margin-top: 5.5px;
    }
    .HelpTextspan {
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: none !important;
    }
    .helptoolTipNew{
        margin:-75px 20px !important;
        padding:10px;
        width:225px;
        z-index:99 !important;
        border:0px !important;
        font-size: 13px;
        display: inline;
        position: absolute;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: none;
        padding: 10px;
    }
    .helptoolTipNewTh{
        margin:15px -175px !important;
        padding:10px;
        width:280px !important;
        z-index:99 !important;
        border:0px !important;
        font-size: 13px;
        position: absolute;
        background-color: #ffffff;
        webkit-border-radius: 0;
        -moz-border-radius: 0;
        -ms-border-radius: 0;
        border-radius: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        border: none;
        padding: 10px;
        white-space: normal !important;
        display: contents;
    }
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.pagingRowPadding {
    padding-right:0px !important;
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
.createCamp {
    width:12rem !important;
}
.BodyContainer {
    width: 98.5%;
}
#NewsletterManageList td:nth-child(3) {
    word-break:break-word !important;
}
    .Heading3 TD:not(:first-child) {
        padding-right:12px;
        padding-left:12px;
    }
    .Heading3 TD:nth-child(2) {
        padding:0px 22px;
    }
    .customCheckBox {
        padding-top:10px;
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
    .BodyContainer{
        width:100;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width: 920px !important;
        margin-left: 0px !important;
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
    .Heading3 TD:not(:first-child) {
        padding-right:12px;
        padding-left:12px;
    }
    .Heading3 TD:nth-child(2) {
        padding:0px 22px;
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
    .ChangeTypeSelect  {
        width:170px !important;
    }
    .selectField{
        clear:both;
        float:left;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
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
    #NewsletterManageList{
        margin-bottom: 0px;
        margin-top: 15px;
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
    .ChangeTypeSelect  {
        width:170px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:725px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:715px !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .BodyContainer {
        width: 98%;
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
    .ChangeTypeSelect  {
        width:170px !important;
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
    .helptoolTipNewTh{
        margin:15px -368px !important;
    }
    .pagingNew {
        flex-direction: column !important;
        padding:10px 0px;
        align-items:start !important;
    }
    .pagingNew td {
        padding-bottom:10px;
    }
     #AddSplitTestButton{
        margin-top:6px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    
}
@media screen and (max-width:414px){
     .deleteButton{
        margin-top:6px;
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
    .ChangeTypeSelect  {
        width:170px !important;
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
    .helptoolTipNewTh{
        margin:15px -432px !important;
    }
    #AddSplitTestButton{
        margin-top:6px;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 22px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:411px){
    #AddSplitTestButton{
        margin-top:6px;
        width:190px !important;
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
    .ChangeTypeSelect  {
        width:190px !important;
    }
    .selectField {
        margin-top:-2.5px;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:340px !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 22px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
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
    .ChangeTypeSelect   {
        width:170px !important;
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
    .helptoolTipNewTh{
        margin:15px -432px !important;
    }
    .PageIntroP{
        width:100%%;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 22px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
@media screen and (max-width:360px){
    #AddSplitTestButton{
        margin-top:6px;
        width:190px !important;
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
    .selectField {
        margin-top: -3.5px !important;
    }
    .ChangeTypeSelect   {
        width:190px !important;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 8px;
    }
    .parentTableDiv{
        width:295px !important;
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
    .helptoolTipNewTh{
        margin:15px -467px !important;
    }
    .ActivehelpTooltip{
        margin:15px -420px !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 22px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
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
    .ChangeTypeSelect  {
        width:190px !important;
    }
    .selectField {
        margin-top:-2.5px;
    }
    .BodyContainer{
        width:95%;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:265px !important;
    }
    .twoButtons {
        display: flex;
        flex-direction: column;
    }
    .twoButtons td {
        text-align: left;
    }
    .thirdPartyTable{
        width:265px !important;
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
    .helptoolTipNewTh{
        margin:15px -469px !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(2)):not(:nth-last-child(3)) {
        padding-right: 22px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
}
</style>
