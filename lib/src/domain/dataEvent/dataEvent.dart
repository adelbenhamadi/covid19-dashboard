import 'package:covid19_web/src/connection/config.dart';
import 'package:covid19_web/src/domain/base_entity.dart';
import 'package:covid19_web/src/shared/date_utility.dart';

int parseMap(val) {
  if (val is int) return val;
  if (val is String) return int.tryParse(val);
  return 0;
}

class Country {
  String code;
  String name;
  String url;
  String img;
  String region;

  Country(this.code, this.name);

  Country.fromMap(Map<String, dynamic> map)
      : code = map['alpha3'],
        url = map['url'],
        img = map['img'],
        region = map['region'],
        name = map['name'].replaceAll(" ", "-");
}

class DiseaseEvent {
  String name;
  var extra;
  var link;
  var startDay;
  var totaldeaths;
  Map days;

  DiseaseEvent(this.name, this.extra, this.link, this.startDay,
      this.totaldeaths, this.days);

  DiseaseEvent.fromJson(Map<String, dynamic> map)
      : name = map['NAME'],
        extra = map['Extra'],
        link = map['LINK'],
        startDay = map['START_DAY'],
        totaldeaths = map['TOTAL DEATHS'],
        days = map['DAYS'];
}

class DataEvent extends BaseEntity {
  var date;
  String day;
  String countryName;
  Country country;

  int newCases;
  int newDeaths;
  int total;

  int active;
  int critical;
  int deaths;
  int recovered;
  int tests;
  int casesPer1m;
  double fatality;
  DataEvent(
    this.date,
    this.country,
    this.newCases,
    this.newDeaths,
  );

  DataEvent.fromMap(Map<String, dynamic> map)
      : date = DateUtility.dateTimeFromFirestore(map['date']),
        country = map['country'] != null
            ? Country.fromMap(
                map['country'],
              )
            : null;

  DataEvent.fromJson(Map<String, dynamic> map)
      : date = DateUtility.dateTimeFromFirestore(map['time']),
        day = map['day'],
        countryName = map['country'],
        country = Config.COUNTRIES.firstWhere(
            (c) => c.name == map['country'] || c.code == map['country'],
            orElse: () => null),
        total = parseMap(map['cases']['total']),
        critical = parseMap(map['cases']['critical']),
        active = parseMap(map['cases']['active']),
        newCases = parseMap(map['cases']['new']),
        recovered = parseMap(map['cases']['recovered']),
        newDeaths = parseMap(map['deaths']['new']),
        deaths = parseMap(map['deaths']['total']),
        tests = parseMap(map['tests']['total']);

  DataEvent.fromJson21(Map<String, dynamic> map)
      : date = DateUtility.dateTimeFromFirestore(map['date']),
        day = map['date'],
        country = Config.COUNTRIES.firstWhere(
            (c) => c.name == map['country'] || c.code == map['country'],
            orElse: () => null),
        total = parseMap(map['cases']['total']),
        critical = parseMap(map['cases']['critical']),
        active = parseMap(map['cases']['active']),
        newCases = parseMap(map['cases']['new']),
        recovered = parseMap(map['cases']['recovered']),
        newDeaths = parseMap(map['deaths']['new']),
        deaths = parseMap(map['deaths']['total']),
        tests = parseMap(map['tests']['total']);
  void update(DataEvent ev) {
    if (day != ev.day) return;
    total = ev.total;
    critical = ev.critical;
    active = ev.active;
    newCases = ev.newCases;
    newDeaths = ev.newDeaths;
    deaths = ev.deaths;
    recovered = ev.recovered;
    tests = ev.tests;
    updateFatality();
  }

  void updateFatality() {
    fatality = total > 0 ? deaths / total * 100 : null;
  }

  DataEvent.fromJson2(Map<String, dynamic> map)
      : date = DateUtility.dateTimeFromFirestore(map['record_date']),
        country = map['country_name'] ?? 'unknown',
        total = parseMap(map['total_cases']),
        critical = parseMap(map['serious_critical']),
        active = parseMap(map['active_cases']),
        newCases = parseMap(map['new_cases']),
        newDeaths = parseMap(map['new_deaths']),
        deaths = parseMap(map['total_deaths']),
        tests = null,
        casesPer1m = parseMap(map['total_cases_per1m']),
        recovered = parseMap(map['total_recovered']);
  DataEvent.fromJson22(Map<String, dynamic> map, co)
      : date = DateUtility.dateTimeFromFirestore(map['date']),
        country = co,
        active = map['active'],
        deaths = map['deaths'],
        recovered = map['recovered'];
}
