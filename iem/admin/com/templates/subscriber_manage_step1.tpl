<script>
    var PAGE = {
        init: function () {
            $(document.frmManageSubscriberStep1).submit(function (event) {
                event.preventDefault();
                event.stopPropagation();
            });

            if (document.frmManageSubscriberStep1['segments[]'].options.length == 0)
                $('#ShowSegmentOptions').attr('disabled', true);

            $('.CancelButton').click(function () {
                PAGE.cancel();
            });

            $('.SubmitButton').click(function () {
                PAGE.submit();
            });

            $('#segments, #lists').dblclick(function () {
                PAGE.submit();
            });

            $('.SendFilteringOption').click(function () {
                PAGE.selectSendingOption(this.value);
            });
        },
        submit: function () {
            var filteringOptions = parseInt($('.SendFilteringOption:checked').val());

            switch (filteringOptions) {
                case 1:
                case 2:
                    var list = $('#lists').get(0);
                    if (list.selectedIndex == -1) {
                        alert("%%LNG_SelectList%%");
                        return;
                    }

                    if (filteringOptions == 2) {
                        var url = 'index.php?Page=Subscribers&Action=Manage&SubAction=step3';

                        for (var i = 0, j = list.options.length; i < j; i++) {
                            if (list.options[i].selected) {
                                url += '&Lists[]=' + list.options[i].value;
                            }
                        }

                        $(document.frmManageSubscriberStep1).attr('action', url);
                    }
                    break;
                case 3:
                    var segments = $('#segments').get(0);
                    if (segments.selectedIndex == -1) {
                        alert("%%LNG_SelectSegment%%");
                        return;
                    }

                    var url = 'index.php?Page=Subscribers&Action=Manage&SubAction=step3';

                    for (var i = 0, j = segments.options.length; i < j; i++) {
                        if (segments.options[i].selected) {
                            url += '&Segment[]=' + segments.options[i].value;
                        }
                    }

                    $(document.frmManageSubscriberStep1).attr('action', url);
                    break;
            }

            document.frmManageSubscriberStep1.submit();
        },
        cancel: function () {
            if (confirm("%%LNG_Subscribers_Manage_CancelPrompt%%"))
                document.location = "index.php?Page=Subscribers";
        },
        selectSendingOption: function (sendingOption) {
            if (sendingOption == 3)
                this.showSegment();
            else
                this.showMailingList();
        },
        showSegment: function (transition) {
            $('#FilteringOptions').hide();
            $('#SegmentOptions').show();
        },
        showMailingList: function (transition) {
            $('#SegmentOptions').hide(transition ? 'slow' : '');
            $('#FilteringOptions').show(transition ? 'slow' : '');
        }
    };

    $(function () {
        PAGE.init();
    });
</script>
<form name="frmManageSubscriberStep1" method="post" action="index.php?Page=Subscribers&Action=Manage&SubAction=step2">
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%LNG_Subscribers_AdvancedSearch%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
				<p class="PageIntroP">
                    %%LNG_Subscribers_Manage_Intro%%
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="margin-top:10px; margin-bottom:0px; border-bottom:0px">
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_FilterOptions_Subscribers%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel width20Percent col-form-label">
                            {template="Not_Required"}
                            %%LNG_ShowFilteringOptionsLabel_Manage%%
                        </td>
                        <td class="secondTd" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px;  color: #000; padding-top:unset;">
                            <table width="100%" cellspacing="0" cellpadding="0" style="border-bottom:0px">
                                <tr>
                                    <td colspan="2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px; color: #000;">
                                        <label for="ShowFilteringOptions" class="customRadio"><input type="radio" name="ShowFilteringOptions" id="ShowFilteringOptions" class="SendFilteringOption" value="1" checked="checked" />%%LNG_SubscribersShowFilteringOptionsExplain%%<span class="checkmarkRadio"></span></label>
                                    </td>
                                </tr>
                                <tr style="display:%%GLOBAL_DisplaySegmentOption%%;">
                                    <td colspan="2">
                                        <label class="SendFilteringOption_Label customRadio" for="ShowSegmentOptions"><input type="radio" name="ShowFilteringOptions" id="ShowSegmentOptions" class="SendFilteringOption" value="3" />%%LNG_SubscribersShowSegmentsExplain%%<span class="checkmarkRadio"></span></label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div id="FilteringOptions">
                    <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground"  style="margin-top:10px ; border-bottom:0px;">
                        <tr>
                            <td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35); color:#1f2327">
                                %%LNG_MailingListDetails%%
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                {template="Not_Required"}
                                %%LNG_MailingList%%:
                            </td>
                            <td class="secondTd" style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;">
                                <select id="lists" name="lists[]" multiple="multiple" class="ISSelectDiv ISSelectReplacement ISSelectSearch form-control" style="%%GLOBAL_SelectListStyle%%" style="font-size:14px">
                                    %%GLOBAL_SelectList%%
                                </select>%%LNG_HLP_MailingList%%
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="SegmentOptions" style="display:none;">
                    <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground"  style="margin-top:10px ; border-bottom:0px;">
                        <tr>
                            <td colspan="2" class="Heading2"  style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                                %%LNG_SubscriberSegmentDetails%%
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                                {template="Not_Required"}
                                %%LNG_Segments%%:
                            </td>
                            <td class="secondTd" style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;">
                                <select id="segments" name="segments[]" multiple="multiple" class="ISSelectDiv SelectedSegments ISSelectReplacement form-control" style="width:300px;">
                                    %%GLOBAL_SelectSegment%%
                                </select>%%LNG_HLP_SubscriberFilterBySegments%%
                            </td>
                        </tr>
                    </table>
                </div>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel"></td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%">
                            <input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<style>

