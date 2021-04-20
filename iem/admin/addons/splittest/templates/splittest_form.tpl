<script src="includes/js/jquery/ui.js"></script>

<script>

	var PAGE = {
		init: function() {

			var frm = document.frmSplitTestEdit;

			// Are we editing a campaign, and if so is it focused on link clicks?
			if('{$weight_linkclick}' != '0') {
				document.getElementById('weight_type').selectedIndex = 1;
			}

			if (frm.distributed.checked == true) {
				$('#weightFieldLabel').css({ display: 'none' });
				$('#weightDiv').css({ display: 'none' });
			}

			PAGE.normaliseHours();

			$(frm).submit(function(event) {
				return PAGE.submit();
			});

			$('.cancelButton').click(function() {
				PAGE.cancel();
			});

			$('#percentage_hoursafter').click(function() {
				$('#percentage').click();
				$('#percentage_hoursafter').select();
			});

			$('#percentage_percentage').click(function() {
				$('#percentage').click();
				$('#percentage_percentage').select();
			});

			$('#hoursafter_timerange').change(function() {
				$('#percentage').click();
			});

			$('#percentage').click(function() {
				PAGE.checkPercentageSplitType();
			});

			$('#distributed').click(function() {
				PAGE.checkDistributedSplitType();
			});

			$('#weight_type').change(function() {
				if($(this).val() == 'open') {
					// Winner is based on open rate
					$('#weight_openrate').val(100);
					$('#weight_linkclick').val(0);
				}
				else {
					// Winner is based on click rate
					$('#weight_openrate').val(0);
					$('#weight_linkclick').val(100);
				}
			});

			$('#hrefPreview').click(function() {
				var campaigns = PAGE.getSelectedCampaigns();
				if (!campaigns.length) {
					alert("{$lang.Addon_splittest_PreviewNoneSelected}");
					$('#splittest_campaigns').focus();
					return false;
				}
				$(campaigns).each(function(i, e) {
					window.open('index.php?Page=Newsletters&Action=Preview&id=' + e, 'campaign' + e);
				});
				this.blur();
				return false;
			});
		},

		calculateWeight: function(whatchanged) {
			var fldname = 'weight_' + whatchanged;
			var fld = document.getElementById(fldname);
			var newvalue = parseInt(fld.value, 10);
			if (newvalue < 0 || newvalue > 100 || isNaN(newvalue)) {
				fld.focus();
				return;
			}

			var otherfield_name = '';

			switch (whatchanged)
			{
				case 'openrate':
					otherfield_name = 'linkclick';
				break;

				case 'linkclick':
					otherfield_name = 'openrate';
				break;
			}

			if (otherfield_name == '') {
				return;
			}

			var newweight = 100 - newvalue;
			$('#weight_' + otherfield_name).get(0).value = newweight;
		},

		checkPercentageSplitType: function() {
			$('#weightFieldLabel').css({ display: 'block' });
			$('#weightDiv').css({ display: 'block' });
		},

		checkDistributedSplitType: function() {
			$('#weightFieldLabel').css({ display: 'none' });
			$('#weightDiv').css({ display: 'none' });
		},

		checkWeightings: function(frm) {
			weight_openrate = parseInt(frm.weight_openrate.value, 10);
			if (weight_openrate < 0 || weight_openrate > 100 || isNaN(weight_openrate)) {
				alert('{$lang.Addon_splittest_form_InvalidWeight_Alert}');
				return false;
			}

			weight_linkclick = parseInt(frm.weight_linkclick.value, 10);
			if (weight_linkclick < 0 || weight_linkclick > 100 || isNaN(weight_linkclick)) {
				alert('{$lang.Addon_splittest_form_InvalidWeight_Alert}');
				return false;
			}

			if ((weight_openrate + weight_linkclick) != 100) {
				alert('{$lang.Addon_splittest_form_InvalidWeight_IncorrectTotal}');
				return false;
			}
			return true;
		},

		getSelectedCampaigns: function() {
			var el = document.frmSplitTestEdit['splittest_campaigns[]'];
			var selected = [];

			for(var i = 0, j = el.options.length; i < j; ++i) {
				if(el.options[i].selected) {
					selected.push(el.options[i].value);
				}
			}
			return selected;
		},

		getSplitType: function() {
			if ($("#distributed").get(0).checked) {
				return 'distributed';
			}
			if ($("#percentage").get(0).checked) {
				return 'percentage';
			}
			return null;
		},

		getTimeRange: function(frm) {
			var splittype = this.getSplitType();
			if (splittype != 'percentage') {
				return 0;
			}

			var timerange = null;

			var trange = frm.hoursafter_timerange;
			for (var i=0, j=trange.options.length; i<j; ++i) {
				if (trange.options[i].selected) {
					timerange = trange.options[i].value;
					break;
				}
			}

			if (frm.percentage_hoursafter.value.length < 1) {
				return null;
			}

			var newvalue = 0;
			if (timerange == 'days') {
				newvalue = parseInt(frm.percentage_hoursafter.value, 10) * 24;
			} else {
				newvalue = parseInt(frm.percentage_hoursafter.value, 10);
			}

			return newvalue;
		},

		// The 'Hours After' value may need to be displayed in days rather than hours.
		normaliseHours: function() {
			var frm = document.frmSplitTestEdit;
			var hours_after = frm.percentage_hoursafter.value;
			var type = frm.hoursafter_timerange;
			var hours = parseInt(hours_after, 10);
			if (isNaN(hours)) {
				hours_after = 0;
			}
			if (hours >= 24 && hours % 24 == 0) {
				hours_after = hours / 24;
				$(type).val('days');
			}
			hours_after = hours;
		},

		submit: function() {
			var frm = document.frmSplitTestEdit;
			var data = {
				splitName: encodeURIComponent($.trim(frm.splitname.value)),
				campaigns: this.getSelectedCampaigns(),
				splittype: this.getSplitType(),
				hours: this.getTimeRange(frm),
				percentage: $.trim(frm.percentage_percentage.value)
			};

			if (data.splitName == '') {
				alert('{$lang.Addon_splittest_form_EnterName_Alert}');
				frm.splitname.focus();
				return false;
			}

			if (data.campaigns.length < 2) {
				alert('{$lang.Addon_splittest_form_SelectCampaigns_Alert}');
				return false;
			}

			if (data.splittype == 'percentage') {
				if (data.percentage.length < 1 || data.percentage < {$Percentage_Minimum} || data.percentage > {$Percentage_Maximum}) {
					alert('{$lang.Addon_splittest_form_ChoosePercent_Alert|sprintf,$Percentage_Minimum,$Percentage_Maximum}');
					frm.percentage_percentage.focus();
					frm.percentage_percentage.select();
					return false;
				}
				if (data.hours == null || data.hours < {$Percentage_HoursAfter_Minimum} || data.hours > {$Percentage_HoursAfter_Maximum}) {
					alert('{$lang.Addon_splittest_form_ChooseHoursAfter_Alert|sprintf,$Percentage_HoursAfter_Minimum,$Percentage_HoursAfter_Maximum_Days}');
					frm.percentage_hoursafter.focus();
					frm.percentage_hoursafter.select();
					return false;
				}

				weightings_ok = PAGE.checkWeightings(frm);
				if (!weightings_ok) {
					return false;
				}
			}
			// Convert the days to hours in the form only once everything validates.
			frm.percentage_hoursafter.value = data.hours;
			return true;
		},

		cancel: function() {
			{if $FormType == 'create'}
				var confmsg = '{$lang.Addon_splittest_form_Cancel_Create}';
			{elseif $FormType == 'edit'}
				var confmsg = '{$lang.Addon_splittest_form_Cancel_Edit}';
			{/if}

			if (confirm(confmsg)) {
				window.location.href = "{$BaseAdminUrl}";
			}
		}
	};

	$(function() {
		PAGE.init();
	});
