@JS()
library d3plus_geomap_interop;

import 'package:js/js.dart' ;
import 'package:js/js_util.dart';

class DataPoint {
  final id;
  final String name;
  final String pic;
  final num deaths;
  final num total;
  final num active;
  final num recovered;
  final num tests;
  final num critical;
  
  toJsObject(){
    var jsObject = newObject();
    setProperty(jsObject, "id", id);
    setProperty(jsObject, "name", name);
    setProperty(jsObject, "pic", pic);
    setProperty(jsObject, "deaths", deaths);
    setProperty(jsObject, "total", total);
    setProperty(jsObject, "active", active);
    setProperty(jsObject, "recovered", recovered);
    setProperty(jsObject, "tests", tests);
    setProperty(jsObject, "critical", critical);
    return jsObject;
  }


  DataPoint(this.id, this.name,this.pic,this.total,this.active,this.deaths,this.recovered,this.tests,this.critical);
}
typedef Func0<R> = R Function();
typedef Func1<A, R> = R Function(A a);
typedef Func2<A,B, R> = R Function(A a,B b);

@JS('d3plus.Geomap')
class Geomap {
 
  external  factory Geomap();
  //external Function(dynamic event) get on;
 // external config(dynamic v);
 external config(GeomapConfiguration v);
  external select(String selector);
  external colorScale(String value);
  external ocean(String value);
  external projection(String value);
  external data(List<dynamic> data);
  external topojson(String data,[Func1<dynamic,String> formatter]);
  external colorScaleConfig(dynamic value);
  external render([Func1<dynamic,String> callback]);
  //external dynamic /*String|Func1<dynamic, dynamic>*/ get label;
 // external set label(dynamic/*String|Func1<dynamic, dynamic>*/ v) ;

  external label(Func2<dynamic,dynamic,String> callback) ;
  external tooltipConfig(ToolTipConfigOption config) ;

 // external tooltipConfig(ToolTipConfigOption config) ;
 // external tooltipConfig({ Func1<dynamic,String> body}) ;


}

@anonymous 
@JS()
abstract class GeomapConfiguration{
  external String get data;
  external set data(String v);
  
  external String get select;
  external set select(String v);
  
  external String get ocean;
  external set ocean(String v);

   external set groupBy(String /*'column'|String*/ v)   ;
  external String /*'column'|String*/ get groupBy;

   external set colorScale(String /*'column'|String*/ v)   ;
  external String /*'column'|String*/ get colorScale;

  external String /*'geoEqualEarth'|String*/ get projection;
  external set projection(
      String /*'geoEqualEarth'|String*/ v); 

  external String /*'transparent'|'red'|'#ffae33'|String*/ get background;
  external set background(String /*'transparent'|'red'|'#ffae33'|String*/ v)   ;

  external String /*'transparent'|'red'|'#ffae33'|String*/ get topojsonFill;
  external set topojsonFill(String /*'transparent'|'red'|'#ffae33'|String*/ v)   ;

  external bool /*true|false|bool*/ get zoom;
  external set zoom(bool /*true|false|bool*/ v)   ;
  
  external dynamic /*String|Func1<dynamic, dynamic>*/ get label;
  external set label(dynamic/*String|Func1<dynamic, dynamic>*/ v) ;
 // external String label(dynamic d);

  external ToolTipConfigOption get tooltipConfig;
  external set tooltipConfig(ToolTipConfigOption config) ;

  external dynamic /*String|Func1<dynamic, dynamic>*/ get point;
  external set point(dynamic/*String|Func1<dynamic, dynamic>*/ v) ;

  external fitObject(FitObjectOption o) ;
 

 external  factory GeomapConfiguration({
   String data,
   String select,
   String ocean,
   String groupBy,
   String colorScale,
   String projection,
   String background,
   String topojsonFill,
   bool zoom,
   dynamic /*String|Func1<dynamic, dynamic>*/ label,
  // String label(dynamic d),
   ToolTipConfigOption tooltipConfig,
   dynamic point,
   FitObjectOption fitObject
 });

}

@anonymous 
@JS()
abstract class FitObjectOption{
   external String /*'Topology'|String*/ get type;
  external set type(String /*'Topology'|String*/ v);
 external FitObject get objects;
 external set objects(FitObject v);
}
@anonymous 
@JS()
abstract class FitObject{
 external FitObjectBound get cutomBounds;
 external set customBounds(FitObjectBound v);
}
@anonymous 
@JS()
abstract class FitObjectBound{
  external String /*'GeometryCollection'|String*/ get type;
  external set type(String /*'GeometryCollection'|String*/ v);

}
@anonymous 
@JS()
abstract class FitObjectBoundGeometry{
  external String /*'MultiPoint'|String*/ get type;
  external set type(String /*'MultiPoint'|String*/ v);

}

@anonymous 
@JS()
abstract class ToolTipConfigOption{
 external Func2<dynamic,dynamic,String> /*String|Func1<dynamic,String>*/ get body;
 external set body( Func2<dynamic,dynamic,String> /*String|Func1<dynamic,String>*/ value);
 //external body(Func2<dynamic,dynamic,String> callback) ;
 external  factory ToolTipConfigOption({Func2<dynamic,dynamic,String> /*String|Func1<dynamic,dynamic,String>*/ body});

}
/*

          "type": "Topology",
          "objects": d3plus.mapToJsObject({
            "custom-bounds": d3plus.mapToJsObject({
              "type": "GeometryCollection",
              "geometries": [
                {
                  "type": "MultiPoint",
                  "coordinates": [
                    [-160, 70],
                    [170, -55]
                  ]
                }
              ]
              */
/*

 var config ={
        data: "https://d3plus.org/data/city_coords.json",
        groupBy: "slug",
        colorScale: "population",
        colorScaleConfig :{
            scale: "jenks",//Choropleth with Jenks Breaks
            color: ["yellow", "orange" ,"red", "purple"],
            axisConfig: {
                tickFormat: function(d) {
                return Math.floor(d/85000000) + "%";
                }
            },
            },
        fitObject: {
            "type": "Topology",
            "objects": {
            "custom-bounds": {
                "type": "GeometryCollection",
                "geometries":[
                {
                    "type":"MultiPoint",
                    "coordinates": [[-160, 70], [170, -55]]
                }
                ]
            }
            }
        },
        label: function(d) {
        return d.id + ": " + d.population;
        },
        
       // point: function(d) { return [d.longitude, d.latitude]; },
       
        tooltipConfig:{
            body: function(d) {
            return "Pops: " + (d.population > 100000000 ? "HIGH" : "LOW");
        }
        },
         //remove some region to let zoom fit the rest: like antartica and haiti
        fitFilter: function(d) {
            return ["ATA", "TWN"].indexOf(d.id) < 0;
            },
        zoom: true
    } ;  

        */

Object mapToJsObject(Map<String, dynamic> dartMap) {
  var jsObject = newObject();

  dartMap.forEach((name, value) {
    setProperty(jsObject, name, value);
  });

  return jsObject;
}

 /*
    var popData = [{id: "01", population: 4830620}, {id: "02", population: 733375}];
    var chart = new d3plus.Geomap()
      .select("#mamp")
      .data(popData)
      .colorScale("population");

    chart
      .topojson("https://d3plus.org/topojson/states.json")
      .fitFilter(function(d) {
        return ["02", "15", "43", "60", "66", "69", "72", "78"].indexOf(d.id) < 0;
      });  

    chart.render();  
  */