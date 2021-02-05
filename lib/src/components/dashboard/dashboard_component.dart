import 'dart:async';
import 'dart:html';
import 'dart:math' as math;
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:covid19_web/app_providers.dart';
import 'package:covid19_web/src/components/choromap/choromap_component.dart';
import 'package:covid19_web/src/components/widget/error/error_component.dart';
import 'package:covid19_web/src/domain/dataEvent/dataEvent.dart';
import 'package:covid19_web/src/domain/dataEvent/data_event_service.dart';

import 'package:covid19_web/src/shared/custom_chart.dart';
import 'package:covid19_web/src/shared/date_utility.dart';
import 'package:chartjs/chartjs.dart';
import 'package:covid19_web/src/connection/config.dart';

import 'package:covid19_web/src/routes.dart';
import 'package:intl/intl.dart';

@Component(
  selector: 'dashboard',
  styleUrls: ['dashboard_component.css'],
  templateUrl: 'dashboard_component.html',
  exports: [AppRoutePaths, AppRoutes],
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    FixedMaterialTabStripComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    routerDirectives,
    formDirectives,
    ChoromapComponent,
    ErrorComponent,
  ],
  providers: [
    appProviders,
  ],
)
class DashboardComponent with CanReuse implements OnInit {
 
  final DataEventService dataEventService;
 
  final nbfInteger = NumberFormat("#,##0", "en_US");
  final nbfdouble2d = NumberFormat("#,##0.00", "en_US");
  final nbfdouble3d = NumberFormat("#,##0.000", "en_US");

  bool loading = false;
  bool get hasError => dataEventService.hasError;
  //filter and sort
  String filterKey = "";
  bool filterBool = false;
  List<String> sortFields = [
    'Total',
    'Active cases',
    'New cases',
    'Deaths',
    'New deaths',
    'Critical',
    'Recovered',
    'Fatalaity'
  ];
  int sortflag = 0;
  bool sortUp = true;
  String sortArrow = "arrow_upward";
  String get topLabel =>
      "Top 30 Territories classed " + (sortUp ? 'descendantly' : 'ascendantly') + " by \"${sortFields[sortflag]}\" " ;

  var lastUpdate;
  Country selectedCountry ;
  String selectedRegion = "";
  int dashboard = 0;
  List<DataEvent> events = [], todayEvents = [], chartEvents,allHistoryEvents=[],historyEvents = [];
  List<String> countryLabels =[];
  List<DiseaseEvent> diseasesEvents = [];
 
  int totCases = 0,
      totRecovered = 0,
      totActive = 0,
      totDeaths = 0,
      countriesCount = 0;

   int yesterdayCases = 0,
      yesterdayRecovered = 0,
      yesterdayActive = 0,
      yesterdayDeaths = 0;
  double yesterdayPercentCases = 0.0,
      yesterdayPercentRecovered = 0.0,
      yesterdayPercentActive = 0.0,
      yesterdayPercentDeaths = 0.0;
  int historyCases = 0,
      historyRecovered = 0,
      historyActive = 0,
      historyDeaths = 0;
  String historyStartDay = '---', historyEndDay = '---';
  DashboardComponent(this.dataEventService );

  //charts
  String countryCasesChartType = "horizontalBar", historyChartType = "line";
  CustomChart countryCasesChart,
      historyChart,
      countryNewCasesChart,
      countryNewDeathsChart,
      countryActiveChart,
      countryDeathsChart,
      countryRecoveredChart,
      countryFatalityChart,
      countryTestsChart,
      countryCriticalChart,
      diseasesChart,
      diseasesComparisonChart;

  @override
  Future<Null> ngOnInit() async {
     await loadYesterdayData();
    onSelectCountry(null);
  }

  void trySort(toSort, f) {
    try {
      toSort.sort(f);
    } catch (e) {}
    ;
  }

