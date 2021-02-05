import 'dart:html';
import 'dart:js';
import 'dart:js_util';
import 'dart:math';
import 'package:angular_forms/angular_forms.dart';
import 'package:covid19_web/src/connection/config.dart';
import 'package:covid19_web/src/domain/dataEvent/data_event_service.dart';
import 'package:covid19_web/src/shared/date_utility.dart';
import 'package:covid19_web/src/shared/interop/d3plus-geomap.dart' as d3plus;
import 'package:js/js.dart';

import 'package:angular/angular.dart';
import 'package:covid19_web/src/domain/dataEvent/dataEvent.dart';
import 'package:covid19_web/src/shared/d3plus_custom_geomap.dart';


@Component(
    selector: 'choromap',
    styleUrls: ['choromap_component.css'],
    templateUrl: 'choromap_component.html',
    providers: [D3plusCustomGeomap],
    directives: [ formDirectives, NgFor, NgIf,])
class ChoromapComponent implements OnInit , AfterViewInit {
  final D3plusCustomGeomap geomap;
  final DataEventService eventService;
  @Input()
  List<DataEvent> eventData;
  @Input()
  String column;
  @Input()
  String container;
  int viewMapIdx = 0;
  dynamic sliderValue = 30;
  String sliderStartDay,sliderEndDay;
  DateTime selectedDate;
  String get selectDateString => DateUtility.formatDatetime(selectedDate,format:"MMM dd, yyyy");
  ChoromapComponent(this.geomap,this.eventService);

  @override
  void ngOnInit() {
    sliderStartDay = "Dec 31, 2019";
    sliderEndDay = "Today";
    selectedDate = DateTime.now();
  }
  @override
  void ngAfterViewInit() async{
   await initChoroplethMap();
    //querySelectorAll('input[name=options]').onClick.listen(update);
  }

  void initChoroplethMap() async{
    if (geomap != null) {
      geomap.init(
          topojson: "assets/js/topojson/world/countries.json",
          selector: container);
    
      geomap.map.label( allowInterop( (d,i) { 
            String s ="<div class=\"text-center\">";
            if(hasProperty(d, 'pic')){ s = "<img width=\"32\" alt=\"\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb" + getProperty(d, 'pic') + "\">";
            }
            if(hasProperty(d, 'name')){ s = s + "<span class=\"ml-1\">" + getProperty(d, 'name') + "</span>"; 
            }
            if(hasProperty(d, 'total')){ s = s + "<br><ul class=\"list-unstyled\">" + 
                  "<li>Total cases: " + getProperty(d, 'total').toString();
             }
             if(hasProperty(d, 'active')){ s = s +
                  "</li><li class=\"text-warning\">Active cases: " + getProperty(d, 'active').toString();
              }
             if(hasProperty(d, 'deaths')){ s = s  +
                  "</li><li class=\"text-danger\">Deaths: " + getProperty(d, 'deaths').toString();
              }
             if(hasProperty(d, 'critical')){ s = s +
                  "</li><li class=\"text-warning\">Critical cases: " + getProperty(d, 'critical').toString();
              }
             if(hasProperty(d, 'recovered')){ s = s  +
                  "</li><li class=\"text-success\">Recovered: " + getProperty(d, 'recovered').toString();
              }
             if(hasProperty(d, 'active')){ s = s   +
                  "</li><li class=\"text-primary\">Tests: " +  getProperty(d, 'tests').toString()  ;
            }
            if(hasProperty(d, 'total')){ s = s + "</li></ul>";
            }
            return s  + "</div>";
          }));
     
      geomap.map.config(d3plus.GeomapConfiguration(
          projection: "geoEqualEarth",
          ocean: 'transparent',
          topojsonFill: 'white',
          zoom: true,
      ));
      await updateData();
      update(0);
    } else {
      print("ChoroplethMap is null!");
    }
  }

  void updateView(idx) {
   // if(viewMapIdx==idx) return;

  if( <int>[0,1,2,4].contains(idx) ){
     geomap.setColorScaleConfig({
          "color": ["#FFFFE0" , "yellow","#f1f356", "orange", "#DC143C", "#B22222" , "#A52A2A"," #9932CC","#8B008B","#4B0082","black"  ],
          "scale" : "jenks"
        });
  }
    viewMapIdx = idx;
    switch (viewMapIdx) {
      case 0:
        geomap.setColorScale("total");
       
        break;
      case 1:
        geomap.setColorScale("active");
       
        break;
      case 2:
        geomap.setColorScale("deaths");
       
        break;
      case 3:
        geomap.setColorScale("recovered");
        geomap.setColorScaleConfig({
          "color": ["#ADFF2F","#32CD32",  "#006400"]
        });
        break;
      case 4:
        geomap.setColorScale("critical");
       
        break;
      case 5:
        geomap.setColorScale("tests");
        geomap.setColorScaleConfig({
          "color": ["#cfefed", "blue", "#0f13a5"]
        });
        break;
      default:
    }
  }

  void updateData() async{
    if (geomap == null) return;
  //  eventData = await eventService.loadHistoryByCountry(DateUtility.formatDatetime(selectedDate,format: "yyyy-MM-dd"), "All");
    List<d3plus.DataPoint> points = [];
    eventData.forEach((ev) {
      if (ev.country == null || ev.country.code.isEmpty || ev.country.img.isEmpty) {
        /*  points.add({
          "id": countryCode,
          "name" : country['name'],
          "img_url" : country['img'],
          "total": 0,
          "active": 0,
          "deaths": 0,
          "recovered": 0,
          "tests": 0,
          "critical": 0,
        });*/
        //print('country not found: ${ev.country.name},alpha3: ${ev.country.code} ');
      } else {
        points.add(d3plus.DataPoint(ev.country.code, ev.country.name, ev.country.img, 
         ev.total.toDouble(), 
         ev.active.toDouble(),
         ev.deaths.toDouble(), 
         ev.recovered.toDouble(), 
         ev.tests.toDouble(), 
         ev.critical.toDouble()));

      }
    });
    geomap.setData(points);
  }

  void update(idx) {
    if (geomap != null){
    updateView(idx);
    geomap.render();
    }else{
      print("geomap is null");
    } 
   
  }

void onSliderChange(event)async{
  print(event.toString());
   var target = event.target;
    if (target is InputElement && target.type== "range") {
     int val =30 - int.tryParse(target.value);
    // print("val: $val");
    selectedDate = DateTime.now().subtract(Duration(days: val));
    await updateData();
    geomap.render();
    }
}
/*
  static const List<String> COLORS = ['#E3F2FD', '#BBDEFB', '#90CAF9', '#64B5F6', '#42A5F5', '#2196F3', '#1E88E5', '#1976D2', '#1565C0', '#0D47A1'];
  static const List<String> RED_COLORS = ['#ffecec','#ffeaea','#ffd5d5','#ffc0c0','#ffacac','#ff9797','#ff8282','#ff6e6e','#ff5959','#ff4444','#ff3030'];

  */

 
}
