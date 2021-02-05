import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:covid19_web/app_providers.dart';

import 'package:covid19_web/src/components/widget/error/error_component.dart';

import 'package:covid19_web/src/connection/config.dart';



import 'package:covid19_web/src/domain/dataEvent/dataEvent.dart';
import 'package:covid19_web/src/domain/dataEvent/data_event_service.dart';

import 'package:covid19_web/src/route_paths.dart';
import 'package:covid19_web/src/shared/date_utility.dart';

import 'package:intl/intl.dart';

@Component(
  selector: 'data-event-view',
  styleUrls: ['data_event_view_component.css'],
  templateUrl: 'data_event_view_component.html',
  // changeDetection: ChangeDetectionStrategy.Default,
  directives: [
     materialInputDirectives, coreDirectives, formDirectives,routerDirectives,
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    MaterialDatepickerComponent,DateRangeInputComponent,

    MaterialDropdownSelectComponent,
    MaterialSelectSearchboxComponent,
    DropdownSelectValueAccessor,
    MultiDropdownSelectValueAccessor,
    MaterialSelectDropdownItemComponent,
   
    NgFor,
    NgIf,Date,ErrorComponent
  ],
  pipes:[DatePipe],
  providers: [appProviders,datepickerBindings,
 
  ],
)
class DataEventViewComponent implements OnActivate {

  final DataEventService dataEventService;
  
 
  DataEvent model,_back;


  bool get loading => dataEventService.isLoading;
 
  bool editing = false;
  bool updating = false;
  var editModule ;
  bool get hasError => dataEventService.hasError;
  DateFormat get ddMMy => DateUtility.defaultDateFormat();
  
  DataEventViewComponent(this.dataEventService);
  
 
  @override
  void onActivate(_, RouterState current) async {   
    final id = getRouteId(current.parameters);
    await load(id); 
  }

 void load(id)async{
   /* if (id != null) model = await dataEventService.load(id);  
    if(model!=null ){  
       reload(model);  
    } */
 } 
  void reload(p){
   
  }
 void preEdit()async{
   // _back =  DataEvent.fromMap(model.toMap(),model.id);
     editing = true;
    
  }
 void onCancel(){
   editing=false;
    model= _back;
 }
 Future<bool> update(data)async{  
  /*
    var res= await  dataEventService.update(model);      
      if(res){
        ToastrService.success(message:"Action updated successfully!",preventDuplicates: true);
       
      }else{
        //error
      }  
    return res;
    */
 }
 void onUpdate(NgForm form)async{  
   if(form.valid){
        updating = true;
       bool res = await update(form.value);
       editing=!res;
       updating = false;      
    }  
 }

void onCancelEdit(){
  editModule=null;
}


}



