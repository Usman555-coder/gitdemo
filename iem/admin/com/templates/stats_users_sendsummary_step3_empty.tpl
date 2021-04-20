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
        %%GLOBAL_UserHasNotSentAnyNewsletters%%
    </table>
    <br><br>
</div>
<style>
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
@media screen and (max-width: 780px) {
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
    .customdates {
        padding-left: 106px;
    }
}

@media screen and (max-width: 480px) {
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 414px) {
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 411px) {
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 370px) {
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}
@media screen and (max-width: 360px) {
    .toCalenderdate {
        margin-left:106px !important;
    }
    .customdates {
        padding-left: 106px;
    }
}

@media screen and (max-width: 320px) {
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
</style>