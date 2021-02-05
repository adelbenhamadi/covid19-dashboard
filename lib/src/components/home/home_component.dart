import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:covid19_web/app_providers.dart';

import 'package:covid19_web/src/connection/config.dart';
import 'package:covid19_web/src/domain/dataEvent/data_event_service.dart';


import 'package:covid19_web/src/routes.dart';
import 'package:covid19_web/src/shared/date_utility.dart';

import 'package:covid19_web/src/shared/toastr_service.dart';

@Component(
    selector: 'home',
    styleUrls: ['home_component.css'],
    templateUrl: 'home_component.html',
    exports: [AppRoutePaths,AppRoutes ],
    directives: [
      MaterialCheckboxComponent,
      MaterialFabComponent,
      MaterialIconComponent,
      FixedMaterialTabStripComponent,
      materialInputDirectives,
      routerDirectives,
      formDirectives,
      NgFor,
      NgIf,
      NgModel,
    ],
    providers: [
      appProviders,
     
    ])
class HomeComponent with CanReuse implements OnInit {

  final DataEventService dataEventService;
 
 
  get dataEvents => dataEventService.items;
 
  bool get loading => dataEventService.isLoading ;
 
 
  String filterKey = "";
  bool filterBool = false;
  bool showDetail =false;
  int groupsCount = 0;


  HomeComponent( this.dataEventService);

  @override
  Future<Null> ngOnInit() async {
      
    await reload(true);
   
  }
 
 
   void reload(all) async {
     
   
    
  }
  

  bool filterContains(String el1,el2) {
    // print('filter : $filterKey of $el');
   filterBool =  (filterKey.isEmpty || el1.toLowerCase().contains(filterKey.toLowerCase() ) );  
   filterBool = filterBool ||  (el2.isEmpty || el2.toLowerCase().contains(filterKey.toLowerCase() ) );   
    return filterBool;
  }

String formatDate(date){
 return DateUtility.formatDate(date);
}
}
