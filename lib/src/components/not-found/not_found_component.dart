import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';

import 'package:covid19_web/src/routes.dart';



@Component(
  selector: 'not-found',
  templateUrl: 'not_found_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    FixedMaterialTabStripComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
   coreDirectives, routerDirectives,
  ],

  providers: [
  
  ],
  exports: [AppRoutePaths,AppRoutes ],
)
class NotFoundComponent implements OnActivate {
 
  NotFoundComponent();
  
  @override
  void onActivate(_, RouterState current) async {   
    
  }

 
}
