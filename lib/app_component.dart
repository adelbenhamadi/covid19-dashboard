import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:covid19_web/src/components/dashboard/dashboard_component.dart';
import 'package:covid19_web/src/components/home/home_component.dart';
import 'package:covid19_web/src/components/widget/footer/footer_component.dart';
import 'package:covid19_web/src/domain/dataEvent/data_event_service.dart';

import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/model/menu/menu.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:covid19_web/app_providers.dart';

import 'package:covid19_web/src/connection/cookie_service.dart';

import 'package:covid19_web/src/routes.dart';
import 'package:angular_router/angular_router.dart';
import 'package:covid19_web/src/shared/encrypt_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    materialInputDirectives, MaterialButtonComponent, MaterialMenuComponent,
    DropdownMenuComponent,
    formDirectives,
    NgIf, NgFor,

    //components
    HomeComponent,
    DashboardComponent,
    FooterComponent,
  ],
  providers: [
    appProviders,
  ],
  exports: [
    AppRoutePaths,
    AppRoutes,
  ],
)
class AppComponent implements OnInit {
  final CookieService cookieService;

  final DataEventService projectService;
  final EncryptService encryptService;
  final Router _router;

  AppComponent(this.projectService, this.cookieService, this.encryptService,
      this._router);

  bool loading = false;

  RouterState currentState;
  MenuModel<MenuItem> menuModel;

  @override
  void ngOnInit() async {}
}
