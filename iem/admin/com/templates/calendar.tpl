<form name="customDateForm" method="post" action="index.php?Page=%%PAGE%%&%%GLOBAL_FormAction%%" style="margin: 0px;">
    <table border="1" cellspacing=0 cellpadding=0>
        <tr>
            <td bgcolor="#EEEEEE" class="dateTD1"><img src="images/customCalender.svg" width="20" height="20" align="absMiddle" style="vertical-align: bottom;">&nbsp;%%LNG_DateRange%%:&nbsp;</td>
            <td bgcolor="#EEEEEE" class="dateTD2" style="display:flex">
                <select name="Calendar[DateType]" class="CalendarSelect form-control" onChange="doCustomDate(this, %%GLOBAL_TabID%% )">
                    %%GLOBAL_CalendarOptions%%
                </select>
                <input type=submit value=%%LNG_Go%% class="goButton">
            </td>
            
        </tr>
        <tr>
        
            <td bgcolor=#EEEEEE></td>
            <td bgcolor="#EEEEEE"  style="padding-top:5pt">
                <span id=customDate%%GLOBAL_TabID%% style="display:%%GLOBAL_CustomDateDisplay%%" class="customdates">
                    <select name="Calendar[From][Day]" class="CalendarSelect calenderDate form-control"Small style="margin-bottom:3px">%%GLOBAL_CustomDayFrom%%</select>
                    <select name="Calendar[From][Mth]" class="CalendarSelect calenderMonth form-control"Small style="margin-bottom:3px">%%GLOBAL_CustomMthFrom%%</select>
                    <select name="Calendar[From][Yr]" class="CalendarSelect calenderYear form-control"Small style="margin-bottom:3px">%%GLOBAL_CustomYrFrom%%</select>
                    <span class=body>%%LNG_To%%</span>
                    <select name="Calendar[To][Day]" class="CalendarSelect calenderDate toCalenderdate form-control"Small style="margin-bottom:3px">%%GLOBAL_CustomDayTo%%</select>
                    <select name="Calendar[To][Mth]" class="CalendarSelect calenderMonth form-control"Small style="margin-bottom:3px">%%GLOBAL_CustomMthTo%%</select>
                    <select name="Calendar[To][Yr]" class="CalendarSelect calenderYear form-control"Small style="margin-bottom:3px">%%GLOBAL_CustomYrTo%%</select>
                </span>
                <span class="body" id="showDate%%GLOBAL_TabID%%" style="display:%%GLOBAL_ShowDateDisplay%%; padding-top: 6pt;"><i>%%GLOBAL_DateRange%%</i></span>
            </td>
            
        </tr>
    </table>
</form>
