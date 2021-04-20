<script type="text/javascript">
	var PAGE = {
		init:						function() {
			$(document.frmSend).submit(function(event) {
				event.preventDefault();
				event.stopPropagation();
			});

			$('.CancelButton').click(function() { PAGE.cancel(); });

			$('.SubmitButton').click(function() { PAGE.submit(); });

			$('#lists').dblclick(function() { PAGE.submit(); });

			{if $DisplaySegments}
				if(document.frmSend['segments[]'].options.length == 0) {
					$('#ShowSegmentOptions').attr('disabled', true);
				}

				$('#segments').dblclick(function() { PAGE.submit(); });
			{/if}

			$('.SendFilteringOption').click(function() { PAGE.selectSendingOption(this.value); });
		},
		submit:					function() {
			{if $DisplaySegments}
				if($('#ShowSegmentOptions').get(0).checked) {
					var elm = $('.SelectedSegments').get(0);
					if(elm.selectedIndex == -1) {
						alert("{$lang.Addon_splittest_Alert_ChooseSegment}");
						return;
					}
				}
			{/if}
			if ($('#ShowListOptions').get(0).checked) {
				var elm = $('.SelectedLists').get(0);
				if(elm.selectedIndex == -1) {
					alert("{$lang.Addon_splittest_Alert_ChooseList}");
					return;
				}
			}
			document.frmSend.submit();
		},
		cancel:					function() {
			if(confirm("{$lang.Addon_splittest_Send_CancelPrompt}")) {
				document.location="{$AdminUrl}";
			}
		},
		selectSendingOption:	function(sendingOption) {
			{if $DisplaySegments}
			if(sendingOption == 2) {
				this.showSegment();
				return;
			}
			{/if}
			this.showMailingList();
		},
		{if $DisplaySegments}
		showSegment:			function(transition) {
			$('#FilteringOptions').hide();
			$('#SegmentOptions').show();
		},
		{/if}
		showMailingList:		function(transition) {
			{if $DisplaySegments}
				$('#SegmentOptions').hide(transition? 'slow' : '');
			{/if}
			$('#FilteringOptions').show(transition? 'slow' : '');
		}
	};

	$(function() { PAGE.init(); });
</script>
<form name="frmSend" method="post" action="{$AdminUrl}&Action=Send&Step=2">
	<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
		<tr>
			<td class="Heading1 col-sm-4 Heading1New">
				{$lang.Addon_splittest_Send_Step1}
			</td>
		</tr>
		<tr>
			<td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
					{$lang.Addon_splittest_Send_Step1_Intro}
				</p>
			</td>
		</tr>
		<tr>
			<td>
				{$FlashMessages}
			</td>
		</tr>
		<tr>
			<td>
				{*<input class="FormButton SubmitButton" type="button" value="%%LNG_Next%%" />
				<input class="FormButton CancelButton" type="button" value="%%LNG_Cancel%%" />
				<br />
				&nbsp;*}
				<table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="margin-top:10px; margin-bottom:0px; border-bottom:0px">
					<tr>
						<td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
							{$lang.Addon_splittest_Send_Step1_WhoToSendTo_Heading}
						</td>
					</tr>
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel width20Percent col-form-label">
							{template="not_required"}
							{$lang.Addon_splittest_Send_Step1_WhoToSendTo}
						</td>
						<td class="secondTd">
							<table width="100%" cellspacing="0" cellpadding="0" style="border-bottom:0px">
								<tr>
									<td colspan="2" style=" color: #000;">
										<label class="customRadio SendFilteringOption_Label" for="ShowListOptions"><input type="radio" name="ShowFilteringOptions"
										id="ShowListOptions" class="SendFilteringOption" value="1" checked="checked" />{$lang.Addon_splittest_Send_Step1_WhoToSendTo_Lists}<span class="checkmarkRadio"></span></label>
									</td>
								</tr>
								{if $DisplaySegments}
								<tr>
									<td colspan="2" style="color: #000;">
										<label class="customRadio SendFilteringOption_Label" for="ShowSegmentOptions"><input type="radio" name="ShowFilteringOptions" id="ShowSegmentOptions"
										class="SendFilteringOption" value="2" />{$lang.Addon_splittest_Send_Step1_WhoToSendTo_Segments}<span class="checkmarkRadio"></span></label>
									</td>
								</tr>
								{/if}
							</table>
						</td>
					</tr>
				</table>
				<div id="FilteringOptions">
					<table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground"  style="margin-top:10px ; border-bottom:0px;">
						<tr>
							<td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35); color:#1f2327">
								{$lang.Addon_splittest_Send_Step1_List_Heading}
							</td>
						</tr>
						<tr>
							<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
								{$lang.Addon_splittest_Send_Step1_ChooseList}
							</td>
							<td class="secondTd">
								<select id="lists" name="lists[]" multiple="multiple" class="SelectedLists ISSelectDiv ISSelectReplacement ISSelectSearch form-control" style="font-size:14px">
								{foreach from=$user_lists key=k item=list}
									<option value="{$list.listid}">
									{$list.name}
									({if $list.subscribecount == 1}{$lang.Addon_splittest_SingleContact}{else}{$list.subscribecount|number_format}{$lang.Addon_splittest_MultipleContacts}{/if})
									</option>
								{/foreach}
								</select>
							</td>
						</tr>
					</table>
				</div>
				{if $DisplaySegments}
				<div id="SegmentOptions" style="display:none;">
					<table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground"  style="margin-top:10px ; border-bottom:0px;">
						<tr>
							<td colspan="2" class="Heading2"  style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
								{$lang.Addon_splittest_Send_Step1_Segment_Heading}
							</td>
						</tr>
						<tr>
							<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
								{template="not_required"}
								{$lang.Addon_splittest_Send_Step1_ChooseSegment}
							</td>
							<td class="secondTd">
								<select id="segments" name="segments[]" multiple="multiple" class="ISSelectDiv SelectedSegments ISSelectReplacement form-control" style="width:300px;">
								{foreach from=$user_segments key=k item=segment}
									<option value="{$segment.segmentid}">{$segment.segmentname}</option>
								{/foreach}
								</select>
							</td>
						</tr>
					</table>
				</div>
				{/if}
				<table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
					<tr>
						<td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
							<input class="FormButton SubmitButton btn save-btn" type="button" value="%%LNG_Next%%" />
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
        width:180px;
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
        width:140px;
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
        width:10em !important;
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
        width:115px;
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
        margin-top: 10px !important;
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


<style>
input.ISSelectSearch {
	margin-top: 15px;
	 display: initial;
	 font-size: 14px;
	 padding: 0 10px;
}
</style>