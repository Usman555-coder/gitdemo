<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
	<tr>
		<td class="Heading1 col-sm-4 Heading1New">
			{$lang.Addon_splittest_Send_Step4_Heading}
		</td>
	</tr>
	<tr>
		<td class="body pageinfo internalAnchor">
			<div style="background-color:#faa527 !important;color:#000000; padding:8px; margin-bottom:10px;">{$lang.Addon_splittest_Send_Step4_KeepBrowserWindowOpen}</div>
		</td>
	</tr>
	<tr>
		<td class="body">
			<ul style="line-height:1.5; margin-left:30px; padding-left:0px; margin-bottom:20px;">
				<li>{$Send_NumberAlreadySent}</li>
				<li>{$Send_NumberLeft}</li>
				<li>{$SendTimeSoFar}</li>
				<li>{$SendTimeLeft}</li>
			</ul>
			<input type="button" class="FormButton_wide SmallButton btn save-btn" style="width:260px" value="{$lang.Addon_splittest_Send_Step4_PauseSending}" onclick="PauseSending()" />
		</td>
	</tr>
</table>
<script>
	function PauseSending() {
		window.opener.document.location = '{$AdminUrl}&Action=Send&Step=10';
		window.opener.focus();
		window.close();
	}
</script>

<script>
	setTimeout('window.location="{$AdminUrl}&Action=Send&Step=4&popup=1"', 1);
</script>
<style>
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
}
@media screen and (max-width:360px){
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:320px){
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
    .FormButton_wide {
        margin-bottom: 10px !important;
    }
}
.FormButton {
    margin-top: 0px !important;
}
</style>

