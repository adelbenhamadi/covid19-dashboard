import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:covid19_web/src/connection/config.dart';
import 'package:covid19_web/src/shared/toastr_service.dart';



@Component(
  selector: 'footer',
  styleUrls: ['footer_component.css'],
  templateUrl: 'footer_component.html',
  directives: [
  
    materialInputDirectives,
    NgFor,
    NgIf,
   
  ],
 
  providers: [],
)
class FooterComponent implements OnInit {
 
 int get loadedItems => Config.fetchCount;

 

  @override
  Future<Null> ngOnInit() async {
    
  }
  void testClick(){
      ToastrService.success(
          message: "TEST CLICK!", preventDuplicates: true);
  }

}
