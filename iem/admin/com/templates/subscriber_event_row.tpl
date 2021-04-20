<tr class="GridRow" id="event_%%GLOBAL_SubscriberID%%_%%GLOBAL_eventid%%">
    <td align="center"><input type="checkbox" value="%%GLOBAL_eventid%%" class="event_checkbox"></td>
    <td align="left"><img src="images/%%GLOBAL_Icon%%"></td>
    <td align="left" style="padding-left:0px;" width="30%"><div style="overflow:hidden;">%%GLOBAL_Subject%% - <span style="color:#777777;">%%GLOBAL_Notes%%</span></div></td>
    <td align="left" style="padding-left:0px;">%%GLOBAL_Type%%</td>
    <td align="left" style="padding-left:0px;">%%GLOBAL_Date%%</td>
    <td>%%GLOBAL_User%%</td>
    <td>
        <div class="dropdown ml-1">
            <button class="btn p-0" type="button" id="dropdownMenuButton%%GLOBAL_eventid%%" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span><i class="fa fa-ellipsis-v" aria-hidden="false"></i></span>
            </button>
            <div class="dropdown-log-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton%%GLOBAL_DeleteSubscriberID%%" >
                %%GLOBAL_EventEditLink%%
                %%GLOBAL_EventDeleteLink%%
            </div>
        </div>
    </td>
</tr>
<style>
.viewPage_EditLink,
.viewPage_DelLink  {
  display: block;
  width: 100%;
  padding: 0.25rem 1.5rem;
  clear: both;
  font-weight: 400;
  color: #212529;
  text-align: inherit;
  white-space: nowrap;
  background-color: transparent;
  border: 0;
}
.viewPage_EditLink:focus,
.viewPage_EditLink:hover,
.viewPage_DelLink:focus,
.viewPage_DelLink:hover {
  color: #16181b;
  text-decoration: none;
  background-color: #f8f9fa;
}
.viewPage_EditLink.active,
.viewPage_DelLink:active {
  color: #fff;
  text-decoration: none;
  background-color: #0d5085;
}
.viewPage_EditLink.disabled,
.viewPage_DelLink:disabled  {
  color: #6c757d;
  pointer-events: none;
  background-color: transparent;
}
.viewPage_EditLink-text,
.viewPage_DelLink-text {
  display: block;
  padding: 0.25rem 1.5rem;
  color: #212529;
}
</style>
<script>
    if (!subscribers[%%GLOBAL_SubscriberID%%]) {
    subscribers[%%GLOBAL_SubscriberID%%] = new Array;
    }
    subscribers[%%GLOBAL_SubscriberID%%][%%GLOBAL_eventid%%] = %%GLOBAL_EventJSON%% ;
</script>
