import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:covid19_web/src/connection/cookie_service.dart';

import 'package:covid19_web/src/domain/dataEvent/data_event_service.dart';

import 'package:covid19_web/src/shared/encrypt_service.dart';

import 'src/connection/api.dart';

const List<dynamic> appProviders = [
  materialProviders,
  ClassProvider(Api),
  ClassProvider(CookieService),
  ClassProvider(EncryptService),
  ClassProvider(DataEventService)
];