.ISSelectSearch {
    height:30px;
    width:450px !important;
}
.SelectedSegments{
    width:450px !important;
}
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.secondTd{
    padding:15px 10px 0px 10px;
}
.width20Percent{
    padding:20px 10px 0px 10px;
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
    margin-top:1.5%;
} 
.ISSelectDiv{
    height:150px !important;
    width:450px !important;
}
.submitTableBtn{
    width:210px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:0px;
}
.FieldLabel{
    color:#000;
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
.BodyContainer {
    width: 98.3%;
    margin: 0 10px 10px 10px;
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
        width:560px;
        left:-3px;
        margin-top: 5px;
    }
    .customCheckBox {
        width:350px;
    }
    .submitTableBtn{
        width:191px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:3px !important;
        margin-left:1px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:13em !important;
    }
    .secondTd{
        padding:15px 10px 0px 10px;
    }
    .width20Percent{
        padding:20px 10px 0px 10px;
    }
    .Field250 {
        width:350px !important;
    }
    .Field350 {
        width:350px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:450px !important;
    }
    .BodyContainer {
    width: 97.5%;
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
        width:560px;
        left:-3px;
        //margin-top: 20px;
    }
    .customCheckBox {
        width:350px;
    }
    .submitTableBtn{
        width:137px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:3px !important;
        margin-left:1px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:9em !important;
    }
    .secondTd{
        padding:10px 10px 0px 10px;
    }
    .width20Percent{
        padding:20px 10px 0px 10px;
    }
    .Field250 {
        width:350px !important;
    }
    .Field350 {
        width:350px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:450px !important;
    }
    .BodyContainer {
        width: 96.5% !important;
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
    .BodyContainer {
        width: 94% !important;
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
        width:250px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:250px;
    }
    .submitTableBtn{
        width:89px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .secondTd{
        padding:0px 10px 0px 10px;
    }
    .width20Percent{
        padding:20px 10px 0px 10px;
    }
    .Field250 {
        width:250px !important;
    }
    .Field350 {
        width:250px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:250px !important;
    }
    .BodyContainer {
        width: 94% !important;
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
        width:220px !important;
        left:-3px;
        margin-top: 10px;
    }
    .customCheckBox {
        width:250px;
    }
    .submitTableBtn{
        width:114px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .secondTd{
        padding:10px 0px 0px 10px;
    }
    .width20Percent{
        padding:20px 10px 0px 10px;
    }
    .Field250 {
        width:250px !important;
    }
    .Field350 {
        width:250px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:220px !important;
    }
    .BodyContainer {
        width: 94% !important;
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
        margin-top: 10px;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:89px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .secondTd{
        padding:10px 10px 0px 10px;
    }
    .width20Percent{
        padding:20px 10px 0px 10px;
    }
    .Field250 {
        width:215px !important;
    }
    .Field350 {
        width:215px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:215px !important;
    }
    .BodyContainer {
        width: 94% !important;
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
        width:180px !important;
        left:-3px;
        margin-top: 5px !important;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:119px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:0px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .secondTd{
        padding:10px 0px 0px 10px;
    }
    .width20Percent{
        padding:20px 0px 0px 10px;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:180px !important;
    }
    .BodyContainer {
        width: 94% !important;
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
        width:170px !important;
        left:-3px;
        margin-top: 0px !important;
    }
    .customCheckBox {
        width:170px;
    }
    .submitTableBtn{
        width:92px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
        margin-left:-5px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .secondTd{
        padding:10px 0px 0px 10px;
    }
    .width20Percent{
        padding:20px 0px 0px 10px;
    }
    .Field250 {
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:170px !important;
    }
    .BodyContainer {
        width: 94% !important;
    }
}
</style>
