@JS()
library tui_calendar_interop;

import 'package:js/js.dart' ;
import 'package:js/js_util.dart';


@JS('tui.Calendar')
class Calendar {
 
  external  factory Calendar(String container,dynamic options);
  external Function(dynamic event) get on;
  external Function(String newViewName,bool force) get changeView;
  external Function([bool immediately] ) get clear;
  external Function(int offset) get setTimezoneOffset;
  external Function(dynamic options,bool silent) get setOptions;
  external Function() get today;
  external Function(String calendarId,bool toHide,bool render) get toggleSchedules;
  external Function(bool enabled) get toggleScheduleView;
  external Function(bool enabled) get toggleTaskView;
  external Function(String scheduleId,String calendarId,dynamic changes,bool silent) get updateSchedule;
  external Function(String date) get setDate;
  external Function(String calendarId,dynamic option,bool silent) get setCalendarColor;
  external Function() get scrollToNow;
  external Function(bool immediately) get render;
  external Function() get prev;
  external Function() get next;
  external Function() get getViewName;
  external Function() get hideMoreView;
  external Function(String scheduleId,String calendarId) get getSchedule;
  external Function() get getOptions;
  external Function(String scheduleId,String calendarId) get getElement;
  external Function() get getDateRangeStart;
  external Function() get getDateRangeEnd;
  external Function() get getDate;
  external Function() get destroy;
  external Function(String scheduleId,String calendarId,bool silent) get deleteSchedule;
  external Function(List<dynamic> schedules,bool silent) get createSchedules;
  external Function(dynamic schedule) get openCreationPopup;
 
}
@JS('TZDate')
class TZDate {
  external  factory TZDate(String date);
   external Function() get getTime;
   external Function() get getUTCTime;
   external Function() get toDate;
   external Function() get toLocalTime;
   external Function() get toUTCString;

   
}

Object mapToJsObject(Map<String, dynamic> dartMap) {
  var jsObject = newObject();

  dartMap.forEach((name, value) {
    setProperty(jsObject, name, value);
  });

  return jsObject;
}
