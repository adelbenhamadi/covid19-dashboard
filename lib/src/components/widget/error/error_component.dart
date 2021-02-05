import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:covid19_web/src/connection/FirebaseFetchDataException.dart';



@Component(
  selector: 'error',
  styleUrls: ['error_component.css'],
  templateUrl: 'error_component.html',
  directives: [
  
    materialInputDirectives,
    NgFor,
    NgIf,
   
  ],
 
  providers: [],
)
class ErrorComponent {
  @Input() dynamic error;
  @Input() String sinceMessage= "il y a 1 seconde";
  @Input() String title = "";
  @Input() bool canClose = true;
  String get errorMessage => (error is FirebaseFetchDataException)?
   error.toReadableString : error.toString();


}
