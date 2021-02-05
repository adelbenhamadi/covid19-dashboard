import 'dart:js';
import 'dart:js_util';

import 'package:angular_components/utils/disposer/disposer.dart';
import 'package:covid19_web/src/shared/interop/d3plus-geomap.dart' as d3plus;

class D3plusCustomGeomap extends Object with Disposable{
  d3plus.Geomap map;
 
  D3plusCustomGeomap(){
   // initializeDateFormatting('fr_FR', null).then((_){});
  }
  
  void init({topojson,selector}){ 
    map = d3plus.Geomap();
   if(topojson!=null) map.topojson(topojson);
   if(selector!=null) map.select("#$selector");
  }
  void setTopojson(topojson){
    map.topojson(topojson);
  }
  void setData(List<d3plus.DataPoint> data){
   // var tr = JsObject.jsify(data);
   var tr = data.map((d) => d.toJsObject()).toList();
   //var tr = data.map((d) => d3plus.mapToJsObject(d)).toList();
    map.data(tr);
  }
   void setColorScale(scaleColumn){
    map.colorScale(scaleColumn);
  }
  void setOcean(value){
    map.ocean(value);
  }
   void setColorScaleConfig(config){
    map.colorScaleConfig(d3plus.mapToJsObject(config));
  }
 /* void setLabel(Function f){
    map.label(f);
  }
  void config(config){
    map.config(config is Map? d3plus.mapToJsObject(config): config);
  }
  */
   void render({selector}){
     if(selector!=null) map.select("#$selector");
    map.render();
  }
  @override
  void dispose() {
    // map?.destroy();
  }


 
}