{assign step="1"}
{template="bounce_navigation"}

<form method="post" action="index.php?Page=Bounce&Action=BounceStep2" id="BounceListChooseForm">
    <table cellspacing="0" cellpadding="0" width="100%" align="center" >
        <tr>
            <td class="Heading1 col-sm-4 Heading1New">
                {$lang.Bounce_Step1}
            </td>
        </tr>
        <tr>
            <td class="body pageinfo internalAnchor">
                <p class="PageIntroP">
                    {$lang.Bounce_Step1_Intro}
                </p>
            </td>
        </tr>
        <tr>
            <td>
                {$message}
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr valign="top" style="background-color:#F9F9F9;">
                        
                            <table border="0" cellspacing="0" cellpadding="0" width="100%" class="Panel">
                                <tr>
                                    <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
                                        {$lang.SelectAContactList}
                                    </td>
                                </tr>
                                <tr height="15px"></tr>
                                <tr>
                                    <td class="FieldLabel Field">
                                        {template="Required"}
                                        {$lang.SelectBounceEmail}:&nbsp;
                                    </td>
                                    <td style="padding-top:5px;">
                                        <div class="OuterDiv">
                                        <div class="ISSelect form-control" style="width:450px;">
                                            <ul class="displayTable">
                                                {assign multiples="0"}
                                                {foreach from=$bounce_server_map key=key item=server}
                                                    <li onmouseover="$(this).addClass('ISSelectOptionHover');" onmouseout="$(this).removeClass('ISSelectOptionHover');" style="cursor:pointer;">
                                                        <label class="customRadio" for="server_{$server.0.id}">
                                                            <input name="list" value="{$server.0.id}" id="server_{$server.0.id}" type="radio" onclick="$('.SelectedRow').removeClass('SelectedRow');
                                                                    $(this).parents('li').addClass('SelectedRow');" style="vertical-align:top;" />
                                                            {if substr($key, 0, 1) == '~'}
                                                                {$server.0.name}
                                                            {else}
                                                                {if count($server) > 1}
                                                                    {assign multiples="1"}
                                                                {/if}
                                                                <span class="Bounce_ISSelector_Title">
                                                                    {$server.0.username}@{$server.0.server}
                                                                </span>
                                                                <span class="Bounce_ISSelector_Description">
                                                                    {foreach from=$server item=list id=sequence}
                                                                        <span class="spanFix">{$list.name}</span>
                                                                    {/foreach}
                                                                </span>
                                                            {/if}
                                                            <span class="checkmarkRadio"></span>
                                                        </label>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                        </div>
                                        {$lnghlp.SelectBounceEmail}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td class="internalAnchor">
                                        {if $multiples}<a href="#" class="whylistgrouped">{$lang.WhyListsGrouped}</a>{/if}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <input class="FormButton  btn save-btn" type="submit" value="{$lang.Next}">
                                        <button class="FormButton  btn cancel-btn"><a href="index.php" onclick='return confirm("{$lang.Bounce_CancelPrompt}");'>{$lang.Cancel}</a>
                                        </button>
                                        <br /><br />
                                    </td>
                                </tr>
                            </table>
                        
                     
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

<script>

    $('#BounceListChooseForm').submit(function () {
        var listid = $("input[name='list']:checked").val();
        if (!listid) {
            alert('{$lang.Bounce_PleaseChooseList}');
            return false;
        }
    });

    $('.whylistgrouped').click(function () {
        var url = 'index.php?Page=Bounce&Action=Help&Topic=list_group&keepThis=true&TB_iframe=true&height=200&width=400&random=' + new Date().getTime();
        tb_show('{$lang.BounceProcessHelp}', url, '');
    });

</script> 
<style>
.internalAnchor a {
    color: #279ccb !important;
}
.OuterDiv{
    width:450px !important;
    float:left !important;
}
.displayTable{
    width:100% !important;
}
.spanFix{
    display: block;
    width: 100% !important;
    line-height: 20px;
    font-size: 14px;
}
.FormButton {
    margin-top: 0 !important;
}
.Bounce_ISSelector_Title {
    font-size: 14px;
}
.ISSelect {
    height: 150px;
}
#TB_window{
    //top:10% !important;
}
#TB_iframeContent{
    width:100% !important;
}
.checkmarkRadio{
    top:10px !important;
}
.ContentContainer ul li{
    line-height: 248% !important;
}
button > a:hover{
    text-decoration:none;
}
.BodyContainer {
    width: 98.5%;
    margin: 0 10px 10px 10px;
}
.FieldLabel {
    padding: 6px 10px 0px 0px !important;
    font-weight: normal;
    font-size: 14px;
    font-family: 'Roboto', Arial, Tahoma, sans-serif;
    text-decoration: none;
    vertical-align: top;
    width: 200px;
    height: 26px;
}
.Bounce_ISSelector_Description {
    margin-left: 0px !important;
    font-size: 12px;
}
#TB_window{
	top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: : translate(-50%, -50%);
	-webkit: translate(-50%, -50%);
	-moz-transform: : translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	-webkit-transform: -webkit-translate(-50%, -50%);
}
@media screen and (max-width:1024px){
    .BodyContainer {
        width: 98%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:768px){
    .ISSelect,.OuterDiv {
    width:300px !important;
    }
}
@media screen and (max-width:540px){
    #TB_window{
        //margin-left: -246px !important;
        width: 485px !important;
    }
    .HelpToolTip img:first-child{
    margin-top:5px;
    margin-left:-5px;
    }
    .BodyContainer {
        width: 94%;
        margin: 0 10px 10px 10px;
    }
}
@media screen and (max-width:414px){
    #TB_window{
        //margin-left: -194px !important;
        width: 386px !important;
    }
    .ISSelect,.OuterDiv {
    width:198px !important;
    }
}
@media screen and (max-width:411px){
    #TB_window{
        //margin-left: -180px !important;
        width: 360px !important;
    }
    .ISSelect,.OuterDiv {
    width:198px !important;
    }
}
@media screen and (max-width:360px){
    #TB_window{
        //margin-left: -150px !important;
        width: 298px !important;
    }
    .HelpToolTip_Placeholder{
        margin: 26px -90px !important;
    }
}
@media screen and (max-width:320px){
    .ISSelect,.OuterDiv {
    width:165px !important;
    }
}

</style>



<style>
#TB_window, .ui-window {
    margin-left: auto !important;
    margin-top: auto !important;
    top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: : translate(-50%, -50%);
	-webkit: translate(-50%, -50%);
	-moz-transform: : translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	-webkit-transform: -webkit-translate(-50%, -50%);
}
</style>