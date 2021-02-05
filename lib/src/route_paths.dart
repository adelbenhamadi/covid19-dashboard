import 'package:angular_router/angular_router.dart';

const idParam = 'id';

String getRouteId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id;
}

class AppRoutePaths {
  //static final home = RoutePath(path: '/'  ,useAsDefault: true);

  static final dashboard = RoutePath(path: 'dashboard', useAsDefault: true);
}
