{assign step="5"}
{template="bounce_navigation"}

<form>
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
                            <input class="FormButton btn save-btn ReviewButtonPage" type="button" value="{$lang.Bounce_Process_Once_More}" id="ProcessAnother">
                            <button class="FormButton  btn cancel-btn ReviewButtonPage">
                                <a href="index.php">{$lang.Bounce_Process_Finished}</a>
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
        $('#ProcessAnother').click(function () {
            window.location.href = 'index.php?Page=Bounce';
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