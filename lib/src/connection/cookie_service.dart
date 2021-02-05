import 'package:angular/di.dart';
import 'package:biscuits/biscuits.dart';
import 'package:covid19_web/src/connection/config.dart';

@Injectable()
class CookieService {
  final Cookies cookies;

  CookieService()
      : cookies = Cookies(
            defaults: CookieOptions(
                domain: Config.host,
                expires: DateTime.now().add(Duration(days: 7)),
                path: '/',
                secure: Config.host != '127.0.0.1'));
}
