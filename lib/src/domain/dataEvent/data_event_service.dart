import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:angular/core.dart';

import 'package:covid19_web/src/connection/config.dart';
import 'package:covid19_web/src/connection/cookie_service.dart';
import 'package:covid19_web/src/domain/dataEvent/dataEvent.dart';

import 'package:covid19_web/src/domain/query_model.dart';

/// DATAEVENT MODEL
@Injectable()
class DataEventService extends QueryModel {
  final CookieService cookieService;

  DataEventService(this.cookieService);
/*
  Future<Map> fetchHistoryByCountry(country) async {
    final response = await http.get(
        Uri.https(
            'coronavirus-monitor.p.rapidapi.com',
            '/coronavirus/cases_by_particular_country.php',
            {'country': country}),
        // final response = await http.get(Uri.https('covid-19-coronavirus-statistics.p.rapidapi.com','/v1/stats',{'country':country}),
        headers: Config.api_covid_monitor_headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      setError('failed');
      return null;
    }
  }
*/
  Future<Map> fetchHistory(String day, String country) async {
    var q = day != null && day.isNotEmpty
        ? {'day': day, 'country': country}
        : {'country': country};
    final response = await http.get(
        Uri.https('covid-193.p.rapidapi.com', '/history', q),
        headers: Config.api_covid193_headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      setError('failed');
      return null;
    }
  }

  Future<Map> fetchStats() async {
    final response = await http.get(
        Uri.parse('https://covid-193.p.rapidapi.com/statistics'),
        headers: Config.api_covid193_headers);
    //final response = await http.get(Uri.parse('https://pomber.github.io/covid19/timeseries.json'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      setError('failed');
      return null;
    }
  }

  Future<Map> fetchCountries() async {
    final response = await http.get(
        Uri.parse('https://covid-193.p.rapidapi.com/countries'),
        headers: Config.api_covid193_headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      setError('failed');
      return null;
    }
  }

  Future<dynamic> fetchFromPath(path) async {
    final response = await HttpRequest.getString(path);
    // final response = await http.get( Uri.parse(path));
    if (response != null) {
      return jsonDecode(response);
    } else {
      setError('failed');
      return null;
    }
  }

  Future<List<DataEvent>> load() async {
    setLoading(true);
    var list = <dynamic>[];
    try {
      var data = await fetchStats();
      if (data.containsKey('response')) {
        list = data['response'].map((f) {
          var ev = DataEvent.fromJson(f)..updateFatality();
          return ev;
        }).toList();
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
      return list.cast<DataEvent>();
    }
  }

  Future<List<DataEvent>> loadHistoryByCountry(day, country) async {
    setLoading(true);
    List<dynamic> list = [];
    try {
      var data = await fetchHistory(day ?? '', country);
      var oldDay = '';
      if (data.containsKey('response')) {
        data['response'].forEach((f) {
          var ev = DataEvent.fromJson(f)..updateFatality();
          if (oldDay != f['day']) {
            list.add(ev);
          } else {
            // list.last?.update(ev);
            if (list.last.newCases == 0 && ev.newCases > 0) {
              list.last.newCases = ev.newCases;
            }
            if (list.last.newDeaths == 0 && ev.newDeaths > 0) {
              list.last.newDeaths = ev.newDeaths;
            }
          }
          oldDay = f['day'];
        });
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
      return list.cast<DataEvent>();
    }
  }
  // var data =await fetchFromPath('https://pomber.github.io/covid19/timeseries.json');

  //https://covid-api.com/api/reports/total?date=2020-05-04
  Future<Map> fetchHistory2(String day) async {
    var q = <String, String>{'date': day};
    final response = await http
        .get(Uri.https('https://covid-api.com/api/reports', '/total', q));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      setError('failed');
      return null;
    }
  }

  Future<List<DataEvent>> loadHistory2(day) async {
    setLoading(true);
    List<dynamic> list = [];
    try {
      var data = await fetchHistory2(day);
      var oldDay = '';
      if (data.containsKey('data')) {
        data['data'].forEach((f) {
          var ev = DataEvent.fromJson21(f);
        });
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
      return list.cast<DataEvent>();
    }
  }

  Future<List<DiseaseEvent>> loadDiseasesHistory() async {
    setLoading(true);
    List<dynamic> list = [];
    try {
      var data = await fetchFromPath('assets/data/diseases-comparison.json');
      if (data != null) {
        data.forEach((f) {
          var ev = DiseaseEvent.fromJson(f);
          if (ev != null) list.add(ev);
        });
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
      return list.cast<DiseaseEvent>();
    }
  }
/*
  Future<List<DataEvent>> loadHistoryByCountry2(country) async {
    setLoading(true);
    List<dynamic> list = [];
    try {
      Map data = await fetchHistoryByCountry(country);

      if (data.containsKey('stat_by_country')) {
        list = data['stat_by_country'].map((f) {
          return DataEvent.fromJson(f);
        }).toList();
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
      return list.cast<DataEvent>();
    }
  }
*/

  Future<List<String>> loadCountries() async {
    setLoading(true);
    List<dynamic> list = [];
    try {
      var data = await fetchCountries();
      if (data.containsKey('response')) {
        list = data['response'].map((f) {
          return f;
        }).toList();
      }
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
      return list;
    }
  }

  @override
  Future loadData({filterItem}) async {}
}
