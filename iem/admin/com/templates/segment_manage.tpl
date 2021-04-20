<script>
    Application.Page.SegmentManage = {
        eventDOMReady: function (event) {
            Application.Ui.CheckboxSelection('table#SegmentManageList',
                    'input.ToggleSelector',
                    'input.SegmentManageSegmentSelection');

            $(document.frmSegment.cmdAddSegment).click(Application.Page.SegmentManage.eventAddSegment);
            $(document.frmSegment.cmdChangeType).click(Application.Page.SegmentManage.eventActionCommandClicked);
            $('.SortableColumn').click(Application.Page.SegmentManage.eventClickSortableColumnHeader);
            $('.SegmentManageDeleteLink').click(Application.Page.SegmentManage.eventDeleteSegment);

            Application.Page.SegmentManage.getSegmentCount();

            if ($('#GLOBAL_Message').html() != '')
                $('#GLOBAL_Message_Container').show();
        },
        eventAddSegment: function (event) {
            Application.Util.submitGet('index.php', {Page: 'Segment',
                Action: 'Create'});
        },
        eventActionCommandClicked: function (event) {
            if (document.frmSegment.ChangeType.selectedIndex == 0) {
                alert('%%LNG_PleaseChooseAction%%');
                return;
            }

            if ($('input.SegmentManageSegmentSelection:checked').size() == 0) {
                alert('%%LNG_SegmentAlertChooseSegment%%');
                return;
            }

            switch (document.frmSegment.ChangeType.value) {
                case 'BulkDelete':
                    var selected = $('.SegmentManageSegmentSelection').filter(function () {
                        return this.checked;
                    });
                    var selectedNames = [];

                    for (var i = 0, j = selected.length; i < j; ++i) {
                        selectedNames.push(selected[i].title);
                    }

                    if (confirm('%%LNG_SegmentManageConfirmDeleteMany%%'.replace('%s', '\'' + selectedNames.join('\', \'') + '\''))) {
                        document.frmSegment.action = 'index.php?Page=Segment&Action=Delete';
                        document.frmSegment.submit();
                    }
                    break;
            }
        },
        eventClickSortableColumnHeader: function (event) {
            event.preventDefault();

            var param = this.id.match(/hrefColumnSort_(.*?)_(.*)/);

            if (param.length != 3)
                return;
            Application.Util.submitGet('index.php', {Page: 'Segment',
                SortBy: param[1],
                Direction: param[2]});
        },
        eventDeleteSegment: function (event) {
            event.preventDefault();

            if (confirm('%%LNG_SegmentManageConfirmDeleteOne%%'.replace('%s', this.title))) {
                var segmentID = $(this).attr('id').match(/hrefSegmentManageDelete_(\d*)/);
                if (segmentID.length != 2)
                    return;

                Application.Util.submitPost('index.php?Page=Segment&Action=Delete', {Segments: segmentID[1]});
            }
        },
        getSegmentCount: function () {
            var elm = $('.SegmentSubscriberCount_Unprocessed').get(0);

            if (elm) {
                var segmentid = $(elm).attr('id').match(/sectionSegmentSubscriberCount_(\d*)/);
                if (segmentid.length != 2)
                    return;
                $.post('index.php?Page=Segment&Action=Ajax',
    {ajaxType: 'GetSubscriberCount',
                            segmentID: segmentid[1]},
                        function (response) {
                            var elm = $('.SegmentSubscriberCount_Unprocessed').get(0);
                            $(elm).removeClass('SegmentSubscriberCount_Unprocessed');

                            try {
                                var temp = eval('(' + response + ')');
                                $(elm).html('' + temp.output);
                            } catch (e) {
                                $(elm).html('-');
                            }

                            Application.Page.SegmentManage.getSegmentCount();
                        });
            }
        }
    };

    Application.init.push(Application.Page.SegmentManage.eventDOMReady);
