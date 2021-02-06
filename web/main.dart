import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:covid19_web/src/connection/config.dart';
import 'package:covid19_web/src/shared/encrypt_service.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:covid19_web/app_component.template.dart' as ng;
import 'main.template.dart' as self;

@GenerateInjector(
    /*routerProviders,*/ routerProvidersHash)
final InjectorFactory injector = self.injector$Injector;
void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
