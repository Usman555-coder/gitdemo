<script>
	var SendPage = {	varPrevNewsletterIdx:	0,
						varCurNewsletterIdx:	0,
						_CheckFormObservers:	[],
						getFormObject: 			function() { return document.frmSend_Step2; },
						toggleTrackerOptions: 	function() { $('#tracklinks_module_list')[this.getFormObject().tracklinks.checked && $('.Module_Tracker_Options').length > 0? 'show' : 'hide'](); },
						addCheckFormObserver:	function($fn) { if($fn) this._CheckFormObservers.push($fn); },
						checkForm:				function() {
													for(var i = 0, j = this._CheckFormObservers.length; i < j; ++i) {
														if(this._CheckFormObservers[i]) {
															try {
																if(!this._CheckFormObservers[i]())
																	return false;
															} catch(e) { }
														}
													}

													return true;
												}};

	SendPage.addCheckFormObserver(function() {
		var form = SendPage.getFormObject();

		if (form.sendfromname.value == '') {
			alert("{$lang.Addon_splittest_Send_Step2_EnterSendFromName}");
			form.sendfromname.focus();
			return false;
		}

		if (form.sendfromemail.value == '') {
			alert("{$lang.Addon_splittest_Send_Step2_EnterSendFromEmail}");
			form.sendfromemail.focus();
			return false;
		}

		if (form.replytoemail.value == '') {
			alert("{$lang.Addon_splittest_Send_Step2_EnterReplyToEmail}");
			form.replytoemail.focus();
			return false;
		}

		if (form.bounceemail.value == '') {
			alert("{$lang.Addon_splittest_Send_Step2_EnterBounceEmail}");
			form.bounceemail.focus();
			return false;
		}

		return true;
	});


	$(function() {
		$(document.frmSend_Step2).submit(function() { return SendPage.checkForm(); });

		$('input.CancelButton', document.frmSend_Step2).click(function() {
			if(confirm("{$lang.Addon_splittest_Send_CancelPrompt}")) {
				document.location = '{$AdminUrl}';
			}
		});

		$(document.frmSend_Step2.tracklinks).click(function() {
			var opt = document.frmSend_Step2.tracklinks;
			if (!opt.checked) {
				alert('{$lang.Addon_splittest_Send_Step2_MustTrackLinks}');
				opt.checked = true;
			}
			SendPage.toggleTrackerOptions();
		});

		$(document.frmSend_Step2.trackopens).click(function() {
			var opt = document.frmSend_Step2.trackopens;
			if (!opt.checked) {
				alert('{$lang.Addon_splittest_Send_Step2_MustTrackOpens}');
				opt.checked = true;
			}
		});

		SendPage.toggleTrackerOptions();
	});

	{if $CronEnabled}
	function ShowSendTime(chkbox) {
		if (chkbox.checked) {
			document.getElementById('show_senddate').style.display='none';
		} else {
			document.getElementById('show_senddate').style.display='';
		}
	}
	{/if}
