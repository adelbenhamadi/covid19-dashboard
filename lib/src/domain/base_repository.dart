import 'package:covid19_web/src/connection/api.dart';
import 'package:covid19_web/src/domain/base_entity.dart';

class BaseRepository<T extends BaseEntity> {
  final Api api;
  String _path;

  BaseRepository(api) : this.api = api {
    init();
  }

  void init() {}
  void setPath(p) {
    _path = p;
  }

  String get path => _path;
}
