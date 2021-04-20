<form method="post" action="index.php?Page=Subscribers&Action=%%GLOBAL_FormAction%%&SubAction=step3&Lists[]=%%GLOBAL_List%%">
    <table cellspacing="0" cellpadding="0" border-spacing ="0"  width="100%" align="center" style="position:relative ; border-collapse: collapse;" class="tableContainer">
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                %%GLOBAL_Heading%%
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    %%LNG_Subscribers_Export_Step2_Intro%%
                </p>
            </td>
        </tr>
        <tr>
            <td style="font-size:13px;color: #212529;" >
                %%GLOBAL_Message%%
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground" style="margin-top:10px ; border-bottom:0px" %%GLOBAL_FilterOptions%%>
                    <tr>
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                            %%LNG_FilterOptions_Subscribers%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel width20Percent col-form-label">
                            {template="Not_Required"}
                            %%LNG_ShowFilteringOptionsLabel_Export%%
                        </td>
                        <td class="" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;">
                            <table width="100%" cellspacing="0" cellpadding="0" style="border-bottom:0px">
                                <tr>
                                    <td colspan="2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px; color: #000;">
                                        <label for="DoNotShowFilteringOptions" class="customRadio" style="margin-right: 5px;"><input  style="margin-right:4px" type="radio" name="ShowFilteringOptions" id="DoNotShowFilteringOptions" value="2" %%GLOBAL_DoNotShowFilteringOptions%% onclick="document.getElementById('FilteringOptions').style.display = 'none';
                                                document.getElementById('filter_next').style.display = '';">%%GLOBAL_DoNotShowFilteringOptionLabel%% <span class="checkmarkRadio"></span></label>
                                        %%LNG_HLP_ShowFilteringOptions%%
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:14px; color: #000;">
                                        <label for="ShowFilteringOptions" class="customRadio"><input type="radio" style="margin-right:4px" name="ShowFilteringOptions" id="ShowFilteringOptions" value="1" %%GLOBAL_ShowFilteringOptions%% onclick="document.getElementById('FilteringOptions').style.display = '';
                                                document.getElementById('filter_next').style.display = 'none';">%%GLOBAL_ShowFilteringOptionLabel%% <span class="checkmarkRadio"></span></label>
                                    </td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                    <tr id="filter_next" style="%%GLOBAL_FilterNext_Display%%">
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                <table border="0" cellspacing="0" cellpadding="2" width="100%" class="Panel whiteBackground"  style="margin-top:10px ; border-bottom:0px;display:none;" id="FilteringOptions" %%GLOBAL_FilteringOptions_Display%%>
                    <tr >
                        <td colspan="2" class="Heading2" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35); color:#1f2327">
                           %%LNG_FilterSearch%%
                        </td>
                    </tr>
                    <tr >
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Email%%:&nbsp;
                        </td>
                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;" class="secondRow">
                            <input type="text" name="emailaddress" value="" class="form-control Field250">%%LNG_HLP_FilterEmailAddress%%
                        </td>
                    </tr>
                    <tr class="whiteBackground">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Format%%:&nbsp;
                        </td>
                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;" class="secondRow">
                            <select name="format" class="form-control" style="width: 18rem;">
                                %%GLOBAL_FormatList%%
                            </select>%%LNG_HLP_FilterFormat%%
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff ; ">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_ConfirmedStatus%%:&nbsp;
                        </td>
                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;" class="secondRow">
                            <select name="confirmed" class="form-control" style="width: 18rem;">
                                <option value="-1" SELECTED>%%LNG_Either_Confirmed%%</option>
                                <option value="1">%%LNG_Confirmed%%</option>
                                <option value="0">%%LNG_Unconfirmed%%</option>
                            </select>%%LNG_HLP_FilterConfirmedStatus%%
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff ; ">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_Status%%:&nbsp;
                        </td>
                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;" class="secondRow">
                            <select name="status" class="form-control" style="width: 18rem;">
                                <option value="-1">%%LNG_AllStatus%%</option>
                                <option value="a" SELECTED>%%LNG_Active%%</option>
                                <option value="b">%%LNG_Bounced%%</option>
                                <option value="u">%%LNG_Unsubscribed%%</option>
                            </select>%%LNG_HLP_FilterStatus%%
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff ; ">
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_FilterByDate%%:
                        </td>
                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;" class="secondRow">
                            <label for="datesearch[filter]" class="customCheckBox"><input type="checkbox" name="datesearch[filter]" id="datesearch[filter]" value="1" %%GLOBAL_FilterChecked%% onClick="javascript: enableDate_SubscribeDate(this, 'datesearch')">&nbsp;%%LNG_YesFilterByDate%% <span class="checkmark"></span></label>
                            %%LNG_HLP_FilterByDate%%
                            <br/>
                            <div id="datesearch" style="display: none">
                                <table border="0" cellspacing="0" cellpadding="0" style="margin-top:10px ; border-bottom:0px">
                                    <tr>
                                        <td valign="middle" class="dateFieldTd">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0" class="dateTypeImg">
                                        </td>
                                        <td class="dateFieldTd">
                                            <select class="datefield  form-control" name="datesearch[type]" onChange="javascript: ChangeFilterOptionsSubscribeDate(this, 'datesearch');">
                                                <option value="after">%%LNG_After%%</option>
                                                <option value="before">%%LNG_Before%%</option>
                                                <option value="exactly">%%LNG_Exactly%%</option>
                                                <option value="between">%%LNG_Between%%</option>
                                            </select>
                                        </td>
                                        <td valign="top" class="dateFieldTd">
                                            %%GLOBAL_Display_subdate_date1_Field1%%
                                            %%GLOBAL_Display_subdate_date1_Field2%%
                                            %%GLOBAL_Display_subdate_date1_Field3%%
                                        </td>
                                    </tr>
                                    <tr style="display: none" id="datesearchdate2">
                                        <td colspan="2" align="right" valign="middle" class="dateFieldTd">
                                            <img src="images/nodejoin.gif" width="20" height="20" border="0">&nbsp;%%LNG_AND%%&nbsp;
                                        </td>
                                        <td valign="top" class="dateFieldTd">
                                            %%GLOBAL_Display_subdate_date2_Field1%%
                                            %%GLOBAL_Display_subdate_date2_Field2%%
                                            %%GLOBAL_Display_subdate_date2_Field3%%
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_ClickedOnLink%%:
                        </td>
                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;" class="secondRow">
                            <label for="clickedlink" class="customCheckBox"><input type="checkbox" name="clickedlink" id="clickedlink" value="1" onClick="javascript: enable_ClickedLink(this, 'clicklink', 'linkid', '%%LNG_LoadingMessage%%')">%%LNG_YesFilterByLink%% <span class="checkmark"></span></label>
                            %%LNG_HLP_ClickedOnLink%%
                            <br/>
                            %%GLOBAL_ClickedLinkOptions%%
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel col-form-label">
                            {template="Not_Required"}
                            %%LNG_OpenedNewsletter%%:
                        </td>
                        <td style="font-family:'Roboto', Arial, Tahoma, sans-serif; color:#000; font-size:14px;" class="secondRow">
                            <label for="openednewsletter" class="customCheckBox"><input type="checkbox" name="openednewsletter" id="openednewsletter" value="1" onClick="javascript: enable_OpenedNewsletter(this, 'opennews', 'newsletterid', '%%LNG_LoadingMessage%%')">&nbsp;%%LNG_YesFilterByOpenedNewsletter%% <span class="checkmark"></span></label>
                            %%LNG_HLP_OpenedNewsletter%%
                            <br/>
                            %%GLOBAL_OpenedNewsletterOptions%%
                        </td>
                    </tr>
                    %%GLOBAL_CustomFieldInfo%%
                </table>
                <table width="100%" cellspacing="0" cellpadding="2" border="0" class="PanelPlain nextCancelButton">
                    <tr>
                        <td class="submitTableBtn FieldLabel">&nbsp;</td>
                        <td valign="top" height="30">
                            <input class="FormButton SaveAddButton btn save-btn SubmitButton" type="submit" value="%%LNG_Next%%">
                            <input class="FormButton CancelButton btn cancel-btn" type="button " value="%%LNG_Cancel%%" onClick='if (confirm("%%LNG_Subscribers_Manage_CancelPrompt%%")) {
                                        document.location = "index.php?Page=Subscribers"
                                    }'>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