</script>
<form name="frmSend_Step2" method="post" action="{$AdminUrl}&Action=Send&Step=3">
	<table cellspacing="0" cellpadding="0" width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
		<tr>
			<td class="Heading1 col-sm-4 Heading1New">
				{$lang.Addon_splittest_Send_Step2_Heading}
			</td>
		</tr>
		<tr>
			<td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
					{$lang.Addon_splittest_Send_Step2_Intro}
				</p>
			</td>
		</tr>
		<tr>
			<td>
				{$FlashMessages}
				%%GLOBAL_NoCronMessage%%
			</td>
		</tr>
		<tr>
			<td>
				{*<input class="FormButton" type="submit" value="%%LNG_Next%%" />
				<input class="FormButton CancelButton" type="button" value="%%LNG_Cancel%%" />
				<br />
				&nbsp;*}
				<table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="margin-top:10px ; border-bottom:0px">
					<tr>
						<td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
							{$lang.Addon_splittest_Send_Step2_Settings}
						</td>
					</tr>
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Send_Step2_FromName}
						</td>
						<td class="inputPadding">
							<input type="text" name="sendfromname" value="{$fromname}" class="form-control Field350">{$lnghlp.Addon_splittest_Send_Step2_FromName}
						</td>
					</tr>
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Send_Step2_FromEmail}
						</td>
						<td class="inputPadding">
							<input type="text" name="sendfromemail" value="{$fromemail}" class="form-control Field350">{$lnghlp.Addon_splittest_Send_Step2_FromEmail}
						</td>
					</tr>
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Send_Step2_ReplyToEmail}
						</td>
						<td class="inputPadding">
							<input type="text" name="replytoemail" value="{$replytoemail}" class="form-control Field350">{$lnghlp.Addon_splittest_Send_Step2_ReplyToEmail}
						</td>
					</tr>
					{if $ShowBounceInfo}
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Send_Step2_BounceEmail}
						</td>
						<td class="inputPadding">
							<input type="text" name="bounceemail" value="{$bounceemail}" class="form-control Field350">{$lnghlp.Addon_splittest_Send_Step2_BounceEmail}
						</td>
					</tr>
					{/if}
					<tr>
						<td class="EmptyRow" colspan="2"></td>
					</tr>
					{if $CronEnabled}
						{template="send_step2_cron_options"}
					{/if}
					<tr>
						<td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
							{$lang.Addon_splittest_Send_Step2_AdvancedOptions}
						</td>
					</tr>
					{if $ShowCustomFields}
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="not_required"}
							{$lang.Addon_splittest_Send_Step2_FirstName}
						</td>
						<td class="inputPadding">
							<select name="to_firstname" class="form-control Field350">
								<option value="0">{$lang.Addon_splittest_Send_Step2_FirstName_Choose}</option>
								{foreach from=$CustomFields key=fieldid item=fieldname}
									<option value="{$fieldid}">{$fieldname}</option>
								{/foreach}
							</select>{$lnghlp.Addon_splittest_Send_Step2_FirstName}
						</td>
					</tr>
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="not_required"}
							{$lang.Addon_splittest_Send_Step2_LastName}
						</td>
						<td class="inputPadding">
							<select name="to_lastname" class="form-control Field350">
								<option value="0">{$lang.Addon_splittest_Send_Step2_LastName_Choose}</option>
								{foreach from=$CustomFields key=fieldid item=fieldname}
									<option value="{$fieldid}">{$fieldname}</option>
								{/foreach}
							</select>{$lnghlp.Addon_splittest_Send_Step2_LastName}
						</td>
					</tr>
					{/if}
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="not_required"}
							{$lang.Addon_splittest_Send_Step2_Multipart}
							
						</td>
						<td class="inputPadding">
							<label for="sendmultipart" class="customCheckBox"><input type="checkbox" name="sendmultipart" id="sendmultipart" value="1"
							CHECKED>{$lang.Addon_splittest_Send_Step2_Multipart_Explain}<span class="checkmark"></span></label>{$lnghlp.Addon_splittest_Send_Step2_Multipart}
						</td>
					</tr>
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Send_Step2_TrackOpens}
						</td>
						<td class="inputPadding">
							<div>
								<label for="trackopens" class="customCheckBox"><input type="checkbox" name="trackopens" id="trackopens" value="1" CHECKED>
									{$lang.Addon_splittest_Send_Step2_TrackOpens_Explain}
								<span class="checkmark"></span></label>{$lnghlp.Addon_splittest_Send_Step2_TrackOpens}
							</div>
						</td>
					</tr>
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Send_Step2_TrackLinks}
						</td>
						<td class="inputPadding">
							<div>
								<label for="tracklinks" class="customCheckBox">
									<input type="checkbox" name="tracklinks" id="tracklinks" value="1" CHECKED>
									{$lang.Addon_splittest_Send_Step2_TrackLinks_Explain}
								<span class="checkmark"></span></label>{$lnghlp.Addon_splittest_Send_Step2_TrackLinks}
							</div>
							<div id="tracklinks_module_list">
								<div style="float: left;"><img width="20" height="20" src="images/nodejoin.gif"/></div>
								<div style="float: left;">%%GLOBAL_TrackerOptions%%</div>
							</div>
						</td>
					</tr>
					{if $DisplayEmbedImages}
					<tr>
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="not_required"}
							{$lang.Addon_splittest_Send_Step2_EmbedImages}
						</td>
						<td class="inputPadding">
							<div>
								<label for="embedimages" class="customCheckBox">
									<input type="checkbox" name="embedimages" id="embedimages" value="1"{if $EmbedImagesByDefault} CHECKED{/if}>
									{$lang.Addon_splittest_Send_Step2_EmbedImages_Explain}
								<span class="checkmark"></span></label>{$lnghlp.Addon_splittest_Send_Step2_EmbedImages}
							</div>
						</td>
					</tr>
					{/if}
				</table>
				<table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain">
					<tr>
						<td class="submitTableBtn FieldLabel"></td>
                        <td valign="top" height="30">
							<input class="FormButton btn save-btn" type="submit" value="%%LNG_Next%%" />
							<input class="FormButton CancelButton btn cancel-btn" type="button" value="%%LNG_Cancel%%" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<style>
