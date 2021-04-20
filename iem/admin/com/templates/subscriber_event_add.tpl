<script>
    // Resets the form, if subscriberid and eventid are given, prints an update form. If subscriberid and listid are given prints a form for a new event.
    var etOver = false;

    var eventTypes = %%GLOBAL_EventTypesJSON%% ;
            var eventTypesLoad = true;

    $(document).ready(function () {
        var elmList = $('<ul></ul>');
        var elmDiv = $('<div id="eventTypes"></div>');

        for (i = 0; i < eventTypes.length; i++) {
            elmList.append('<li>' + escapeHTML(eventTypes[i]) + '</li>');
        }

        elmDiv.append(elmList);

        // Store element offset.
        var elmOffset = $('#eventType').offset();
        var elm = $('#eventType');
        // Append the timPicker to the body and position it.
        elmDiv.appendTo('body').css({'top':elmOffset.top, 'left':elmOffset.left}).hide();

        setListEvents();

        var showEventTypes = function () {
            if (eventTypesLoad) {
                var elmOffset = $('#eventType').offset();
                var elm = $('#eventType');
                // Append the timPicker to the body and position it.
                $('#eventTypes').css({'top':elmOffset.top+5, 'left':elmOffset.left}).css('width', elm[0].clientWidth).show();
            } else {
                eventTypesLoad = true;
            }
        };

        $('#eventType').unbind().click(showEventTypes).focus(showEventTypes).blur(function () {
            if (!etOver) {
                $('#eventTypes').hide();
            }
        }).attr('autocomplete', 'OFF')
                .keypress(function (e) {
                    switch (e.keyCode) {
                        case 38: // Up arrow.
                        case 63232: // Safari up arrow.
                            var $selected = $("#eventTypes li.selected");
                            var prev = $selected.prev().addClass("selected")[0];
                            if (prev) {
                                $selected.removeClass("selected");
                                elmDiv[0].scrollTop = prev.offsetTop;
                            }
                            return false;
                            break;
                        case 40: // Down arrow.
                        case 63233: // Safari down arrow.
                            var $selected = $("#eventTypes li.selected");
                            var next = $selected.length ? $selected.next().addClass("selected")[0] : $("#eventTypes li:first").addClass("selected")[0];
                            if (next) {
                                $selected.removeClass("selected");
                                elmDiv[0].scrollTop = next.offsetTop;
                            }
                            return false;
                            break;
                        case 13: // Enter
                            if (!$('#eventTypes').is(":hidden")) {
                                var sel = $("#eventTypes li.selected");
                                $('#eventType').val(sel.html());
                                if ($('#eventSubject').val() == '') {
                                    $('#eventSubject').val($('#eventType').val());
                                }
                                $('#eventTypes').hide();
                                return false;
                            }
                            break;
                        case 27: // Escape
                            $('#eventTypes').hide();
                            top.tb_remove();
                            break;
                    }
                });
    });

    function setListEvents() {
        $('#eventTypes li').mouseover(function () {
            $('#eventTypes li.selected').removeClass('selected');
            $(this).addClass('selected');
        }).mousedown(function () {
            etOver = true;
        }).click(function () {

            $('#eventType').val(unescapeHTML($(this).html()));
            if ($('#eventSubject').val() == '') {
                $('#eventSubject').val($('#eventType').val());
            }
            etOver = false;
            $('#eventTypes').hide();
        });
    }

    function resetForm(_subscriberid, _eventid, _listid) {
        $('.dropdown-log-menu').removeClass('show');

        // Clear form values
        $("#eventAddForm")[0].reset();

        var now = new Date();
        var hour = now.getHours();
        var ampm = '';

        // Initialize date/time picker, set values to now
        if (hour > 12) {
            hour = hour - 12;
            ampm = 'pm';
        } else {
            ampm = 'am';
        }
        if (hour == 0) {
            hour = 12;
        }
        var minutes = now.getMinutes();
        if (minutes < 10) {
            minutes = "0" + String(minutes);
        }

        $('#eventTime')[0].value = hour + ":" + minutes + " " + ampm;
        $('#eventDate')[0].value = (now.getDate() < 10 ? '0' : '') + now.getDate() + "/" + (now.getMonth() + 1) + "/" + now.getFullYear();

        $('.time-pick').timePicker({
            show24Hours: false,
            separator: ':',
            step: 30
        });
        $('.date-pick').datepicker();

        $('#eventType').children('.dxComboboxClass').remove();
        $('#eventType')[0].selectedIndex = 0;

        if (_subscriberid && _eventid) {
            // This is an update form, load event values
            $('#eventSubject')[0].value = subscribers[_subscriberid][_eventid].eventsubject;

            var eventtype = subscribers[_subscriberid][_eventid].eventtype;
            $('#eventType').val(eventtype);

            $('#eventTypes li').removeClass('selected');
            var types = $('#eventTypes li');
            for (i = 0; i < types.length; i++) {
                if (unescapeHTML($(types[i]).html()) == eventtype) {
                    $(types[i]).addClass('selected');
                }
            }

            $('#eventDate')[0].value = subscribers[_subscriberid][_eventid].date;
            $('#eventTime')[0].value = subscribers[_subscriberid][_eventid].time;
            $('#eventnotes')[0].value = subscribers[_subscriberid][_eventid].eventnotes;
            subscriberid = _subscriberid;
            eventid = _eventid;

            loadevent = [];

            $('#saveButton').html('%%LNG_Save%%');
        } else {
            // This is a form for a new event
            subscriberid = _subscriberid;
            eventid = _eventid;
            listid = _listid;

            $('#saveButton').html('%%LNG_Add_Event%%');
        }
    }

    // This is called when the form is submitted
    function saveEvent() {
        if ($('#eventType').val() == "") {
            alert("%%LNG_SelectAnEventType%%");
            $('#eventType').focus().select();
            return false;
        }
        if ($('#eventSubject').val() == "") {
            alert("%%LNG_EnterEventSubject%%");
            $('#eventSubject').focus().select();
            return false;
        }

        $('#eventTypes').hide();

        // Add event text to eventTypes array
        var matches = 0;
        for (i = 0; i < eventTypes.length; i++) {
            if (eventTypes[i].toLowerCase() == $('#eventType').val().toLowerCase()) {
                matches++;
                break;
            }
        }
        if (!matches) {
            eventTypes[eventTypes.length] = $('#eventType').val();
            $('#eventTypes ul').append('<li>' + escapeHTML($('#eventType').val()) + '</ul>');
            setListEvents();
        }

        var segment = (Application.Page.Subscriber_Manage ? Application.Page.Subscriber_Manage.segmentID : (SegmentID ? SegmentID : ''));
        if (segment != '')
            segment = '&SegmentID=' + segment;

        if (subscriberid && eventid) {
            // We're updating an event
            $('#loading_indicator').css('z-index', 1024);
            $.post('index.php?Page=Subscribers&Action=Event&SubAction=EventUpdate&eventid=' + eventid + '&id=' + subscriberid + segment, $('#eventAddForm').formSerialize(),
                    function (data, textStatus) {
                        eval(data);
                    }
            );
        } else {
            // This is a new event
            $('#loading_indicator').css('z-index', 1024);
            $.post('index.php?Page=Subscribers&Action=Event&SubAction=EventSave&List=' + listid + '&id=' + subscriberid + segment, $('#eventAddForm').formSerialize(),
                    function (data, textStatus) {
                        eval(data);
                    }
            );
        }
        return false;
    }
