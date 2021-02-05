import 'dart:async';
import 'dart:html';

import 'package:angular_components/utils/disposer/disposer.dart';
import 'package:chartjs/chartjs.dart';

class CustomChart extends Object with Disposable {
  Chart chart;
  CustomChart();

  @override
  void dispose() {
    //print("call chart dispose()");
    chart.destroy();
    dispose();
  }

  void updateXScale(scaleType) {
    chart.config.options.scales.xAxes.first.type =
        scaleType; //'logarithmic'|'linear'|'time' ..etc;
    chart.update();
  }

  void updateYScale(scaleType) {
    chart.config.options.scales.yAxes.first.type =
        scaleType; //'logarithmic'|'linear'|'time' ..etc;
    chart.update();
  }

  /* void _loadChart(labels, datasets, type, String selector) {
    var chartdata = LinearChartData(labels: labels, datasets: <ChartDataSets>[
      ChartDataSets(
        label: 'Formation',
        data: [4, 2, 4, 1, 3],
        showLine: true,
        backgroundColor: 'rgba(255,0,0,0.5)',
        borderColor: 'rgba(255,0,0,0.7)',
        pointBackgroundColor: 'rgba(70,130,180,1)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgba(70,130,180,0.8)',
        //type: 'radar',
        //cubicInterpolationMode: 'monotone',
        //fill: 'filled',
      ),
    ]);

    var config = config1(type);
    config.data = chartdata;
    createCustomChart(config, selector);
  }
*/
  void createCustomChart(config, String selector) {
    var element = querySelector(selector);
    if (element != null && element is CanvasElement) {
      if (chart != null) chart.destroy();
      chart = Chart(element, config);
    }
  }

  /*
  ChartConfiguration customConfig(type,chartOptions) {
    return ChartConfiguration(
        type: type,
        /*'line'|'bar'|'radar'|'doughnut'|'polarArea'|'bubble'|String*/
        data: null,
        options:chartOptions
    );

  }
  */
  ChartConfiguration config1(type) {
    return ChartConfiguration(
        type: type,
        /*'line'|'bar'|'radar'|'doughnut'|'polarArea'|'bubble'|String*/
        data: null,
        options: ChartOptions(
          responsive: true,
          maintainAspectRatio: false,
          legend: ChartLegendOptions(
            display: false,
            fullWidth: true,
            position: "bottom",
          ),
          elements: ChartElementsOptions(
            line: ChartLineOptions(borderWidth: 1),
          ),
          scales: ChartScales(
              type: 'time',
              display: true,
              // scaleLabel: ScaleTitleOptions(display: true),
              xAxes: [ChartXAxe(display: false)],
              yAxes: [ChartYAxe(display: false)]),
        ));
  }

  void Function(dynamic) fct = (evt) {
    print("test");
  };
  ChartConfiguration customConfig(
    type,
    ChartLegendOptions legend,
    ChartElementsOptions elements,
    ChartScales chartScales,
  ) {
    return ChartConfiguration(
        type: type,
        /*'line'|'bar'|'radar'|'doughnut'|'polarArea'|'bubble'|String*/
        data: null,
        options: ChartOptions(
          responsive: true,
          maintainAspectRatio: false,
          legend: legend,
          elements: elements,
          scales: chartScales,
          /* hover: ChartHoverOptions(
            mode: 'nearest', /*'x-axis|y-axis|label*/
            intersect: true,
            
            onHover: fct
           ),*/

          /*
              onHover: function(evt) {
                var item = myLineChart.getElementAtEvent(evt);
                if (item.length) {
                  console.log("onHover",item, evt.type);
                  console.log(">data", item[0]._index, data.datasets[0].data[item[0]._index]);
                }
              },
              onClick: function(evt) {
                var el = myLineChart.getElementAtEvent(evt);
                console.log("onClick",el,evt);
              }
            */
          tooltips: ChartTooltipOptions(
            titleFontSize: 16,
            titleFontColor: '#0066ff',
            bodyFontColor: '#fff',
            bodyFontSize: 14,
            displayColors: true,
            /* callbacks: ChartTooltipCallback(
              
              title: (tooltipItem, data) {
                  print(data['labels'][tooltipItem.first.index]);
                },
              label: (tooltipItem, data) {
                  print(data['datasets'][0]['data'][tooltipItem.index]);
                },
                S
            )*/
          ),
          /*
            tooltips: {
              callbacks: {
                title: function(tooltipItem, data) {
                  return data['labels'][tooltipItem[0]['index']];
                },
                label: function(tooltipItem, data) {
                  return data['datasets'][0]['data'][tooltipItem['index']];
                },
                afterLabel: function(tooltipItem, data) {
                  var dataset = data['datasets'][0];
                  var percent = Math.round((dataset['data'][tooltipItem['index']] / dataset["_meta"][0]['total']) * 100)
                  return '(' + percent + '%)';
                }
              },
              backgroundColor: '#FFF',
              titleFontSize: 16,
              titleFontColor: '#0066ff',
              bodyFontColor: '#000',
              bodyFontSize: 14,
              displayColors: false
            }
    */
        ));
  }
}