</script>

<form name="frmSplitTestEdit" id="frmSplitTestEdit" method="post" action="{$AdminUrl}&Action={if $FormType == 'create'}Create{elseif $FormType == 'edit'}Edit&id={$splitid}{/if}">
	<input type="hidden" id="action" name="action" value="{$action}" />
	<table cellspacing="0" border-spacing ="0" cellpadding="0" width="100%" align="center">
		<tr>
			<td class="Heading1 col-sm-4 Heading1New">
				{if $FormType == 'create'}
					{$lang.Addon_splittest_Form_CreateHeading}
				{elseif $FormType == 'edit'}
					{$lang.Addon_splittest_Form_EditHeading}
				{/if}
			</td>
		</tr>
		<tr>
			<td class="body pageinfo">
				<p class="PageIntroP">
					{$lang.Addon_splittest_Form_Intro}
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
				
				<table cellspacing="0" cellpadding="0" width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
					<tr class="whiteBackground">
						<td colspan="4" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
							{$lang.Addon_splittest_Form_Settings}
						</td>
					</tr>
					<tr height="15px"></tr>
					<tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							
							{template="required"}
							{$lang.Addon_splittest_Form_CampaignName}:&nbsp;
						</td>
						<td >
							<input type="text" id="splitname" name="splitname" class="Field250 form_text form-control flexibleWidth" value="{$splitname}" style="width:450px;" /> <br />
							<span class="aside">{$lang.Addon_splittest_Form_CampaignName_Aside}</span>
							<br /><br />
						</td>
					</tr>
					<tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Form_ChooseCampaigns}:&nbsp;
						</td>
						<td>
							<select id="splittest_campaigns" name="splittest_campaigns[]" multiple="multiple" class="ISSelectReplacement splittest_campaigns form-control ISSelectDiv flexibleWidth" style="height:150px;">
							{foreach from=$campaigns key=k item=campaignDetails}
								<option value="{$campaignDetails.newsletterid}"{if $campaignDetails.selected == 1} selected="selected"{/if}>{$campaignDetails.name}</option>
							{/foreach}
							</select>
							<div class="HelpToolTipFix">{$lnghlp.Addon_splittest_Form_AddCampaigns}
							<a id="hrefPreview" href="#"><img border="0" src="images/magnify.gif"/> {$lang.Addon_splittest_PreviewSelected}</a>
							</div>
						</td>
					</tr>
					<tr height="15px"></tr>
					<tr class="whiteBackground">
						<td  class="FieldLabel Field width20Percent" >
							{template="required"}
							{$lang.Addon_splittest_ChooseWinnerBy}:
						</td>
						<td style="padding-top:5px">
							<select id="weight_type" class="form-control flexibleWidth" name="weight_type" style="width:450px">
								<option value="open">{$lang.Addon_splittest_Winner_Open}</option>
								<option value="click">{$lang.Addon_splittest_Winner_Click}</option>
							</select>
							<input type="hidden" id="weight_openrate" value="{$weight_openrate}" name="weights[openrate]" />
							<input type="hidden" id="weight_linkclick" value="{$weight_linkclick}" name="weights[linkclick]" />
						</td>
					</tr>
					<tr height="15px"></tr>
					<tr class="whiteBackground">
						<td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
							{template="required"}
							{$lang.Addon_splittest_Form_SplitType}
						</td>
						<td style="padding-top:5px" class="marginFixTooltip">
							
							<label class="customRadio firstlabelWidth Heading2" for="distributed">
								<input type="radio" id="distributed" name="splittype" value="distributed" {if $splitType == 'distributed'}checked="checked"{/if} />
								{$lang.Addon_splittest_Distributed_Intro}
								<span class="checkmarkRadio"></span>
								
								
							</label>
						        {$lnghlp.Addon_splittest_Splittype_Distributed}
								<ul class="bullets" style="margin-top:5px; margin-bottom:5px;margin-left:41px">
									<li>{$lang.Addon_splittest_Distributed_List_1}</li>
									<li>{$lang.Addon_splittest_Distributed_List_2}</li>
								</ul>
								
							
							<label class="customRadio secondlabelWidth Heading2" for="percentage">
								<input type="radio" id="percentage" name="splittype" value="percentage" {if $splitType == 'percentage'}checked="checked"{/if} />
								{$lang.Addon_splittest_Percentage_Intro}
								<span class="checkmarkRadio"></span>
								
								
							</label>
								{$lnghlp.Addon_splittest_Splittype_Percentage}	
							
								<ul class="bullets" style="margin-top:5px; margin-bottom:5px;margin-left:41px">
									<li>{$lang.Addon_splittest_Percentage_List_1_1} <input type="text" class="form-control"id="percentage_percentage" name="percentage_percentage" style="display:inline;font-size: 11px; width: 25px;" value="{$percentage_percentage}" />% {$lang.Addon_splittest_Percentage_List_1_2}</li>
									<li>
										{$lang.Addon_splittest_Percentage_List_2_1}
										<input type="text" class="form-control" id="percentage_hoursafter" name="percentage_hoursafter" style=" display:inline;font-size: 11px; width: 25px;" value="{$splitHoursAfter}" />
										 <select name="hoursafter_timerange" class="form-control" id="hoursafter_timerange" style="display: inline;width: 70px;">
											<option value="hours"{if $splitHoursAfter_TimeRange == 'hours'} selected="selected"{/if}>{$lang.Addon_splittest_Hours}</option>
											<option value="days"{if $splitHoursAfter_TimeRange == 'days'} selected="selected"{/if}>{$lang.Addon_splittest_Days}</option>
										 </select> {$lang.Addon_splittest_Percentage_List_2_2}
									</li>
									<li>{$lang.Addon_splittest_Percentage_List_3}</li>
								</ul>
								
						</td>
					</tr>
				</table>
				<table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
					<tr>
						<td class="submitTableBtn FieldLabel">&nbsp;</td>
						<td valign="top" height="30">
							{if $ShowSend}<input class="FormButton submitButton btn save-btn" type="submit" name="Submit_Send" value="{$lang.Addon_splittest_SaveSend}" style="width:110px" />{/if}
							<input class="FormButton submitButton btn save-btn marginTop" type="submit" name="Submit_Exit" value="{$lang.Addon_splittest_SaveExit}" style="width:110px" />
							<input class="FormButton cancelButton btn cancel-btn marginTop" type="button" value="{$lang.Addon_splittest_Cancel}" style="width:110px" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<style>
