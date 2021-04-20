<style type="text/css">@import url(includes/styles/ui.datepicker.css);</style>
<script src="includes/js/jquery/ui.js"></script>
<script>
	%%GLOBAL_CustomDatepickerUI%%
</script>
<script>
	function CheckForm() {
		var f = document.frmSubscriberEditor;
		if (f.emailaddress.value == "") {
			alert("%%LNG_Subscribers_EnterEmailAddress%%");
			f.emailaddress.focus();
			return false;
		}
		%%GLOBAL_ExtraJavascript%%
		return true;
	}

	$(function() {
		$(document.frmSubscriberEditor).submit(function(event) {
			if(!CheckForm()) {
				event.preventDefault();
				event.stopPropagation();
			}
		});

		$('.CancelButton').click(function() {
			if(confirm("%%LNG_Subscribers_Add_CancelPrompt%%"))
				document.location="index.php?Page=Subscribers&Action=Manage&SubAction=Step3";
		});

		$('.SaveAddButton').click(function() {
			if (CheckForm()) {
				$(document.frmSubscriberEditor).attr('action', 'index.php?Page=Subscribers&Action=Add&SubAction=SaveAdd&list=%%GLOBAL_list%%');
				document.frmSubscriberEditor.submit();
			}
		});

		$('.CustomFieldDateInput_Row').each(function() {
			var anchor = $('.CustomFieldDateInput_DatepickerAnchor', this).get(0);
			var year = $('.CustomField_Date_Year', this).get(0);
			var minYear = year.options[1].value;
			var maxYear = year.options[year.options.length - 1].value;

			$(anchor).datepicker({
				yearRange: minYear + ':' + maxYear,
				beforeShow: function() {
					var id = this.id.match(/CustomFiledDateInput_Anchor_(\d*)/);
					if(id.length != 2) return;

					var day = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Day').get(0);
					var month = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Month').get(0);
					var year = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Year').get(0);

					if(!day || !month || !year) return;
					$(this).val($(day).val() + '/' + $(month).val() + '/' + $(year).val());
				},
				onSelect: function(date) {
					var id = this.id.match(/CustomFiledDateInput_Anchor_(\d*)/);
					if(id.length != 2) return;

					var day = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Day').get(0);
					var month = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Month').get(0);
					var year = $('#CustomFieldDateInput_' + id[1] + ' .CustomField_Date_Year').get(0);

					if(!day || !month || !year) return;

					var temp = date.match(/(\d{2})\/(\d{2})\/(\d{4})/);
					if(!temp || temp.length != 4) temp = ['', '', '', ''];
					$(day).val(temp[1]);
					$(month).val(temp[2]);
					$(year).val(temp[3]);
				}
			});
		});
	});
</script>
<form name="frmSubscriberEditor" method="post" action="index.php?Page=Subscribers&Action=Add&SubAction=Save&list=%%GLOBAL_list%%">
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
		<tr class="whiteBackground">
			<td class="Heading1 col-sm-4 Heading1New">
				%%GLOBAL_Heading%%
			</td>
		</tr>
		<tr class="whiteBackground">
			<td class="body pageinfo internalAnchor">
				<p class="PageIntroP">
					%%LNG_Subscribers_Add_Step2_Intro%%
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
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground parentTable col-sm" style="border-bottom:none">
					<tr class="whiteBackground">
                        <td colspan="4" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
							%%LNG_NewSubscriberDetails%%
						</td>
					</tr>
                    <tr height="15px"></tr>
					<tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
    						{template="Required"}
							%%LNG_Email%%:&nbsp; 
						</td>
						<td class="tdValue">
							<input type="text" name="emailaddress" value="%%GLOBAL_emailaddress%%" class="form-control Field350">
						</td>
					</tr>
                    <tr height="15px"></tr>
					<tr class="whiteBackground" >
					   	<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
							{template="Required"}
							%%LNG_Format%%:&nbsp;
						</td>
						<td class="tdValue">
							<select name="format" class="Field350 form-control inputBoxInline" >
								%%GLOBAL_FormatList%%
							</select>%%LNG_HLP_Format%%
						</td>
					</tr>
                    <tr height="15px"></tr>
					<tr class="whiteBackground">
					 	<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label tdKey">
							{template="Required"}
							%%LNG_ConfirmedStatus%%:&nbsp;
						</td>
						<td class="tdValue">
							<select name="confirmed" class="Field350 form-control inputBoxInline">
								%%GLOBAL_ConfirmedList%%
							</select>%%LNG_HLP_ConfirmedStatus%%
						</td>
					</tr>
					%%GLOBAL_CustomFieldInfo%%
				</table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Save%%" />
							%%GLOBAL_SaveExitButton%%
							<input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>