</script>
<div class="parentTableDiv">
<table cellspacing="0" cellpadding="0" width="100%" align="center" style="margin: 0px; padding: 0px;">
    <tr><td class="Heading1 col-sm-4 Heading1New">%%LNG_SegmentManage%%</td></tr>
    <tr><td class="body pageinfo internalAnchor"> <p class="PageIntroP" >%%LNG_Help_SegmentManage%%</p></td></tr>
    <tr id="GLOBAL_Message_Container" style="display:none;"><td id="GLOBAL_Message">%%GLOBAL_Message%%</td></tr>
    <tr>
        <td class=body>
            <form name="frmSegment" method="post" action="index.php?Page=Segment" style="margin: 0px;padding: 0px;">
                <span class=body>%%GLOBAL_ListsReport%%</span>
                <table width="100%" border="0">
                    <tr>
                        <td>
                            <div style="float:left;padding-top:10px; padding-bottom:10px display: %%GLOBAL_CreateButtonDisplayProperty%%;">
                                <input type="button" name="cmdAddSegment" value="%%LNG_SegmentManageCreateNew%%" title="%%LNG_SegmentManageCreateNew_Title%%" class="createCamp SmallButton btn save-btn" style="width: 170px" />
                            </div>
                            <div class="selectField selectfil">
                            <select class="form-control ChangeTypeSelect" name="ChangeType" style="width:344px; display:inline-block; height:41px">
                                <option value="" SELECTED>%%LNG_ChooseAction%%</option>
                                <option value="BulkDelete">%%LNG_SegmentDelete%%</option>
                            </select>
                            <input type="button" class="goButton" name="cmdChangeType" value="%%LNG_Go%%" class="Text" />
                            </div>
                        </td>
                        {* <td align="right" valign="bottom">
                            {template="Paging"}
                        </td> *}
                    </tr>
                </table>
                <div class="thirdPartyTable">
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Text table" id="SegmentManageList"  style="margin-top:10px ; border-bottom:0px">
                    <tr class="Heading3">
                        <td nowrap align="center">
                        <label class="customCheckBox">
                            <input type="checkbox" name="chkToggle" class="ToggleSelector" />
                        <span class="checkmark"></span>
                        </td>
                        <td style="width:63px;"></td>
                        <td >
                        <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                        <span>
                                            <a id="hrefColumnSort_SegmentName_Up" class="SortableColumn" href="index.php?Page=Segment">
                                                <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                        <span>
                                            <a id="hrefColumnSort_SegmentName_Down" class="SortableColumn" href="index.php?Page=Segment">
                                                <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                        </div>
                            %%LNG_SegmentName%%&nbsp;
                        </td>
                        <td >

                         <div class="sorting position-relative pl-1" style="cursor: pointer; margin-left:-16px";">
                                        <span>
                                            <a id="hrefColumnSort_CreateDate_Up" class="SortableColumn" href="index.php?Page=Segment">
                                                <i class="fa fa-caret-up position-absolute" style="color: #d5d5d5;bottom: -10px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                        <span>
                                            <a id="hrefColumnSort_CreateDate_Down" class="SortableColumn" href="index.php?Page=Segment">
                                                <i class="fa fa-caret-down position-absolute" style="color: #d5d5d5;top: 4px;" aria-hidden="true"></i>
                                            </a>
                                        </span>
                        </div>
                            %%LNG_Created%%&nbsp;
                        </td>
                        <td align="center">%%LNG_Subscribers%%</td>
                        <td >%%LNG_Action%%</td>
                    </tr>
                    %%GLOBAL_SegmentList%%
                </table>
                </div>
                {template="Paging_Bottom"}
            </form>
        </td>
    </tr>
</table>
</div>

<style>
    .selectfil{
        margin-top:12px !important;
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
    width: 98.5%;!important;
}
#NewsletterManageList td:nth-child(3) {
    word-break:break-word !important;
}
    .Heading3 TD:first-child, .GridRow TD:first-child {
        padding:0px;
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
        width:100 !important;
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
    .Heading3 TD:first-child, .GridRow TD:first-child {
        padding:0px;
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
        width:193px !important;
    }
    .selectField{
        clear:both;
        float:left;
    }
    .BodyContainer{
        width:98% !important;
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
        width:192px !important;
    }
    .BodyContainer{
        width:98% !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(0)):not(:nth-last-child(0)), .SegmentSubscriberCount {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
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
        width:95% !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(0)):not(:nth-last-child(0)), .SegmentSubscriberCount {
        padding-right: 35px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
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
    .ChangeTypeSelect  {
        width:170px !important;
    }
    .BodyContainer{
        width:95% !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(0)):not(:nth-last-child(0)), .SegmentSubscriberCount {
        padding-right: 45px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .GridRow TD:not(:first-child):not(:nth-child(2)) {
        padding-left:5px;
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
        width:192px !important;
    }
    {* .selectField {
        margin-top:-2.5px;
    } *}
    .BodyContainer{
        width:95% !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(0)):not(:nth-last-child(0)), .SegmentSubscriberCount {
        padding-right: 45px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .GridRow TD:not(:first-child):not(:nth-child(2)) {
        padding-left:5px;
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
        width:95% !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(0)):not(:nth-last-child(0)), .SegmentSubscriberCount {
        padding-right: 45px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .GridRow TD:not(:first-child):not(:nth-child(2)) {
        padding-left:5px;
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
    {* .selectField {
        margin-top:13px !important;
    } *}
    .ChangeTypeSelect   {
        width:192px !important;
    }
    .BodyContainer{
        width:95% !important;
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
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(0)):not(:nth-last-child(0)), .SegmentSubscriberCount {
        padding-right: 45px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .GridRow TD:not(:first-child):not(:nth-child(2)) {
        padding-left:5px;
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
        width:192px !important;
    }
    {* .selectField {
        margin-top:-2.5px;
    } *}
    .BodyContainer{
        width:95% !important;
        margin:10px 10px 10px 7px;
    }
    .parentTableDiv{
        width:280px !important;
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
    .helptoolTipNewTh{
        margin:15px -469px !important;
    }
    .Heading3 Td:not(:first-child):not(:last-child):not(:nth-last-child(0)):not(:nth-last-child(0)), .SegmentSubscriberCount {
        padding-right: 45px !important;
    }
    .Heading3 Td:nth-last-child(2):nth-last-child(3) {
        padding-right: 15px !important;
    }
    .GridRow TD:not(:first-child):not(:nth-child(2)) {
        padding-left:5px;
    }
}
</style>