  void reload(all) async {
    if (all) {
      await load();
    }
  }
 void loadYesterdayData()async{
  
    try {
      var yesterday = Date.today().add(days:-1).format(DateFormat("yyyy-MM-dd"));
      var yesterdayEvents = await dataEventService.loadHistoryByCountry(yesterday,"all");

      var lastEv = yesterdayEvents.first;
     
      yesterdayActive = lastEv.active;
      yesterdayDeaths = lastEv.deaths;
      yesterdayRecovered = lastEv.recovered;
      yesterdayCases = lastEv.total; 

     

    } catch (e) {
      print(e);
    } finally {
    }
 }
  void load() async {
    loading = true;

    try {
      // var curmonth = DateTime.now().month;
      todayEvents = await dataEventService.load();
      if (todayEvents.isNotEmpty) {
        
      DataEvent evAll = todayEvents.firstWhere(
            (e) =>e.country!=null && e.country.name == 'All',
            orElse: () => null);
        totActive = evAll.active;
        totDeaths = evAll.deaths;
        totRecovered = evAll.recovered;
        totCases = totActive + totDeaths + totRecovered;
        lastUpdate = evAll.date;

        todayEvents.retainWhere((t){
          //if(t.country==null)  print('country null: ${t.countryName}');
          return t.country!=null && t.country.code.isNotEmpty; 
          });
          countriesCount = todayEvents.length;
         yesterdayPercentCases =  ((totCases - yesterdayCases)/totCases*100).toDouble();
         yesterdayPercentActive =  ((totActive - yesterdayActive)/totActive*100).toDouble();
         yesterdayPercentDeaths =  ((totDeaths - yesterdayDeaths)/totDeaths*100).toDouble();
         yesterdayPercentRecovered =  ((totRecovered - yesterdayRecovered)/totRecovered*100).toDouble();
       
      }
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  void loadHistoryByCountry(country) async {
    //events = [];
    loading = true;

    try {
      // var curmonth = DateTime.now().month;
      historyEvents = await dataEventService.loadHistoryByCountry('',country);

      var lastEv = historyEvents.first;
      historyStartDay = historyEvents.last.day;
      historyEndDay = lastEv.day;
      historyActive = lastEv.active;
      historyDeaths = lastEv.deaths;
      historyRecovered = lastEv.recovered;
      historyCases = lastEv.total; //totActive + totDeaths + totRecovered;

    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  void loadDiseasesHistory() async {
    loading = true;

    try {
      diseasesEvents = await dataEventService.loadDiseasesHistory();
      diseasesEvents.forEach((f){
        if(f.name.contains('covid')){
         f.totaldeaths = totDeaths;
         f.extra = "Covid-19, dec 2019 , now";
        }
         
      }); 
      diseasesEvents.sort((b,a) => a.totaldeaths.compareTo(b.totaldeaths));
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  void sort(sort, {bool reset = false}) {
    if (sort == sortflag && !reset) {
      sortUp = !sortUp;
    } else {
      sortUp = true;
    }
    //sortUp = sort!= sortflag;
    if (sortUp) {
      sortArrow = "arrow_downward";
    } else {
      sortArrow = "arrow_upward";
    }
    sortflag = sort;
    int ss = sortUp ? 1 : -1;

    switch (sortflag) {
      case 0:
        events.sort((b, a) {
          return a.total.compareTo(b.total) * ss;
        });
        break; //sort by total
      case 1:
        events.sort((b, a) {
          return a.active.compareTo(b.active) * ss;
        });
        break; //sort by active
      case 2:
        events.sort((b, a) {
          return a.newCases.compareTo(b.newCases) * ss;
        });
        break; //sort by newCases
      case 3:
        events.sort((b, a) {
          return a.deaths.compareTo(b.deaths) * ss;
        });
        break; //sort by deaths
      case 4:
        events.sort((b, a) {
          return a.newDeaths.compareTo(b.newDeaths) * ss;
        });
        break; //sort by newDeaths
      case 5:
        events.sort((b, a) {
          return a.critical.compareTo(b.critical) * ss;
        });
        break; //sort by critical
      case 6:
        events.sort((b, a) {
          return a.recovered.compareTo(b.recovered) * ss;
        });
        break; //sort by recovered
      case 7:
        events.sort((b, a) {
          return a.fatality.compareTo(b.fatality) * ss;
        });
        break; //sort by fatality

      case 9:
        events.sort((b, a) {
          return a.tests.compareTo(b.tests) * ss;
        });
        break; //sort by tests

        break;
      default:
    }
    if(dashboard==1) loadAnalytic();
  }
  
 
  void loadCountryCasesChart(labels,data) {
    var selector = "#countryCasesChart1";
    if (countryCasesChart == null) countryCasesChart = CustomChart();
    var chartdata = LinearChartData(
        labels: labels,
        datasets: <ChartDataSets>[
          /* ChartDataSets(
            label: 'Active cases',
            data: data.map((ev) => ev.active).toList(),
            showLine: true,
            fill: false,
            backgroundColor: backgroundStateColors[0],
            borderColor: borderStateColors[0],
            hoverBackgroundColor: borderStateColors[0],
            borderWidth: 2,
          ),*/
          ChartDataSets(
            label: 'Deaths',
            data: data.map((ev) => ev.deaths).toList(),
            showLine: true,
            type:
                countryCasesChartType == 'bar' ? 'line' : countryCasesChartType,
            backgroundColor: backgroundStateColors[2],
            borderColor: borderStateColors[2],
            hoverBackgroundColor: borderStateColors[2],
            borderWidth: 2,
          ),
          ChartDataSets(
            label: 'Recovered',
            data: data.map((ev) => ev.recovered).toList(),
            showLine: true,
            fill: false,
            backgroundColor: backgroundStateColors[1],
            borderColor: borderStateColors[1],
            hoverBackgroundColor: borderStateColors[1],
            borderWidth: 2,
          ),
        ]);
    var stacked = countryCasesChartType == 'bar' ||
        countryCasesChartType == "horizontalBar";
    var config = countryCasesChart.customConfig(
      countryCasesChartType,
      ChartLegendOptions(
        display: countryCasesChartType != "doughnut" &&
            countryCasesChartType != "polarArea",
        fullWidth: true,
        position: "bottom",
      ),
      ChartElementsOptions(
        line: ChartLineOptions(borderWidth: 2),
      ),
      ChartScales(
          type: 'logarithmic',
          /*'category'|'linear'|'logarithmic'|'time'|'radialLinear'|String*/
          display: true,
          scaleLabel: ScaleTitleOptions(display: false, fontSize: 8),
          xAxes: [
            ChartXAxe(
                display: countryCasesChartType != 'radar', stacked: stacked)
          ],
          yAxes: [
            ChartYAxe(
              display: countryCasesChartType != 'radar',
              stacked:
                  stacked, /*scaleLabel: ScaleTitleOptions(display:false,labelString: "Tâches")*/
            )
          ]),
    );
    config.data = chartdata;

    countryCasesChart.createCustomChart(config, selector);
  }

  void loadCountryNewCasesChart(labels,data) {
    var lab = "New cases";
    var sel = "#countryNewCasesChart1";
    if (selectedCountry==null) {
      loadTop30Chart(
          countryNewCasesChart,
          lab,
          labels,
          data.map((ev) => ev.newCases).toList(),
          0,
          "horizontalBar",
          "linear",
          sel);
    } else {
      loadTop30Chart(
          countryNewCasesChart,
          lab,
          data.map((ev) => ev.day).toList(),
          data.map((ev) => ev.newCases).toList(),
          0,
          "line",
          "logarithmic",
          sel);
    }
  }

  void loadCountryNewDeathsChart(labels,data) {
    var lab = "New deaths";
    var sel = "#countryNewDeathsChart1";
    if (selectedCountry==null) {
      /*
       var tmp = events.map((ev) => MapEntry(ev.country,ev.newDeaths)).toList()
     ..sort((b,a) => a.value.compareTo(b.value));*/

      loadTop30Chart(
          countryNewDeathsChart,
          lab,
          labels,
          data.map((ev) => ev.newDeaths).toList(),
          2,
          "horizontalBar",
          "linear",
          sel);
    } else {
      loadTop30Chart(
          countryNewDeathsChart,
          lab,
          data.map((ev) => ev.day).toList(),
          data.map((ev) => ev.newDeaths).toList(),
          2,
          "line",
          "logarithmic",
          sel);
    }
  }

  void loadCountryActiveChart(labels,data) {
    var lab = "Active cases";
    var sel = "#countryActiveChart1";
    if (selectedCountry==null) {
      /*   var tmp = events.map((ev) => MapEntry(ev.country,ev.active)).toList()
     ..sort((b,a) => a.value.compareTo(b.value));
*/
      loadTop30Chart(
          countryActiveChart,
          lab,
          labels,
          data.map((ev) => ev.active).toList(),
          0,
          "horizontalBar",
          "linear",
          sel);
    } else {
      loadTop30Chart(countryActiveChart, lab, data.map((ev) => ev.day).toList(),
          data.map((ev) => ev.active).toList(), 0, "line", "logarithmic", sel);
    }
  }

  void loadCountryDeathsChart(labels,data) {
    var lab = "Deaths";
    var sel = "#countryDeathsChart1";
    if (selectedCountry==null) {
      loadTop30Chart(
          countryDeathsChart,
          lab,
          labels,
          data.map((ev) => ev.deaths).toList().sublist(1, 30),
          2,
          "horizontalBar",
          "linear",
          sel);
    } else {
      var rev = events.reversed;
      loadTop30Chart(countryDeathsChart, lab, rev.map((ev) => ev.day).toList(),
          rev.map((ev) => ev.deaths).toList(), 2, "line", "logarithmic", sel);
    }
  }

  void loadCountryFatalityChart(labels,data) {
    var lab = "Fatality rate (%)";
    var sel = "#countryFatalityChart1";
    if (selectedCountry==null) {
      /* var tmp = events.map((ev) => MapEntry(ev.country,ev.fatality)).toList()
     ..sort((b,a) => a.value.compareTo(b.value));*/
      loadTop30Chart(
          countryFatalityChart,
          lab,
          labels,
          data.map((ev) => ev.fatality).toList(),
          2,
          "horizontalBar",
          "linear",
          sel);
    } else {
      loadTop30Chart(
          countryFatalityChart,
          lab,
          data.map((ev) => ev.day).toList(),
          data.map((ev) => ev.fatality).toList(),
          2,
          "line",
          "linear",
          sel);
    }
  }

  void loadCountryCriticalChart(labels,data) {
    var lab = "Critical cases";
    var sel = "#countryCriticalChart1";
    if (selectedCountry==null) {
      /* var tmp = events.map((ev) => MapEntry(ev.country,ev.fatality)).toList()
     ..sort((b,a) => a.value.compareTo(b.value));*/
      loadTop30Chart(
          countryCriticalChart,
          lab,
         labels,
          data.map((ev) => ev.critical).toList(),
          2,
          "horizontalBar",
          "linear",
          sel);
    } else {
      loadTop30Chart(
          countryFatalityChart,
          lab,
          data.map((ev) => ev.day).toList(),
          data.map((ev) => ev.critical).toList(),
          2,
          "line",
          "linear",
          sel);
    }
  }

  void loadCountryTestsChart(labels,data) {
    var lab = "Tests";
    var sel = "#countryTestsChart1";
    if (selectedCountry==null) {
      /* var tmp = events.map((ev) => MapEntry(ev.country,ev.fatality)).toList()
     ..sort((b,a) => a.value.compareTo(b.value));*/
      loadTop30Chart(
          countryTestsChart,
          lab,
          labels,
          data.map((ev) => ev.tests).toList(),
          3,
          "horizontalBar",
          "linear",
          sel);
    } else {
      var rev = events.reversed;
      loadTop30Chart(countryTestsChart, lab, rev.map((ev) => ev.day).toList(),
          rev.map((ev) => ev.tests).toList(), 3, "line", "linear", sel);
    }
  }

  void loadDiseasesChart(){
    var lab = "Death toll";
    var sel = "#diseasesChart1";
      loadTop30Chart(
          diseasesChart,
          lab,
          diseasesEvents.map((ev) => "${ev.name} [${ev.extra}]").toList(),
          diseasesEvents.map((ev) => ev.totaldeaths).toList(),
          -1,
          "horizontalBar",
          "linear",
          sel);
    
  }

  void loadDiseasesComparisonChart(chartType, scaleType,yScaleType) {
    if ( diseasesEvents.isNotEmpty) {
      var selector = "#diseasesComparisonChart1";
      if (diseasesComparisonChart == null){
        diseasesComparisonChart = CustomChart();
      }
      var labels = diseasesEvents.first.days.keys.toList();
     
      int i = -1;
    
      var chartdata = LinearChartData(
          labels: labels,
          datasets: diseasesEvents.map((ev) {
            i++;
            return ChartDataSets(
              label: "${ev.name} [${ev.extra}]",
              data: ev.days.values.toList(),
               showLine: true,
              fill: false,
             
              backgroundColor: chartColors[i],
              borderColor: chartColors[i],
              hoverBackgroundColor: chartColors[i],
              borderWidth: 1,
              pointRadius: 0,
            );
          }).toList());

      var config = diseasesComparisonChart.customConfig(
        chartType,
        ChartLegendOptions(
          display: true,
          fullWidth: false,
          position: "bottom",
        ),
        ChartElementsOptions(
          line: ChartLineOptions(borderWidth: 1,),
          point: ChartPointOptions(radius: 0,hitRadius: 1)
        ),
        ChartScales(
            type: scaleType,
            /*'category'|'linear'|'logarithmic'|'time'|'radialLinear'|String*/
            display: true,
            scaleLabel: ScaleTitleOptions(display: false, fontSize: 8),
            xAxes: [
              ChartXAxe(
                display: chartType != 'radar', 
                stacked: false,
                time: TimeScale(type: "linear",parser: "parser test")),
            ],
            yAxes: [
              ChartYAxe(
                display: chartType != 'radar',
                type: yScaleType,
                stacked: false,
                scaleLabel: ScaleTitleOptions(display: true,labelString: "Deaths"),
               
              
        )]),
      );
      config.data = chartdata;

      diseasesComparisonChart.createCustomChart(config, selector);
    }
  }

  void loadCountryRecoveredChart() {
    var lab = "Recovered";
    var sel = "#countryRecoveredChart1";
    if (selectedCountry==null) {
      loadTop30Chart(
          countryRecoveredChart,
          lab,
          events.map((ev) => ev.country).toList().sublist(1, 30),
          events.map((ev) => ev.recovered).toList().sublist(1, 30),
          1,
          "line",
          "linear",
          sel);
    } else {
      var rev = events.reversed;
      loadTop30Chart(
          countryRecoveredChart,
          lab,
          rev.map((ev) => ev.day).toList(),
          rev.map((ev) => ev.recovered).toList(),
          1,
          "line",
          "linear",
          sel);
    }
  }

  void loadHistoryChart() {
    var selector = "#historyChart1";
    if (historyChart == null) historyChart = CustomChart();
    var rev = events.reversed;
    var chartdata = LinearChartData(
        labels: rev.map((ev) => ev.day).toList(),
        datasets: <ChartDataSets>[
          /* ChartDataSets(
            label: 'Active cases',
            data: rev.map((ev) => ev.active).toList(),
            showLine: true,
            fill: false,
            backgroundColor: backgroundStateColors[0],
            borderColor: borderStateColors[0],
            hoverBackgroundColor: borderStateColors[0],
            borderWidth: 2,
          ),*/
          ChartDataSets(
            label: 'Deaths',
            data: rev.map((ev) => ev.deaths).toList(),
            showLine: true,
            fill: false,
            type: historyChartType == 'bar' ? 'line' : historyChartType,
            backgroundColor: backgroundStateColors[2],
            borderColor: borderStateColors[2],
            hoverBackgroundColor: borderStateColors[2],
            borderWidth: 2,
          ),
          ChartDataSets(
            label: 'Recovered',
            data: rev.map((ev) => ev.recovered).toList(),
            showLine: true,
            fill: false,
            backgroundColor: backgroundStateColors[1],
            borderColor: borderStateColors[1],
            hoverBackgroundColor: borderStateColors[1],
            borderWidth: 2,
          ),
        ]);
    var stacked =
        historyChartType == 'bar' || historyChartType == "horizontalBar";
    var config = historyChart.customConfig(
      historyChartType,
      ChartLegendOptions(
        display:
            historyChartType != "doughnut" && historyChartType != "polarArea",
        fullWidth: true,
        position: "bottom",
      ),
      ChartElementsOptions(
        line: ChartLineOptions(borderWidth: 2),
      ),
      ChartScales(
          type: 'time',
          /*'category'|'linear'|'logarithmic'|'time'|'radialLinear'|String*/
          display: true,
          scaleLabel: ScaleTitleOptions(display: false, fontSize: 8),
          xAxes: [
            ChartXAxe(
              display: historyChartType != 'radar',
              stacked: stacked,
              time: TimeScale(
                  unit: 'day',
                  unitStepSize: 1,
                  displayFormats: TimeDisplayFormat(
                    millisecond: 'MMM DD',
                    second: 'MMM DD',
                    minute: 'MMM DD',
                    hour: 'MMM DD',
                    day: 'MMM DD',
                    week: 'MMM DD',
                  )),
            )
          ],
          yAxes: [
            ChartYAxe(
              display: historyChartType != 'radar',
              stacked:
                  stacked, /*scaleLabel: ScaleTitleOptions(display:false,labelString: "Tâches")*/
            )
          ]),
    );
    config.data = chartdata;

    historyChart.createCustomChart(config, selector);
  }

  void loadOverview() {
    dashboard = 0;
    loadChoromap();
  }

  void loadAnalytic() {
    dashboard = 1;
    if (selectedCountry==null) {
   
      chartEvents = events.sublist(0,30);
      countryLabels = chartEvents.map((ev) => ev.country.name).toList();
      loadCountryCasesChart(countryLabels,chartEvents);
      loadCountryActiveChart(countryLabels,chartEvents);
      loadCountryNewCasesChart(countryLabels,chartEvents);
      loadCountryNewDeathsChart(countryLabels,chartEvents);
      loadCountryFatalityChart(countryLabels,chartEvents);
      loadCountryCriticalChart(countryLabels,chartEvents);
      loadCountryTestsChart(countryLabels,chartEvents);
    
    } else {
      loadHistoryChart();
      chartEvents = events.reversed.toList();
      //countryLabels = chartEvents.map((ev) => ev.country.name).toList();
      loadCountryActiveChart(null,chartEvents);
      loadCountryNewCasesChart(null,chartEvents);
      loadCountryNewDeathsChart(null,chartEvents);
      loadCountryFatalityChart(null,chartEvents);
      loadCountryCriticalChart(null,chartEvents);
    }
  }
  
  void loadPandemic() async{
    dashboard = 2;
    if(diseasesEvents.isEmpty) await  loadDiseasesHistory();
     loadDiseasesChart();
     loadDiseasesComparisonChart('line', 'time','linear');
    
  }
  void loadChoromap(){}
  void loadTop30Chart(CustomChart chart1, label1, labels, data, colorIdx, type,
      scaleType, selector) {
    if (chart1 != null) chart1.dispose();
    chart1 = CustomChart();
    var chartdata = LinearChartData(labels: labels, datasets: <ChartDataSets>[
      ChartDataSets(
        label: label1,
        data: data,
        showLine: true,
        fill: false,
        backgroundColor: colorIdx>=0? backgroundStateColors[colorIdx]: chartColors,
        borderColor:colorIdx>=0? borderStateColors[colorIdx]: chartColors,
        hoverBackgroundColor:colorIdx>=0? borderStateColors[colorIdx]: chartColors,
        borderWidth: 2,
      ),
    ]);

    var stacked = type == 'bar' || type == "horizontalBar";
    var config = chart1.customConfig(
      type,
      ChartLegendOptions(
        display: type != "doughnut" && type != "polarArea" && colorIdx!=-1,
        fullWidth: true,
        position: "bottom",
      ),
      ChartElementsOptions(
        line: ChartLineOptions(borderWidth: 2),
      ),
      ChartScales(
          type: scaleType,
          /*'category'|'linear'|'logarithmic'|'time'|'radialLinear'|String*/
          display: true,
          scaleLabel: ScaleTitleOptions(display: false, fontSize: 8),
          xAxes: [
            ChartXAxe(display: type != 'radar', stacked: stacked)
          ],
          yAxes: [
            ChartYAxe(
              display: type != 'radar',
              // type: scaleType,

              stacked:
                  stacked, /*scaleLabel: ScaleTitleOptions(display:false,labelString: "Tâches")*/
            )
          ]),
    );
    config.data = chartdata;

    chart1.createCustomChart(config, selector);
  }
 
 void onSelectRegion(region){
   if(selectedCountry!=null) return;
   selectedRegion = region;
   if(selectedRegion.isEmpty){
     events = todayEvents;
   }else{
     events = [];
     todayEvents.forEach((f){if(f.country?.region == selectedRegion) events.add(f);});
   }
   if(dashboard==1) loadAnalytic();
 }
  void onSelectCountry(country) async {
    selectedCountry = country;
    if (selectedCountry==null) {
      if (todayEvents.isEmpty) {
        await load();
        events = todayEvents;
        //sort by active
        sort(0, reset: true);
      } else {
        events = todayEvents;
        if (dashboard == 1) loadAnalytic();
      }
    } else {
      await loadHistoryByCountry(selectedCountry.name);
      events = historyEvents;
      //sort by total
      sort(0, reset: true);
    }
    
  }

  void onChartTypeChange(Event ev) {
    var target = ev.target;
    if (target is SelectElement) {
      if (selectedCountry==null) {
        countryCasesChartType = target.value;
        loadCountryCasesChart(countryLabels,chartEvents);
      } else {
        historyChartType = target.value;
        loadHistoryChart();
      }
    }
  }

  List<String> chartColors = [
    '#F7464A',
    '#46BFBD',
    '#FDB45C',
    '#949FB1',
    '#4D5360',
    "#FF0000",
   
    "#CC1025",
    "#0000FF",
    "#FFFF00",
    "#00FFFF",
    "#FF00FF",
    "#AA1662",
    "#800080",
    "#008080",
    "#000080",
    "#FFAA10",
    "#EE4125",
    "#660000",
    "#C0C0C0",
   
    
  ];

  var backgroundStateColors = [
    'rgba(255, 206, 86, 0.3)', //yellow
    'rgba(102, 204, 0, 0.3)', //green
    'rgba(255, 99, 132, 0.3)', //red
    'rgba(112, 112, 112, 0.3)', //gray
  ];
  var borderStateColors = [
    'rgba(255, 206, 86, 1)',
    'rgba(102, 204, 0, 1)',
    'rgba(255, 99, 132, 1)',
    'rgba(112, 112, 112, 1)', //gray
  ];
  String getIndexedColor(int index, String alpha) {
    return chartColors[index % chartColors.length] + alpha;
  }

  String formatNum(numb) {
    if (numb is int) return nbfInteger.format(numb);
    if (numb is double) return nbfdouble3d.format(numb);
    return "";
  }

  String formatDate(date) {
    if (date is DateTime) return DateUtility.formatDatetime(date);
    return DateUtility.formatDate(date);
  }

  bool filterContains(String el1) {
    if(el1==null || el1.isEmpty) return false;
    filterBool = (el1.toLowerCase().contains(filterKey.toLowerCase()));
    return filterBool;
  }

 bool filterContains2(String el1,el2) {
   filterBool =  (filterKey.isEmpty || el1.toLowerCase().contains(filterKey.toLowerCase() ) );  
   filterBool = filterBool ||  (el2.isEmpty || el2.toLowerCase().contains(filterKey.toLowerCase() ) );   
    return filterBool;
  }
  void exportToCsv() {}
}
