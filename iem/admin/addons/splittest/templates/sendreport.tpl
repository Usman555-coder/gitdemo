<table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
	<tr>
		<td class="Heading1 col-sm-4 Heading1New">
			{$lang.Addon_splittest_Send_Step5_Finished_Heading}
		</td>
	</tr>
	<tr>
		<td class="body pageinfo internalAnchor">
			<p class="PageIntroP">
				{$SendReport_Intro}
			</p>
		</td>
	</tr>
	<tr>
		<td>
			{$SendReport_Details}
            <br>
            <hr>
		</td>
	</tr>
	<tr>
		<td><br>
			<input type="button" value="%%LNG_OK%%" onclick="javascript: document.location='{$AdminUrl}';" class="FormButton_wide FormButton btn save-btn">
		</td>
	</tr>
</table>
<script>
	function ShowReport(reporttype) {
		var link = '{$AdminUrl}&Action=Send&Step=15&ReportType=' + reporttype;

		var top = screen.height / 2 - (230);
		var left = screen.width / 2 - (250);

		window.open(link,"reportWin","left=" + left + ",top="+top+",toolbar=false,status=no,directories=false,menubar=false,scrollbars=false,resizable=false,copyhistory=false,width=500,height=460");
	}
</script>
<style>
.ContentContainer ul li {
    line-height: 0%;
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