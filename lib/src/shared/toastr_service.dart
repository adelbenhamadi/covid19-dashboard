
import 'package:covid19_web/src/shared/interop/toastr.dart';

String  getPosition(ToastPos pos){
  switch (pos) {
    case ToastPos.topLeft: return 'toast-top-left';break;
    case ToastPos.topRight: return 'toast-top-right';  break;
    case ToastPos.bottomLeft: return 'toast-bottom-left';break;
    case ToastPos.bottomRight: return 'toast-bottom-right';break;
    case ToastPos.topCenter: return 'toast-top-center';break;
    case ToastPos.bottomCenter: return 'toast-bottom-center';break;
      
    default: return 'toast-top-center';
  }
} 
class ToastrService{

static remove(){ toastr.remove();}
static clear(){ toastr.clear();}

static success({String title = "", String message, ToastPos position = ToastPos.topCenter, Duration duration = const Duration(seconds: 1),
bool progressBar = false,bool closeButton = false,bool preventDuplicates= false}){  
  toastr.success(
        message,
        title,
        mapToJsObject({
          'timeOut': duration.inMilliseconds,
          'positionClass': getPosition(position),
          "progressBar" : progressBar,
          "closeButton":closeButton,
        }));   
}
static info({String title = "", String message, ToastPos position = ToastPos.topCenter, Duration duration = const Duration(seconds: 1),
bool progressBar = false,bool closeButton = false,bool preventDuplicates= false}){  
  toastr.info(
        message,
        title,
        mapToJsObject({
          'timeOut': duration.inMilliseconds,
          'positionClass': getPosition(position),
        }));   
}

static error({String title = "", String message, ToastPos position = ToastPos.topCenter, Duration duration = const Duration(seconds: 1),
bool progressBar = false,bool closeButton = false,bool preventDuplicates= false}){  
  toastr.error(
        message,
        title,
        mapToJsObject({
          'timeOut': duration.inMilliseconds,
          'positionClass': getPosition(position),
        }));   
}
static warning({String title = "", String message, ToastPos position = ToastPos.topCenter, Duration duration = const Duration(seconds: 1),
bool progressBar = false,bool closeButton = false,bool preventDuplicates= false}){  
  toastr.warning(
        message,
        title,
        mapToJsObject({
          'timeOut': duration.inMilliseconds,
          'positionClass': getPosition(position),
        }));   
}
}
enum MessageType {
  plain,
  success,
  error,
  warning,
  info
}

enum ToastPos {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  topCenter,
  bottomCenter
}