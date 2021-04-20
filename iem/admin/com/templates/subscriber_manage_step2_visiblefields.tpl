<tr>
    <td colspan="2" class="EmptyRow">
        &nbsp;
    </td>
</tr>
<tr>
    <td colspan="2" class="Heading2" style="font-family: 'Roboto',Arial, Tahoma, sans-serif; font-size:18px ;padding: 20px 0px;background-color:#FFFFFF;font-weight:normal;height:62px;background-image:none; border-top :1px solid rgba(204, 204, 204, 0.35) ; border-bottom :1px solid rgba(204, 204, 204, 0.35);">
        %%LNG_VisibleFields%%
    </td>
</tr>
<tr>
    <td width="20%" class="width20Percent col-md-4 col-12 FieldLabel width20Percent col-form-label">
        %%LNG_ShowTheseFields%%:
    </td>
    <td class="secondTd" style="font-family: 'Roboto', Arial, Tahoma, sans-serif; color: #000; font-size:14px;  color: #000;">
        <select id="fields" name="VisibleFields[]" multiple="multiple" class="SelectedLists ISSelectDiv ISSelectReplacement form-control"" style="height:150px;">
            %%GLOBAL_VisibleFields%%
        </select>%%LNG_HLP_VisibleFields%%
    </td>
</tr>
<style>

.width20Percent{
    padding:20px 10px 0px 10px;
}
.FieldLabel{
    color:#000;
}
.ISSelectSearch {
    height:30px;
    width:450px !important;
}
.SelectedSegments{
    width:450px !important;
}
.ISSelectDiv{
    height:150px !important;
    width:450px !important;
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
*{
    box-sizing:border-box;
}
.form-control {
    display:inline;
}
@media screen and (max-width:1024px){
    .HelpToolTip_Placeholder{
        margin:20px -125px !important;
    }
    .HelpToolTip img:first-child{
        margin-top:3px !important;
        margin-left:1px !important;
    }
    .ISSelectDiv, .ISSelectSearch {
        width:450px !important;
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
    input.ISSelectSearch {
        width:400px;
    }
}
@media screen and (max-width:768px){
    
    .ISSelectDiv, .ISSelectSearch {
        width:350px !important;
    }
}
@media screen and (max-width:568px){
    select {
        width:210px !important;
    }
}
@media screen and (max-width:414px){
    .ISSelectDiv, .ISSelectSearch {
        width:250px !important;
    }
}
@media screen and (max-width:411px){
   
    .ISSelectDiv, .ISSelectSearch {
        width:187px !important;
    }
}
@media screen and (max-width:375px){
    .ISSelectDiv, .ISSelectSearch {
        width:215px !important;
    }
}
@media screen and (max-width:360px){

    .ISSelectDiv, .ISSelectSearch {
        width:148px !important;
    }
}
@media screen and (max-width:320px){

    .ISSelectDiv, .ISSelectSearch {
        width:143px !important;
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