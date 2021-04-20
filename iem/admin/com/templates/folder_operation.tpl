<meta http-equiv="Content-Type" content="text/html; charset=%%GLOBAL_CHARSET%%" />

<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
{* <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet" /> *}
<link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/main.css" type="text/css" />


<link rel="shortcut icon" href="%%GLOBAL_ApplicationFavicon%%" type="image/vnd.microsoft.icon">
<link rel="icon" href="%%GLOBAL_ApplicationFavicon%%" type="image/vnd.microsoft.icon">
<meta http-equiv="Content-Type" content="text/html; charset=%%GLOBAL_CHARSET%%">
<link rel="stylesheet" href="includes/styles/stylesheetdap.css" type="text/css">
<link rel="stylesheet" href="includes/styles/tabmenu.css" type="text/css">
<link rel="stylesheet" href="includes/styles/thickbox.css" type="text/css">
<link rel="stylesheet" href="includes/js/imodal/imodal.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
{* <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"> *}
<!--[if IE]>
<style type="text/css"> 
        @import url("includes/styles/ie.css");
</style>
<![endif]-->

<!--<script src="includes/js/jquery.js" type="text/javascript"></script>-->

<script src="assets/js/jquery.js" type="text/javascript"></script>
<script src="assets/js/popper.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script>
var $jq1 = jQuery.noConflict(true);
</script>
<script src="includes/js/jquery.js" type="text/javascript"></script>
<script>
    $(function() {
        $('#FolderOperation_CloseButton').click(function(event) {
            self.parent.closePopup();
        });
    });
</script>
{capture name=folder_type}%%GLOBAL_FolderType%%{/capture}
{capture name=folder_id}%%GLOBAL_FolderID%%{/capture}
{capture name=folder_name}%%GLOBAL_FolderName%%{/capture}
{capture name=operation}%%GLOBAL_FolderOperation%%{/capture}
<div id="FolderOperation_Container">
    <div id="FolderOperation_MessageContainer">
        <div id="FolderOperation_Message">
            <form id="FolderOperation_Form">
               <div>
                {if $operation == 'add'}
                    <span class="text">%%LNG_Folders_NewFolderName%%:</span>
                    <input type="text" id="folder_name" class="form-control Field250" />
                    <input type="submit" value="%%LNG_Folders_Button_Add%%" class="FormButton SaveAddButton btn save-btn SubmitButton popupBtn" />
                {elseif  $operation == 'rename'}
                    %%LNG_Folders_NewFolderName%%:<br />
                    <input type="hidden" id="folder_id" value="{$folder_id}" />
                    <input type="text" id="folder_name" class="form-control Field250" value="{$folder_name}" />
                    <input type="submit" value="%%LNG_Folders_Button_Rename%%" class="FormButton SaveAddButton btn save-btn SubmitButton popupBtn" />    
                {/if}
                <input type="button" value="%%LNG_Folders_Button_Cancel%%" class="FormButton btn cancel-btn CancelButton popupBtn" />
                <script>
                    $(function() {
                    var focus_box = function() {
                    $("#folder_name").focus().select()
                    }
                    // Time-delay hack to get focus working
                    setTimeout(focus_box, 100);
                    // Set up cancel button
                    $('input.CancelButton').click(function() {
                    self.parent.closePopup();
                    });
                    });
                    $('#FolderOperation_Form').submit(function(event) {
                    $.ajax({
                    cache: false,
                            url: 'index.php?Page=Folders&Action=ajax',
                            type: 'POST',
                            dataType: 'json',
                            data:	{
                    {if $operation == 'add'}
                            AjaxType: 'Add',
                    {elseif $operation == 'rename'}
                            AjaxType: 'Rename',
                    {/if}
                            folder_name: $('#folder_name').attr('value'),
                                    folder_type: '{$folder_type}',
                                    folder_id: '{$folder_id}'
                            },
                            success: function(response) {
                            if (response.status && response.status != 'OK' && response.message) {
                            alert(response.message);
                            $("#folder_name").select();
                            return;
                            }
                            self.parent.Application.Ui.Folders.ReloadTable();
                            self.parent.closePopup();
                            },
                            error:	function(response) {
                            $('#FolderOperation_Message').html(response.responseText)
                            }
                    });
                    return false;
                    });
                </script>
        </div>
    </div>
    <br />
</div>

<style>
.Field250{
    width:410px;
    margin-right:0px;
}
.Field350 {
    width:410px !important;
    padding-right:0px;
}
.FormButton {
    font-size: 14px;
    width: 80px;
}
body {
    margin: 0;
    padding: 10px;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    background:white;
}
.text{
    font-family:14px;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
}
#FolderOperation_Container {
    padding: 0;
    margin: 0;
}
#FolderOperation_Close {
    float: right;
    cursor: pointer;
}
#FolderOperation_MessageContainer {
    overflow: hidden;
    padding: 0;
    margin: 0;
    background:white;
}
#FolderOperation_Message {
    padding: 0;
    margin: 0;
    padding-top: 1em;
}
#FolderOperation_Loading {
    text-align: center;
}
@media screen and (max-width:1024px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
@media screen and (max-width:823px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
@media screen and (max-width:768px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
@media screen and (max-width:414px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
@media screen and (max-width:411px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
@media screen and (max-width:375px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
@media screen and (max-width:360px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
@media screen and (max-width:320px){
    .FormButton{
        margin-top:4px;   
    }
    .Field250 {
        width:200px !important;
    }
    .Field350 {
        width:200px !important;
        padding-right:0px;
        margin:0px
    }
    #folder_name {
        margin-bottom:0px !important;
        width:270px !important;
    }
    #TB_iframeContent{
        width:285px !important;
        height:133px !important;
    }
    #FolderOperation_Message {
        padding-top:0px !important;
    }
    .popupBtn {
        margin-top:10px !important;
    }
}
</style>