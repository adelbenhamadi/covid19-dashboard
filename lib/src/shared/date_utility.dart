import 'package:angular_components/angular_components.dart';
import 'package:intl/intl.dart';

class DateUtility{
  static Date minDate = Date(2015);
  static Date maxDate = Date(2049);

 static DateFormat defaultDateFormat() => DateFormat("dd/MM/yyyyy"); 
 static  gmtOffset(offset) => Duration(hours:offset) ;
 static String formatDatetime(date,{String format='dd/MM/yyyy HH:mm:ss'}) {
      var dateFormat =  DateFormat(format);
      if(date==null) return "Wrong date!";
      if(date is Date) return date.format(dateFormat);
      if(date is DateTime) return dateFormat.format(date);
      return "!";
    } 
 static String formatDate(date,{String format='dd/MM/yyyy'}) {
      var dateFormat =  DateFormat(format);
      if(date==null) return "Wrong date!";
      if(date is Date) return date.format(dateFormat);
      if(date is DateTime) return dateFormat.format(date);
      return "!";
    }    
 static String formatTimestamp(timestamp,{String format='dd/MM/yyyy HH:mm:ss'}) {
      var dateFormat =  DateFormat(format);
      var date = timestampToDateTime(timestamp);
      if(date==null) return "Wrong date!";
      return dateFormat.format(date);
    }
static DateTime timestampToDateTime( timestamp) {
      var date = timestamp is int? DateTime.fromMillisecondsSinceEpoch(timestamp * 1000):null;
      return date;
    }
static Date timestampToDate( timestamp) {
      var date = timestamp is int? Date.fromTimestamp(timestamp * 1000) :null;
      return date;
    }    
static DateTime dateTimeFromFirestore(val){
  if(val is DateTime) return val;
  if(val is int) return timestampToDateTime(val);
  if(val is String){
   return DateTime.tryParse(val);
  }
  return null;
}    
static Date dateFromFirestore(val){
  if(val is Date) return val;
  if(val is DateTime) return Date.fromTime(val,tzOffset: gmtOffset(1));
  if(val is int) return timestampToDate(val);
  return tryParse(val);
} 
static Date tryParse(val,{bool strict = false}){
  Date d;
if(val is String){
   try{d = Date.parse(val, DateFormat("dd/MM/yyyyy"));}catch(e){};
   try{d = Date.parse(val, DateFormat("dd-MM-yyyyy"));}catch(e){};
   try{d = Date.parse(val, DateFormat("yyyy-MM-dd"));}catch(e){};
   try{d = Date.parse(val, DateFormat("yyyy/MM/dd"));}catch(e){};
  }
  if(!strict || (d.isAfter(DateUtility.minDate) && d.isBefore(DateUtility.maxDate)))  return d;
  return null;
}
static String parseDatefromFirestore(val){
 if(val is int) return DateUtility.formatTimestamp(val,format:"dd/MM/yyyy");
 if(val is Date) return val.format(DateFormat("dd/MM/yyyyy"));
 if(val is String) return val;
 return "";
}
static String parseDate(val){
 if(val is int) return DateUtility.formatTimestamp(val,format:"dd/MM/yyyy");
 if(val is Date) return val.format(DateFormat("dd/MM/yyyyy"));
 if(val is String) return DateUtility.parseDate( DateUtility.tryParse(val));
 return "";
}
/*static DateTime convert(timestamp){
  return timestamp is int? DateTime.parse(timestamp.toDate().toString()): null;
} */ 
static Duration calcDuration(a,b){
     if(a==null || b==null) return Duration.zero;
     if(a is Date && b is Date) return b.asUtcTime().difference(a.asUtcTime());
     if(a is DateTime && b is DateTime) return b.difference(a);
     if(a is Date && b is DateTime) return b.difference(a.asUtcTime());
     if(a is DateTime && b is Date) return b.asUtcTime().difference(a);

     return  Duration.zero;
   } 
 static bool sameDay(a,b) {
   return a.difference(b) == Duration(days: 0);
 } 
 static bool isToday(DateTime a) {
   return a.difference(DateTime.now()) == Duration(days: 0);
 }   
}
 