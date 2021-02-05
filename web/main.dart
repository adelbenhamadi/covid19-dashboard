import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:covid19_web/src/connection/config.dart';
import 'package:covid19_web/src/shared/encrypt_service.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:covid19_web/app_component.template.dart' as ng;
import 'main.template.dart' as self;

@GenerateInjector(
  /*routerProviders,*/ routerProvidersHash
)
final InjectorFactory injector = self.injector$Injector;
void main() {
  //Config.appID = CryptoService.CreateCryptoRandomString();
  try{
   fb.initializeApp(
      apiKey: "AIzaSyCVYLDGWsyUu1mf7_LpLq1R8T99qIrlF8M",
      authDomain: "covid-19-933a7.firebaseapp.com",//covid-19-933a7.web.app
      //databaseURL: "https://covid-19-933a7.firebaseio.com",
      projectId: "covid-19-933a7",
      //storageBucket: "covid-19-933a7.appspot.com",
      appId: "1:1089294773268:web:c9f775e70209ed4c560b01",
     
    );
    //print("fb.initializeApp called!");
  } on fb.FirebaseJsNotLoadedException catch (e) {
    print(e);
  }finally{
    runApp(ng.AppComponentNgFactory, createInjector: injector);
  }
  
}
