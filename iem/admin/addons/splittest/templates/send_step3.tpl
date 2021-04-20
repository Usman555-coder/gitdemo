<form name="frmSend_Step3" method="post" action="{$AdminUrl}&Action=Send&Step=4">
	<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" >
		<tr>
			<td class="Heading1 col-sm-4 Heading1New">
				{$lang.Addon_splittest_Send_Step3_Heading}
			</td>
		</tr>
		<tr>
			<td class="body pageinfo internalAnchor">
				<p class="PageIntroP">
					{$lang.Addon_splittest_Send_Step3_Intro}
				</p>
				<ul style="margin-bottom: 0px; list-style: disc !important;margin-left: 18px;">
					<li>
						{$lang.Addon_splittest_Send_Step3_SendingCampaignsIntro}
						<ul style="list-style: circle; margin-left:40px;">
							<li>
								{foreach from=$sendingCampaigns key=k item=campaignName id=campaignLoop}
									{if $NewsletterView}<a href="{$ApplicationUrl}?Page=Newsletters&Action=View&id={$k}" target="_blank">{/if}{$campaignName}{if $NewsletterView}</a>{/if}{if !$campaignLoop.last}, {/if}
								{/foreach}
							</li>
						</ul>
					</li>
						{if $SendingToLists}
							<li>{$lang.Addon_splittest_Send_Step3_ListsIntro}
						{/if}
						{if $SendingToSegments}
							<li>{$lang.Addon_splittest_Send_Step3_SegmentsIntro}
						{/if}
						<ul style="list-style: circle; margin-left:40px;">
							<li>
								{foreach from=$sendLists key=id item=name id=listLoop}
									{$name}{if !$listLoop.last}, {/if}
								{/foreach}
							</li>
						</ul>
					</li>
					{if $CronEnabled}
						<li>
							{$JobScheduleTime}
						</li>
					{/if}
					<li>{$SendingToNumberOfContacts}</li>
				</ul>
				<br/>
			</td>
		</tr>
		{if $CronEnabled == false}
			<tr>
				<td class="body">
					<input type="button" value="{$lang.Addon_splittest_Send_Step3_SendButton}" class="FormButton_wide  SmallButton btn save-btn" style="width:223px" onclick="javascript: PopupWindow();">
					<input type="button" value="{$lang.Addon_splittest_Send_Step3_CancelButton}" class="FormButton_wide SaveAddButton FormButton btn cancel-btn" onclick="if(confirm('{$lang.Addon_splittest_Send_Step3_CancelButtonAlert}')) {document.location='{$AdminUrl}';}">
				</td>
			</tr>
		{else}
			<tr>
				<td class="body">
					<input type="submit" value="{$lang.Addon_splittest_Send_Step3_ScheduleButton}" class="FormButton_wide  SmallButton btn save-btn" style="width:223px">
					<input type="button" value="{$lang.Addon_splittest_Send_Step3_CancelButton}" class="FormButton_wide SaveAddButton FormButton btn save-btn" onclick="if(confirm('{$lang.Addon_splittest_Send_Step3_CancelButtonAlert}')) {document.location='{$AdminUrl}';}">
				</td>
			</tr>
		{/if}
	</table>
</form>
{if $CronEnabled == false}
	<script>
		function PopupWindow() {
			var top = screen.height / 2 - (170);
			var left = screen.width / 2 - (225);
			if(confirm('{$lang.Addon_splittest_Send_Step3_Send_ConfirmMessage}')) {
				window.open("{$AdminUrl}&Action=Send&Step=4&popup=1&Start=1", "sendWin","left=" + left + ",top="+top+",toolbar=false,status=no,directories=false,menubar=false,scrollbars=false,resizable=false,copyhistory=false,width=450,height=290");
			}
		}
	</script>
{/if}
<style>
.FormButton {
    margin-top: 0px !important;
}
.BodyContainer {
    width: 98%;
    margin: 0 10px 10px 10px;
}
.ContentContainer ul li b {
    font-weight: 600 !important;
}
.warningOldStyle {
    word-break: break-all !important;
}
.warningOldStyle img:nth-child(1) {
    margin-top: -5px !important;
    margin-bottom: -5px !important;
}
.warningOldStyle br {
    margin:10px 0px !important;
    content: "";
    display: block;
}
@media screen and (max-width:1024px){
    .BodyContainer {
        width: 98%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:768px){
    .BodyContainer {
        width: 97.5%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:414px){
    .BodyContainer {
        width: 95%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:411px){
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:375px){
    .BodyContainer {
        width: 94.5%;
        margin: 0 10px 10px 10px;
    }
	.FormButton_wide {
        margin-bottom: 10px !important;
    }
}
@media screen and (max-width:360px){
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
    .FormButton_wide {
        margin-bottom: 10px !important;
    }
}
</style>



