import 'package:angular_router/angular_router.dart';

import 'components/home/home_component.template.dart' as home_template;
import 'components/dashboard/dashboard_component.template.dart'
    as dashboard_template;
import 'components/not-found/not_found_component.template.dart'
    as not_found_template;

import 'route_paths.dart';

export 'route_paths.dart';

class SharedRoutes {
  static final RouteDefinition notFoundRoute = RouteDefinition(
    path: '.+',
    component: not_found_template.NotFoundComponentNgFactory,
  );
}

class AppRoutes {
  static final dashboard = RouteDefinition(
    routePath: AppRoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final all = <RouteDefinition>[dashboard, SharedRoutes.notFoundRoute];
}
