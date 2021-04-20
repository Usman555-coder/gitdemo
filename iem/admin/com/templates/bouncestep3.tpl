{assign step="3"}
{template="bounce_navigation"}

<form method="post" action="">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td class="Heading1">
                {$heading}
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
                <table cellpadding="0" cellspacing="0">
                    <tr valign="top">
                        <td>
                            {if $email_count > 0}
                                <input class="FormButton btn save-btn ReviewButtonPage" type="button" id="FindBounces" value="{$lang.Bounce_Find_Bounces}">
                                {$lang.OR}
                            {else}
                                {$lang.BounceAccountEmpty}
                            {/if}
                            <button class="FormButton  btn cancel-btn ReviewButtonPage">
                                <a href="index.php?Page=Bounce" onclick='return confirm("{$lang.Bounce_CancelPrompt}");'>{$lang.Cancel}</a>
                            </button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

<script>

    $(function () {

        $('#FindBounces').click(function () {
            tb_show('', 'index.php?Page=Bounce&Action=ProcessDisplay&keepThis=true&TB_iframe=tue&height=320&width=450&modal=true', '');
        });

    });

</script>


<style>
.ReviewButtonPage{
    width: fit-content;
    word-break: break-word;
    white-space: normal;
}
@media screen and (max-width:414px){
    .cancel-btn{
        margin-top:5px !important;
    }
}
</style>