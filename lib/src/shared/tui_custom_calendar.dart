

import 'dart:html';
import 'dart:js' as js;
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/utils/disposer/disposer.dart';
import 'package:covid19_web/src/shared/interop/tui-calendar.dart' as tui;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';



class TuiCustomCalendar extends Object with Disposable{
  tui.Calendar cal;
  var daynames = ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'];
  TuiCustomCalendar(){
    initializeDateFormatting('fr_FR', null).then((_){});
  }
  
  void init(calendarList,selector){ 
    
    //preRegisterDartFnc();
    js.JsObject my_template = js.context.callMethod('getTuiCaltemplates', []);
    print('creating calendar..');
     cal = tui.Calendar(selector, tui.mapToJsObject({
      'defaultView': 'month',
      'theme': MY_THEME,
      'isReadOnly': true,
      'taskView': true,  // e.g. true, false, or ['task', 'milestone'])
      'scheduleView': ['time'],  // e.g. true, false, or ['allday', 'time'])
      // list of Calendars that can be used to add new schedule
      'calendars': calendarList,
      // whether use default creation popup or not
     'useCreationPopup': false,
      // whether use default detail popup or not
      'useDetailPopup': true,
       'week': tui.mapToJsObject({
        'daynames': daynames,
        'startDayOfWeek': 1,
        'narrowWeekend': true,
        'hourStart': 7,
        'hourEnd': 18,
        }),
      'month': tui.mapToJsObject({
        'daynames': daynames,
        'startDayOfWeek': 1,
        'narrowWeekend': true,

        }),
       //'template' : getCalTemplate(), 
        'template': my_template,
      
      }));
    
     /* calendar.on({
         mapToJsObject('clickSchedule': (e) { print('clickSchedule: $e');},)
      });*/
}

