<div class="body">
    <br>%%GLOBAL_EmailsSentIntro%%
    <table border=0 cellpadding="5" cellspacing="1" width="100%" class="Text pageSummaryTable">
        <tr>
            <td width="100%" colspan="2">
                <table width="100%" class="dateTable" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td valign="top">
                            %%GLOBAL_Calendar%%
                        </td>
                        <td valign="top" align="right">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                %%GLOBAL_UserChart%%
            </td>
        </tr>
        <tr class="Heading3">
            <td align="left">
                %%LNG_DateTime%%
            </td>
            <td align="left">
                %%LNG_UserNewslettersSent%%
            </td>
        </tr>
        %%GLOBAL_Stats_Step3_EmailsSent_List%%
        <tr class="Heading3">
            <td align="left">
                %%LNG_Total%%
            </td>
            <td align="left">
                %%GLOBAL_TotalEmailsSent%%
            </td>
        </tr>
    </table>
    <br><br>
</div>

<style>
div.columnChartDiv{
    width:900px;
}
.Heading3 td {
    padding:10px;
}
.customdates > .form-control {
    display:inline;
}
.calenderDate {
	width: auto !important;
	height: 30px !important;
    padding:0;
}
.calenderMonth {
	width: auto !important;
	height: 30px !important;
    padding:0;
}
.calenderYear {
	width: auto !important;
	height: 30px !important;
    padding:0;
}
.CalendarSelect {
    height:35px;
    width:135px;
}
.goButton {
    height:35px !important;
}
.GridRow:nth-child(even) {background-color: #f2f2f2;}
.GridRow:nth-child(odd) {background-color: #fff;}
.GridRow td {
    text-align: left;
    padding: 10px;
    word-wrap: break-word;
}
.pageSummaryTable {
    margin-top:15px;
}
@media screen and (max-width: 1700px) {
    div.columnChart{
        width: 93.5vw !important;
        overflow-x: hidden !important;
    }
}
@media screen and (max-width: 1040px) {
    div.columnChart{
        width: 925px !important;
        overflow-x: scroll !important;
    }
}
@media screen and (max-width: 1024px) {
    div.columnChart{
        width: 925px !important;
        overflow-x: scroll !important;
    }
}
@media screen and (max-width: 780px) {
    div.columnChart{
        width: 715px !important;
        overflow-x: hidden !important;
    }
    .columnChart {
        width: 94vw;
        overflow-x: scroll;
     }
    .dateTable tr {
        display: flex;
        flex-wrap: wrap;
    }
    .columnChartDiv {
        width: 750px !important;
    }
    .dateTable {
        width:100wv;
    }
    .dateTD1 {
        padding-top:6px;
    }
    .customdates {
        padding-left: 110px;
    }
}

@media screen and (max-width: 768px) {
    div.columnChart{
        width: 715px !important;
        overflow-x: scroll !important;
    }
    .customdates {
        padding-left: 106px;
    }
}

@media screen and (max-width: 480px) {
    div.columnChart{
        width: 353px !important;
        overflow-x: scroll !important;
    }
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 414px) {
    div.columnChart{
        width: 353px !important;
        overflow-x: scroll !important;
    }
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 411px) {
    div.columnChart{
        width: 353px !important;
        overflow-x: scroll !important;
    }
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 370px) {
    div.columnChart{
        width: 280px !important;
        overflow-x: scroll !important;
    }
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 360px) {
    div.columnChart{
        width: 317px !important;
        overflow-x: scroll !important;
    }
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}

@media screen and (max-width: 320px) {
    div.columnChart{
        width: 280px !important;
        overflow-x: scroll !important;
    }
	.dateTD1 {
		width: 109px;
	}
	.dateTD2 {
		width: 165px;
	}
    .toCalenderdate {
        margin-left:110px !important;
    }
    .customdates {
        padding-left: 110px;
    }
    .CalendarSelect {
        height: 35px;
        width: 135px;
        padding: 0px;
    }
    .calenderDate {
        width: 40px !important;
        height: 30px !important;
        padding: 0px;
    }
    .calenderMonth {
        width: 50px !important;
        padding: 0px;
        height: 30px !important;
    }
    .calenderYear {
        width: 55px !important;
        height: 30px !important;
        padding: 0px;
    }
    .goButton {
        height: 40px;
        width: 40px;
        border-radius: 5px;
        margin-left: 5px;
        border: 1px solid #ccc;
        background-color: #ffff;
    }
}
@media screen and (min-width: 1000px) {
    .columnChartDiv {
        width:800px;
    }
    .active .columnChartDiv {
        width:100%;
    }
}
</style>