ul.bullets {
	list-style: disc;
}
.HelpToolTip{
	vertical-align:middle;
	margin-left: 5px;
}
.BodyContainer{
	width:98.5%;
}
.width20Percent{
        width:21em !important;
    }
.Field250 {
	padding:0px 10px;
}
.submitTableBtn{
    width:300px;
}
.nextCancelButton {
        margin-top:15px;
    } 
.FormButton{
        margin-top:4px;   
    }
.buttonFix{
	padding-left: 312px;
    padding-top: 11px;
}
#percentage_percentage {
    display: inline !important;
    font-size: 14px !important;
    width: 35px !important;
    height: 35px !important;
    padding: 0px 2px !important;
}
#percentage_hoursafter {
    display: inline !important;
    font-size: 14px !important;
    width: 32px !important;
    height: 35px !important;
    padding: 0px 3px !important;
}.FieldLabel{
        padding-left:0px;
		color:#000;
    }
@media screen and (max-width:1024px){
		.nextCancelButton {
        margin-top:15px;
    } 
    .FormButton{
        margin-top:4px;   
    }
	.submitTableBtn{
        width:293px;
    }
	.width20Percent{
		width: 297px;
	}
	.HelpToolTipFix{
		margin-left:-6px;
		padding-top:2px;
	}
	.buttonFix{
		padding-left:80px !important;
	}
	.BodyContainer{
		width:98%;
	}.FieldLabel{
        padding-left:0px;
		color:#000;
    }

.ISSelectDiv {
	width:450px!important;
}}
@media screen and (max-width:768px){
	.flexibleWidth{
		width:300px !important;
	}
	.firstlabelWidth{
		width:90%;
	}
	.HelpToolTipFix{
		clear:left;
		margin-left:-6px;
		padding-top:2px;
	}
	.secondlabelWidth{
		width:452px!important;
	}
	.buttonFix{
		padding-left:236px;
	}
	label+span.HelpToolTip{
    	margin-left: 24px!important;
	}
    .submitTableBtn{
        width:270px;
    }.FieldLabel{
        padding-left:0px;
		color:#000;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:450px !important;
    }
}
@media screen and (max-width:540px){
	.flexibleWidth{
		width:100% !important;
	}
	.HelpToolTipFix{
    	margin-left: -6px;
    	margin-top: 1px;
	}
	.firstlabelWidth{
      width:229px!important;
	}
	.secondlabelWidth{
		width:229px!important;
	}
	.buttonFix{
		display:flex;
		flex-direction:column;
		padding-left:235px;
	}
	.marginTop{
		margin-top:4px;
	}
	label+span.HelpToolTip{
    	margin-left: 24px!important;
	}.submitTableBtn{
        width:180px;
    }.FieldLabel{
        padding-left:0px;
		color:#000;
    }
	.ISSelectDiv2 {
		width:145px !important;
		overflow-x:scroll !important;
	}
}
@media screen and (max-width:414px){
	.firstlabelWidth{
      width:160px!important;
	}
	.secondlabelWidth{
		width:160px!important;
	}
	.HelpToolTip_Placeholder{
		margin-left:-90px!important;
	}
	.width20Percent{
		width:150px!important;
	}
	.buttonFix{
		padding-left:172px;
	}
	.BodyContainer{
		width:94.5%;
	}
	label+span.HelpToolTip{
		margin-left:18px!important;
	}.submitTableBtn{
        width:180px;
    }.FieldLabel{
        padding-left:0px;
		color:#000;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:185px !important;
    }
}
@media screen and (max-width:375px){
	.width20Percent{
		width:114px!important;
	}
	.HelpToolTip_Placeholder{
		margin-left:-79px!important;
	}
	.buttonFix{
		padding-left:137px;
	}
	.BodyContainer{
		width:94%;
	}.submitTableBtn{
        width:180px;
    }.FieldLabel{
        padding-left:0px;
		color:#000;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:215px !important;
    }
}
@media screen and (max-width:360px){
	.HelpToolTip_Placeholder{
		margin-left:-106px!important;
	}
	.BodyContainer{
		width:94%;
	}
	.secondlabelWidth{
		width:143px!important;
	}
	label+span.HelpToolTip{
		margin-left:18px!important;
	}.submitTableBtn{
        width:138px;
    }.FieldLabel{
        padding-left:0px;
		color:#000;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:180px !important;
    }
}
@media screen and (max-width:320px){
	.HelpToolTip_Placeholder{
		margin-left:-106px!important;
	}
	.flexibleWidth {
		width: 93% !important;
	}
	.BodyContainer{
		width:93%;
	}
	.firstlabelWidth{
		width:140px!important;
	}
	.secondlabelWidth{
		width:140px!important;
	}
	label+span.HelpToolTip{
		margin-left:18px!important;
	}.submitTableBtn{
        width:140px;
    }.FieldLabel{
        padding-left:0px;
		color:#000;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:135px !important;
    }
}
@media screen and (max-width:320px){
	.HelpToolTip_Placeholder{
		margin-left:-125px!important;
	}.FieldLabel{
        padding-left:0px;
		color:#000;
    }}
</style>
<style>
input.ISSelectSearch {
	margin-top: 15px;
	 display: initial;
	 font-size: 14px;
	 padding: 0 10px;
}
</style>