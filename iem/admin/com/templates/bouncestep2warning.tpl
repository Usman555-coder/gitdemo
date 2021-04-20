{assign step="2"}
{template="bounce_navigation"}

<table cellspacing="0" cellpadding="0" width="100%" align="center">
    <tr>
        <td class="Heading1 col-sm-4 Heading1New">
            {$lang.Bounce_Step2}
        </td>
    </tr>
    <tr>
        <td class="body pageinfo">
        </td>
    </tr>
    <tr>
        <td>
            {$message}
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td>
                        <div class="Heading1 col-sm-4 Heading1New">
                            {$problem_name}
                        </div>
                        <p class="PageIntroP">
                        {if $problem_type == 'unknown'}
                            {$lang.Bounce_Help_PossibleSolutions_Unknown}
                        {else}
                            {$lang.Bounce_Help_PossibleSolutions}
                        {/if}
                        </p>
                    </td>
                </tr>
                <tr valign="top">
                    <td>
                        <ul>
                            {foreach from=$problem_advice key=title item=article}
                                <li> {$title} </li>
                                {/foreach}
                        </ul>
                    </td>
                </tr>
                <tr height="15px"></tr>
                <tr valign="top">
                    <td>
                        <input class="ReviewButtonPage FormButton btn save-btn" type="button" value="{$lang.Bounce_Review_Settings}" onclick="window.location.href = 'index.php?Page=Bounce&Action=BounceStep2';">
                        <button class="FormButton  btn cancel-btn ReviewButtonPage">
                        <a href="index.php?Page=Bounce" onclick='return confirm("{$lang.Bounce_CancelPrompt}");'>{$lang.Cancel}</a>
                        </button>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--

Error Report
============

{$error_report}

-->

<style>
.ReviewButtonPage{
    width:200px !important;
}
@media screen and (max-width:414px){
    .cancel-btn{
        margin-top:5px !important;
    }
}
</style>