<style>
@media screen and (max-width:1600px){
    tdKey{
        width:15.9em !important;
    }
}
*{
    box-sizing:border-box;
}
.inputBoxInline{
    display:inline;
}
.ContentContainer {
    width:100% !important;
}
.parentTable {
    margin-top: 20px;
}
.nextCancelButton {
    margin-top:15px;
} 
.FormButton{
    margin-top:4px;   
}
.customRadio {
    padding-bottom:7px;
    width:46%;
    left:-3px;
    margin-top: 0px;
    vertical-align: top;
}
.customCheckBox {
    width:46%;
    margin-top: 0px;
    vertical-align: top;
}
.submitTableBtn{
    width:405px;
}
.FormButton_wide {
	margin-top:15px;
}
.HelpToolTip_Placeholder{
    margin:20px -125px;
}
.HelpToolTip img:first-child{
    margin-top:10px;
    margin-left:1px;
    //margin-bottom:10px;
}
.Panel {
    margin-bottom: 0px;
}
.tableContainer {
    margin-bottom:2.5%;
}
.tdValue {
    padding-top: 1.35rem;
    display: inline;
    //flex-direction: column;
}
.width20Percent{
    width:15em;
    font-size:14px;
}
.Field250 {
    width:300px;
}
.Field350 {
    width:300px;
    padding-right:0px;
    margin-top: 0px;
}
.FieldLabel{
    padding-left:0px;
    color: #000;
}
.fileFormat360{
    padding-bottom:10px;
}
.opentypeImg, .linktypeImg, .dateTypeImg {
    display:none;
}
.openTypeStep1, .openTypeStep2, .linkTypeStep1, .linkTypeStep2 {
    width:10rem;
}
.dateFieldTd {
    display:inline;
} 
.ISSelectDiv{
    height:150px;
    width:150px;
}
.datefield {
    width: 80px;
    padding: 5px 0px;
    margin: 0px 5px 0px 0px
}
.thirdPartyTable{
    width:100%;
    //overflow-x:scroll;
}
.buttons {
    padding-left: 0px;
}
.Heading3 TD:not(:first-child) {
    padding-right:20px;
}
.Panel td {
    height: fit-content;
    padding-top: 5px;
    vertical-align:top;
}
.TopFormButton:nth-child(2) {
    margin-top:4px;
}
.twoColumns td {
    width:8.5rem;
}
.customLabel {
    padding-left:0px;
    padding-right:10px;
}
.customTextArea, .customText, .customNumber, .customSelect {
    width:15.5rem;
}
.customTextArea {
    height:70px;
}
.twoColumns {
    //display:flex;
    //flex-direction:column;
}
.twoColumns td:nth-child(1) {
    padding-right:20px;
}
.twoColumns td:nth-child(2) {
    padding-left:20px;
}
.BodyContainer {
    width: 98.6%;
    margin: 0 10px 10px 10px;
}
@media screen and (max-width:1024px){
    .parentTable {
        margin-top: 20px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
        vertical-align: top;
    }
    .customCheckBox {
        width:100px;
        margin-top: 0px;
        vertical-align: top;
    }
    .submitTableBtn{
        width:335px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:10px !important;
        margin-left:1px !important;
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .tableContainer {
        margin-bottom:2.5% !important;
    }
    .tdValue {
        padding-top: 1.35rem;
        display: inline;
        //flex-direction: column;
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width:150px !important;
    }
    .datefield {
        width: 80px !important;
        padding: 5px 0px !important;
        margin: 0px 5px 0px 0px !important
    }
    .thirdPartyTable{
        width:920px !important;
        //overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns td {
        width:50% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:15.5rem !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
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
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:100px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:180px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
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
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width:150px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:690px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
    .twoColumns td {
        width:9rem !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
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
        padding-bottom:7px;
        width:100px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:100px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:180px;
    }
	.FormButton_wide {
		margin-top:5px;
	}
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:4px !important;
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
    }
    .width20Percent{
        width:15em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:300px !important;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width:150px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
    }
    .thirdPartyTable{
        width:690px !important;
        overflow-x:scroll !important;
    }
    .buttons {
        padding-left: 0px !important;
    }
    .Heading3 TD:not(:first-child) {
        padding-right:20px !important;
    }
    .Panel td {
        height: fit-content !important;
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        //display:flex !important;
        //flex-direction:column !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:20px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:20px !important;
    }
    .twoColumns td {
        width:9rem !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .BodyContainer {
    width: 97.8%;
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
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
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
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
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
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:67% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
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
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
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
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
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
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:411px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px; 
        width: 106px;  
    }
    .customRadio {
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:140px;
    }
	.FormButton_wide {
		margin-top:5px;
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
        margin-top: 0px;
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
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
    }
    .thirdPartyTable{
        width:330px !important;
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
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
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
        padding-bottom:7px;
        width:200px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:200px;
        margin-top: 0px;
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
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width: 55px !important;
        padding: 5px 0px !important;
        margin: 0px 2px !important;
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
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:200px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
        width: 106px;
    }
    .customRadio {
        padding-bottom:7px;
        width:180px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:180px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:122px;
    }
	.FormButton_wide {
		margin-top:5px;
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
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width:180px !important;
    }
    .datefield {
        width: 50px !important;
        padding: 5px 0px !important;
        margin: 0px 2px 0px 0px !important
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
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:180px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
@media screen and (max-width:320px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
        width: 107px;
    }
    .customRadio {
        padding-bottom:7px;
        width:150px;
        left:-3px;
        margin-top: 0px;
    }
    .customCheckBox {
        width:150px;
        margin-top: 0px;
    }
    .submitTableBtn{
        width:124px;
		padding:0px !important;
    }
	.FormButton_wide {
		margin-top:5px;
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
        width:9em !important;
        font-size:14px !important;
    }
    .Field250 {
        width:150px !important;
    }
    .Field350 {
        width:150px !important;
        padding-right:0px;
        margin-top: 0px;
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
        width:150px !important;
    }
    .datefield {
        width: 42px !important;
        padding: 5px 0px !important;
        margin: 0px 1px 0px 0px !important;
    }
    .thirdPartyTable{
        width:260px !important;
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
        padding-top: 5px;
        vertical-align:top;
    }
    .TopFormButton {
        display:flex !important;
        flex-direction:column !important;
    }
    .TopFormButton:nth-child(2) {
        margin-top:4px !important;
    }
    .twoColumns {
        display:flex !important;
        flex-direction:column !important;
    }
    .twoColumns td {
        width:100% !important;
    }
    .customLabel {
        padding-left:0px !important;
        padding-right:10px;
    }
    .customTextArea, .customText, .customNumber, .customSelect {
        width:150px !important;
    }
    .customTextArea {
        height:70px !important;
    }
    .twoColumns td:nth-child(1) {
        padding-right:0px !important;
    }
    .twoColumns td:nth-child(2) {
        padding-left:0px !important;
    }
    .BodyContainer {
        width: 95% !important;
        margin: 0 10px 10px 7px !important;
    }
}
</style>
<style>
    .tdKey{
        font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; width:13em; font-size:14px ; padding-top:1.25rem;  color: #000;
    }
    .tdValue{
        padding-top: 1.35rem;
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