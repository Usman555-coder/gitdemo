<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">
            %%LNG_Send_Finished_Heading%%
        </td>
    </tr>
    <tr>
        <td class="body pageinfo internalAnchor">
            <p class="PageIntroP">
                %%GLOBAL_SendReport_Intro%%
            </p>
        </td>
    </tr>
    <tr>
        <td>
            %%GLOBAL_Send_Report%%
        </td>
    </tr>
    <tr>
        <td><br>
            <input type="button" value="%%LNG_OK%%" onclick="javascript: document.location = 'index.php?Page=Newsletters';" class="FormButton_wide SaveAddButton btn save-btn">
        </td>
    </tr>
</table>
<script>
    function ShowReport(reporttype) {
        var link = 'index.php?Page=Send&Action=View_Report&ReportType=' + reporttype;

        var top = screen.height / 2 - (230);
        var left = screen.width / 2 - (250);

        window.open(link, "reportWin", "left=" + left + ",top=" + top + ",toolbar=false,status=no,directories=false,menubar=false,scrollbars=false,resizable=false,copyhistory=false,width=500,height=460");
    }
</script>
<style>
.ContentContainer ul li {
    line-height: unset !important;
}
.FlashError ul {
    padding-left: 0px;
    padding-top: 20px;
}
.FormButton_wide {
    font-size: 14px;
    width: 100px !important;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
}
.BodyContainer {
    width: 98%;
    margin: 0 10px 10px 10px;
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
}
</style>