 void toggleCalendar(cal,{bool render=true}){

    cal.checked=!cal.checked;
    cal.toggleSchedules(cal.id, !cal.checked, render);
  }
    void createSchedules(List schedules, bool force) {
    cal.createSchedules(schedules,force);
  }
  void changeView(view,{bool render=true}){
    cal.changeView(view,render);
  }  
  void render({immediately=true}){
    cal.render(immediately);
  }
  void today(){
    cal.today();
  }
  void next(){
    cal.next();
  }
  void prev(){
    cal.prev();
  }
  String getRangeText(){
    if(cal==null) return "";
    int ts1=0,ts2=0;
    var options = cal.getOptions();
    String viewName =cal.getViewName();
    //tui.TZDate d =cal.getDate();    
    //print('cal.getDate().getTime():');print(d.getTime());
    //print('cal.getDateRangeStart().getTime():');print(cal.getDateRangeStart().getTime());
     if (viewName == 'day') {
          ts1 = (cal.getDate() as tui.TZDate).getTime();
          
           return Date.fromTimestamp(ts1).format(DateFormat("dd MMM yyyy",'fr_FR'));
        } else if (viewName == 'month'
        /* &&
            (options.month.visibleWeeksCount==null || options.month.visibleWeeksCount > 4)*/) {
            ts1 = (cal.getDate() as tui.TZDate).getTime();
             return Date.fromTimestamp(ts1).format(DateFormat("MMMM yyyy",'fr_FR')).toUpperCase();
        } else {
            ts1 = (cal.getDateRangeStart()  as tui.TZDate).getTime();
            ts2 = (cal.getDateRangeEnd() as tui.TZDate).getTime();
           return Date.fromTimestamp(ts1).format(DateFormat("dd MMM",'fr_FR')) + " - "  +Date.fromTimestamp(ts2).format(DateFormat("dd MMM yyyy",'fr_FR'));
        }     
    
  }  
/*void preRegisterDartFnc(){
  js.context['tuiMonthGridHeaderExceed'] = getMonthGridHeaderExceed;
} 
String getMonthGridHeaderExceed(hiddenSchedules) {
  return '<span class="badge badge-warning calendar-more-schedules">+' + hiddenSchedules + '</span>'; 
}
*/
dynamic getCalTemplate(){
  return  tui.mapToJsObject({
          'milestone': (schedule) {
              return '<span style="color:red;">' + schedule.title + '</span>';
          },
          'milestoneTitle': () { return 'Milestone'; },
          'task': (schedule) {
            return '&nbsp;&nbsp;#' + schedule.title;
        },
        'taskTitle': () {
            return '<label><input type="checkbox" />Tâches</label>';
        },
       /* 'allday': (schedule) {
            return schedule.title + ' <i class="material-icons">reload</i>';
        },
        'alldayTitle': () {
            return 'All Day';
        },
        'time': (schedule) {
            return  "${schedule.title} <i class=\"material-icons\">range_date</i>${schedule.start}";
        },
        'monthMoreTitleDate': (date) {
            date =  Date(date);
            return tui.util.formatDate('MM-DD', date) + '(' + daynames[date.getDay()] + ')';
        },*/
        'monthMoreClose': () {
            return '<i class="material-icons">close</i>';
        },
        /*'monthGridHeader': (model) {
            var date = parseInt(model.date.split('-')[2], 10);
            var classNames = [];

            classNames.push(config.classname('weekday-grid-date'));
            if (model.isToday) {
                classNames.push(config.classname('weekday-grid-date-decorator'));
            }

            return '<span class="' + classNames.join(' ') + '">' + date + '</span>';
        },*/
        'monthGridHeaderExceed':(hiddenSchedules) {return js.context.callMethod('tuiMonthGridHeaderExceed');},
       /* 
        'monthGridFooter': () {
          return "";
           // return '<div class="calendar-new-schedule-button">New Schedule</div>';
        },

        'monthGridFooterExceed': (hiddenSchedules) {
            return "";//"<span class=\"badge badge-warning calendar-footer-more-schedules\">+ Voir +$hiddenSchedules éléments</span>";
        },
        'weekDayname': (dayname) {
            return '<span class="calendar-week-dayname-name">${dayname.dayName}</span><br><span class="calendar-week-dayname-date">${dayname.date}</span>';
        },
        'monthDayname': (dayname) {
            return '<span class="calendar-week-dayname-name">${dayname.label}</span>';
        },*/
        /*'timegridDisplayPrimaryTime': (time) {
            var meridiem = time.hour < 12 ? 'am' : 'pm';

            return time.hour + ' ' + meridiem;
        },
        'timegridDisplayTime': (time) {
            return "${time.hour}:${time.minutes}";
        },
        'goingDuration': (schedule) {
      return '<i class="material-icons">av_timer</i>' + schedule.goingDuration + 'min.';
        },
        'comingDuration': (schedule) {
          return '<i class="material-icons">av_timer</i>' + schedule.comingDuration + 'min.';
        },*/
        /*'goingDuration': (model) {
            var goingDuration = model.goingDuration;
            var hour = int.parse(goingDuration / SIXTY_MINUTES, 10);
            var minutes = goingDuration % SIXTY_MINUTES;

            return "GoingTime $hour:$minutes";
        },
        'comingDuration': (model) {
            var goingDuration = model.goingDuration;
            var hour = int.parse(goingDuration / SIXTY_MINUTES, 10);
            var minutes = goingDuration % SIXTY_MINUTES;

            return "ComingTime  $hour:$minutes";
        },
        'popupDetailRepeat': (model) {
            return model.recurrenceRule;
        },*/
        'popupDetailLocation': (schedule) {
          return 'Lieu : ' + schedule.location;
        },
        'popupDetailUser': (schedule) {
          return 'Coach : ' + (schedule.attendees as List<dynamic>?? []).map((f) => f.fullName).join(",");
        },
        'popupDetailState': (schedule) {
          return 'Etat : ' + schedule.state?? '?';
        },
        'popupDetailBody': (schedule) {
          return 'Description : ' + schedule.body;
        },
    
        });
}      
  String getIndexedColor(int index){
    return TuiCustomCalendar.calColors[index % TuiCustomCalendar.calColors.length];
  }
  static  List<String> calColors =[
    "#FF0000","#008000","#CC1025","#0000FF","#FFFF00","#00FFFF",
    "#FF00FF","#C0C0C0","#808080","#800000","#808000","#AA1662"
    "#800080","#008080","#000080","#FFAA10","#EE4125","#660000"];