.inputPadding{
    padding-top: 1.35rem; 
}
input {
  filter: none !important;
}
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
}
.secondTd{
    padding:15px 10px 0px 0px;
}
.width20Percent {
    font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000;width:13em; font-size:14px ; padding-top: 1.35rem; padding-left:18px;  color: #000;
}
.tableContainer {
    flex:wrap;
}
.nextCancelButton {
    margin-top:1.5%;
}
.submitTableBtn{
    width:280px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:3px;
}
.Field350 {
    width: 338px !important;
    padding-right: 0px;
    display:inline;
}
.width20Percent {
    width:20em;
}
.Panel td {
    font-size:14px;
    color: #000;
}
.optionPadding{
    padding:5px 0px 0px 20px
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
        margin-top:20px !important;    
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:280px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:20em !important;
    }
    .secondTd{
    padding:15px 10px 0px 0px;
}
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .optionPadding{
    padding:0px
    }
    .BodyContainer {
    width: 97.5%;}
}
@media screen and (max-width:823px){
    .multiselectTd{
        display:inline;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:328px;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:210px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:15em !important;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:338px !important;
        padding-right:0px;
        display:inline;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .importFromServerDiv {
        margin-top:10px;
    }
    .optionPadding{
    padding:0px
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
        width:330px;
        left:-3px;
    }
    .customCheckBox {
        width:auto;
        margin-top:0px !important;
    }
    .submitTableBtn{
        width:250px;
    }
    .HelpToolTip_Placeholder{
        margin:20px -145px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:0px !important;
        margin-left:0px !important;
        //margin-bottom:10px !important;
        vertical-align: text-bottom;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:18em !important;
    }
    .secondTd{
    padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:270px !important;
        margin-bottom: 12px;
    }
    .Field350 {
        width:300px !important;
        padding-right:0px;
        display:inline;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .importFromServerDiv {
        margin-top:10px;
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
    }
    .customCheckBox {
        width:210px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
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
        width:12em !important;
    }
    .Field250 {
        width:210px !important;
    }
    .Field350 {
        width:210px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 210px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
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
        width:180px;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
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
        width:12em !important;
    }
    .secondTd{
        padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 210px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .BodyContainer {
        width: 97%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:411px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:180px;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:153px;
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
    .secondTd{
        padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .optionPadding{
        padding:0px
    }
    .node{
        padding-top: 20px;
    }
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
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
        width:180px;
        left:-3px;
    }
    .customCheckBox {
        width:180px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:155px !important;
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
    .secondTd{
        padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:180px !important;
    }
    .Field350 {
        width:180px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    #SubscriberImportServerField {
        margin-left: 0px !important;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .optionPadding{
    padding:0px
    }
    .node{
        padding-top: 20px;
    }
    .BodyContainer {
        width: 97%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:360px){
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:140px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:145px;
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
    .secondTd{
        padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:140px !important;
    }
    .Field350 {
        width:140px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    .nodeImg {
        display: none;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .optionPadding{
        padding:0px
    }
    .node{
        padding-top: 20px;
    }
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:320px){
    .BodyContainer {
        width: 93%;
        margin: 0 10px 10px 10px;
    }
    .bounce_extrasettings_div1 {
        margin-top:10px !important;
    }
    #showextramailsettings div {
        margin-bottom:0px !important;
    }
    .nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:20px;   
    }
    .customRadio {
        padding-bottom:3px;
        width:140px;
        left:-3px;
    }
    .customCheckBox {
        width:135px;
        margin-top:0px !important;
        padding-bottom: 0px !important;
    }
    .submitTableBtn{
        width:120px !important;
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
        width:10em !important;
    }
    .secondTd{
        padding:15px 10px 0px 0px;
    }
    .Field250 {
        width:140px !important;
    }
    .Field350 {
        width:135px !important;
        padding-right:0px;
    }
    .FieldLabel{
        padding-left:0px;
    }
    .fileInput{
        width:140px !important;
        overflow: hidden;
        padding-top:5px;
    }
    .importFromServer {
        width: 140px !important;
        margin:5px 0px 0px 0px !important;
    }
    .importFromServerDiv {
        margin-top:15px;
    }
    .nodeImg {
        display: none;
    }
    .optionPadding{
        padding:0px
    }
    .node{
        padding-top: 20px;
    }
}
</style>