</script>
<script>
    parent.postMessage({'task': 'scroll_top'});
</script>
<form onsubmit="return false;" class="Text" id="eventAddForm" style="padding: 0px 10px;">
    <table style="width: 100%;border-collapse: separate;  border-spacing: 10px">
        <tr>
            <td valign="top" width="100">%%LNG_EventType%%:</td>
            <td style="width: 90%;height:30px">
                <input type="text" id="eventType" class="Field form-control Field350Custom eventTypeInput" name="event[type]" />
            </td>
        </tr>
        <tr>
            <td valign="top" width="100">%%LNG_Subject%%:</td>
            <td style="width: 90%;height:30px">
                <input type="text" id="eventSubject" class="Field form-control Field350Custom eventTypeSubject" name="event[subject]"/>
            </td>
        </tr>
        <tr>
            <td>%%LNG_Date%%:</td>
            <td>
                <input  type="text" name="event[date]" class="dateSection date-pick Field" id="eventDate" style="width: 100px;">
                <input   type="text" name="event[time]" class="dateSection time-pick Field" id="eventTime" value="%%GLOBAL_Time%%" style="width: 90px;">
            </td>
        </tr>
        <tr>
            <td valign="top"style="
    vertical-align: middle;
" class="noteslabel">%%LNG_Notes%%:</td>
            <td>
                <textarea style="width: 99%; height: 200px;" class="Field form-control eventTypeNote" name="event[notes]" id="eventnotes"></textarea>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><button class="btn btn-primary" id="saveButton" onclick="return saveEvent();">%%LNG_Add_Event%%</button> <button class="btn btn-primary" onclick="tb_remove();">%%LNG_Cancel%%</button> <img src="images/searching.gif" class="loadingImage" style="display: none;"></td>
    </table>
</form>