  final Object MY_THEME =  tui.mapToJsObject({
      //common
    'common.border': '1px solid #ffbb3b',
    'common.backgroundColor': '#ffbb3b0f',
    'common.holiday.color': '#f54f3d',
    'common.saturday.color': '#3162ea',
    'common.dayname.color': '#333',
    // week header 'dayname'
    'week.dayname.height': '41px',
    'week.dayname.borderTop': '1px solid #ddd',
    'week.dayname.borderBottom': '1px solid #ddd',
    'week.dayname.borderLeft': '1px solid #ddd',
    'week.dayname.paddingLeft': '5px',
    'week.dayname.backgroundColor': 'inherit',
    'week.dayname.textAlign': 'left',
    'week.today.color': '#b857d8',
    'week.pastDay.color': '#999',

    // week vertical panel 'vpanel'
    'week.vpanelSplitter.border': '1px solid #ddd',
    'week.vpanelSplitter.height': '3px',

    // week daygrid 'daygrid'
    'week.daygrid.borderRight': '1px solid #ddd',
    'week.daygrid.backgroundColor': 'inherit',

    'week.daygridLeft.width': '77px',
    'week.daygridLeft.backgroundColor': '#a8def74d',
    'week.daygridLeft.paddingRight': '5px',
    'week.daygridLeft.borderRight': '1px solid #ddd',

    'week.today.backgroundColor': '#b857d81f',
    'week.weekend.backgroundColor': 'inherit',

    // week timegrid 'timegrid'
    'week.timegridLeft.width': '77px',
    'week.timegridLeft.backgroundColor': '#03a9f44d',
    'week.timegridLeft.borderRight': '1px solid #ddd',
    'week.timegridLeft.fontSize': '12px',
    'week.timegridLeftTimezoneLabel.height': '51px',
    'week.timegridLeftAdditionalTimezone.backgroundColor': '#fdfdfd',

    'week.timegridOneHour.height': '48px',
    'week.timegridHalfHour.height': '24px',
    'week.timegridHalfHour.borderBottom': '1px dotted #f9f9f9',
    'week.timegridHorizontalLine.borderBottom': '1px solid #eee',

    'week.timegrid.paddingRight': '10px',
    'week.timegrid.borderRight': '1px solid #ddd',
    'week.timegridSchedule.borderRadius': '0',
    'week.timegridSchedule.paddingLeft': '0',

    'week.currentTime.color': '#135de6',
    'week.currentTime.fontSize': '12px',
    'week.currentTime.fontWeight': 'bold',

    'week.pastTime.color': '#808080',
    'week.pastTime.fontWeight': 'normal',

    'week.futureTime.color': '#333',
    'week.futureTime.fontWeight': 'normal',

    'week.currentTimeLinePast.border': '1px solid rgba(19, 93, 230, 0.3)',
    'week.currentTimeLineBullet.backgroundColor': '#135de6',
    'week.currentTimeLineToday.border': '1px solid #135de6',
    'week.currentTimeLineFuture.border': '1px solid #135de6',

    // week creation guide style
    'week.creationGuide.color': '#135de6',
    'week.creationGuide.fontSize': '12px',
    'week.creationGuide.fontWeight': 'bold',

    // week daygrid schedule style
    'week.dayGridSchedule.borderRadius': '0',
    'week.dayGridSchedule.height': '18px',
    'week.dayGridSchedule.marginTop': '2px',
    'week.dayGridSchedule.marginLeft': '10px',
    'week.dayGridSchedule.marginRight': '10px',
    // month header 'dayname'
    'month.dayname.height': '32px',
    'month.dayname.borderLeft': 'none',
    'month.dayname.paddingLeft': '8px',
    'month.dayname.paddingRight': '0',
    'month.dayname.fontSize': '12px',
    'month.dayname.backgroundColor': 'inherit',
    'month.dayname.fontWeight': 'normal',
    'month.dayname.textAlign': 'left',

    // month day grid cell 'day'
    'month.holidayExceptThisMonth.color': '#f3acac',
    'month.dayExceptThisMonth.color': '#bbb',
    'month.weekend.backgroundColor': '#fafafa',
    'month.day.fontSize': '16px',

    // month schedule style
    'month.schedule.borderRadius': '4px',
    'month.schedule.height': '30px',
    'month.schedule.marginTop': '2px',
    'month.schedule.marginLeft': '5px',
    'month.schedule.marginRight': '5px',

    // month more view
    'month.moreView.boxShadow': 'none',
    'month.moreView.paddingBottom': '0',
    'month.moreView.border': '1px solid #9a935a',
    'month.moreView.backgroundColor': '#f9f3c6',
    'month.moreViewTitle.height': '28px',
    'month.moreViewTitle.marginBottom': '0',
    'month.moreViewTitle.backgroundColor': '#f4f4f4',
    'month.moreViewTitle.borderBottom': '1px solid #ddd',
    'month.moreViewTitle.padding': '0 10px',
    'month.moreViewList.padding': '10px'
  }); 
final Object THEME_DOORAY = tui.mapToJsObject({
    'common.border': '1px solid #ddd',
    'common.backgroundColor': 'white',
    'common.holiday.color': '#f54f3d',
    'common.saturday.color': '#333',
    'common.dayname.color': '#333',
    'common.today.color': '#135de6',

    // creation guide style
    'common.creationGuide.backgroundColor': 'rgba(19, 93, 230, 0.1)',
    'common.creationGuide.border': '1px solid #135de6',

    // month header 'dayname'
    'month.dayname.height': '32px',
    'month.dayname.borderLeft': 'none',
    'month.dayname.paddingLeft': '8px',
    'month.dayname.paddingRight': '0',
    'month.dayname.fontSize': '13px',
    'month.dayname.backgroundColor': 'inherit',
    'month.dayname.fontWeight': 'normal',
    'month.dayname.textAlign': 'left',

    // month day grid cell 'day'
    'month.holidayExceptThisMonth.color': '#f3acac',
    'month.dayExceptThisMonth.color': '#bbb',
    'month.weekend.backgroundColor': '#fafafa',
    'month.day.fontSize': '16px',

    // month schedule style
    'month.schedule.height': '30px',
    'month.schedule.marginTop': '2px',
    'month.schedule.marginLeft': '10px',
    'month.schedule.marginRight': '10px',

    // month more view
    'month.moreView.boxShadow': 'none',
    'month.moreView.paddingBottom': '0',
    'month.moreViewTitle.height': '28px',
    'month.moreViewTitle.marginBottom': '0',
    'month.moreViewTitle.backgroundColor': '#f4f4f4',
    'month.moreViewTitle.borderBottom': '1px solid #ddd',
    'month.moreViewTitle.padding': '0 10px',
    'month.moreViewList.padding': '10px',

    // week header 'dayname'
    'week.dayname.height': '41px',
    'week.dayname.borderTop': '1px solid #ddd',
    'week.dayname.borderBottom': '1px solid #ddd',
    'week.dayname.borderLeft': '1px solid #ddd',
    'week.dayname.paddingLeft': '5px',
    'week.dayname.backgroundColor': 'inherit',
    'week.dayname.textAlign': 'left',
    'week.today.color': '#135de6',
    'week.pastDay.color': '#999',

    // week vertical panel 'vpanel'
    'week.vpanelSplitter.border': '1px solid #ddd',
    'week.vpanelSplitter.height': '3px',

    // week daygrid 'daygrid'
    'week.daygrid.borderRight': '1px solid #ddd',

    'week.daygridLeft.width': '77px',
    'week.daygridLeft.backgroundColor': '',
    'week.daygridLeft.paddingRight': '5px',
    'week.daygridLeft.borderRight': '1px solid #ddd',

    'week.today.backgroundColor': 'inherit',
    'week.weekend.backgroundColor': 'inherit',

    // week timegrid 'timegrid'
    'week.timegridLeft.width': '77px',
    'week.timegridLeft.backgroundColor': '#fafafa',
    'week.timegridLeft.borderRight': '1px solid #ddd',
    'week.timegridLeft.fontSize': '12px',
    'week.timegridLeftTimezoneLabel.height': '51px',
    'week.timegridLeftAdditionalTimezone.backgroundColor': '#fdfdfd',

    'week.timegridOneHour.height': '48px',
    'week.timegridHalfHour.height': '24px',
    'week.timegridHalfHour.borderBottom': '1px dotted #f9f9f9',
    'week.timegridHorizontalLine.borderBottom': '1px solid #eee',

    'week.timegrid.paddingRight': '10px',
    'week.timegrid.borderRight': '1px solid #ddd',
    'week.timegridSchedule.borderRadius': '0',
    'week.timegridSchedule.paddingLeft': '0',

    'week.currentTime.color': '#135de6',
    'week.currentTime.fontSize': '12px',
    'week.currentTime.fontWeight': 'bold',

    'week.pastTime.color': '#999',
    'week.pastTime.fontWeight': 'normal',

    'week.futureTime.color': '#333',
    'week.futureTime.fontWeight': 'normal',

    'week.currentTimeLinePast.border': '1px solid rgba(19, 93, 230, 0.3)',
    'week.currentTimeLineBullet.backgroundColor': '#135de6',
    'week.currentTimeLineToday.border': '1px solid #135de6',
    'week.currentTimeLineFuture.border': '1px solid #135de6',

    // week creation guide style
    'week.creationGuide.color': '#135de6',
    'week.creationGuide.fontSize': '12px',
    'week.creationGuide.fontWeight': 'bold',

    // week daygrid schedule style
    'week.dayGridSchedule.borderRadius': '0',
    'week.dayGridSchedule.height': '18px',
    'week.dayGridSchedule.marginTop': '2px',
    'week.dayGridSchedule.marginLeft': '10px',
    'week.dayGridSchedule.marginRight': '10px'
});

 
  @override
  void dispose() {
     cal?.destroy();
  }


 
}