<style>
*{
    box-sizing:border-box;
}
.ContentContainer {
    width:100% !important;
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
    margin-top:11.5%;
} 
.ISSelectDiv{
    height:150px !important;
    width:450px !important;
}
.submitTableBtn{
    width:180px;
}
.HelpToolTip img:first-child{
    margin-top:3px;
    margin-left:-2px;
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
@media screen and (max-width:1024px){
    .multiselectTd{
        display:inline;
    }
    .form-control {
        display:inline;
    }
    .ISSelectDiv{
        height:150px !important;
        width:410px !important;
        overflow-x: auto;
        margin-top: 10px;
    }
    .nextCancelButton {
        margin-top:0%;
    } 
    .HelpToolTipDiv{
        margin-left:10px !important;
    }
    .FormButton{
        margin-top:4px;   
    }
    .customRadio {
        width:410px;
    }
    .customCheckBox {
        width:405px;
        margin-left:0px;
    }
    .submitTableBtn{
        width:182px;
    }
    .HelpToolTip_Placeholder{
        margin:23px -130px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:11px;
        margin-left:2px;
    }
    .Panel {
        margin-bottom: 0px;
    }
    input.ISSelectSearch {
        width:410px;
    }
    .width20Percent{
        width:13em !important;
    }
    .Field250{
        width:410px;
        margin-right:0px;
    }
    .Field350 {
        width:410px !important;
        padding-right:0px;
    }
    select {
        width:410px !important;
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
        width:320px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:320px;
    }
    .submitTableBtn{
        width:168px;
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
        width:320px !important;
        margin-right:5px;
    }
    .Field350 {
        width:320px !important;
        padding-right:0px;
    }
    select {
        width:320px !important;
        margin-right:5px;
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
        width:185px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:185px;
    }
    .submitTableBtn{
        width:135px;
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
        width:185px !important;
    }
    .Field350 {
        width:185px !important;
        padding-right:0px;
    }
    select {
        width:185px !important;
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
        margin-top: 20px;
    }
    .customCheckBox {
        width:170px;
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
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:170px !important;
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
        width:200px;
        left:-3px;
        margin-top: 20px;
    }
    .customCheckBox {
        width:200px;
    }
    .submitTableBtn{
        width:98px;
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
        width:8em !important;
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
    }
    select {
        width:200px !important;
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
        width:170px;
        left:-3px;
        margin-top: 20px;
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
        //margin-bottom:10px !important;
    }
    .Panel {
        margin-bottom: 0px;
    }
    .width20Percent{
        width:8em !important;
    }
    .Field250 {
        width:170px !important;
    }
    .Field350 {
        width:170px !important;
        padding-right:0px;
    }
    select {
        width:170px !important;
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