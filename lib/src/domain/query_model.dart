import 'package:covid19_web/src/connection/FirebaseFetchDataException.dart';
import 'package:firebase/firestore.dart';

enum ModelLoadMode {
  umLoadActifs,
  umLoadSupervisors,
  umLoadOnlyCurrentProject,
  umLaodAll
}

/// QUERY MODEL
/// General model used to help retrieve, parse & storage
/// information from a public API
abstract class QueryModel {
  List _items = List();
  bool _loading = false;
  var _lastError;
  var _page = 0;
  var limit = 10;
  var hasMorePages = true;
  var totalResults;
  var newItems = [];

  DocumentSnapshot lastdoc;
  // General getters
  List get items => _items;

  dynamic getItem(index) => _items[index];
  int get getItemCount => _items.length;
  bool get isLoading => _loading;
  String get lastError => _lastError.toString();
  bool get hasError => _lastError != null && _lastError.toString().isNotEmpty;
  int get getPage => _page;

  void setPage(int p) {
    this._page = p;
  }

  void clearItems() => _items.clear();

  QueryModel();

  // Reloads the info loading data once again
  Future refresh() async {
    //print("refresh ...");
    setPage(0);
    await loadData();
  }

  // To-be-implemented method, which loads the model's data
  Future loadData({
    filterItem,
  });

  void init() {
    items.clear();
    newItems.clear();
    lastdoc = null;
    setPage(0);
    _lastError = null;
  }

  // Updated the 'loading' state
  void setLoading(bool state) {
    _loading = state;
    if (_loading) setError(null);
    //if(_lastError!=null) print('error: ' + _lastError.toString() +' , loading: $state');
  }

  void setError(err) {
    print("error: ${err.toString()}");
    var code, message;
    try {
      code = err?.code;
      message = err?.message;
    } catch (e) {
      code = null;
    }
    if (code != null) {
      _lastError =
          FirebaseFetchDataException(code, message ?? "No error message");
      // print("error code: ${err?.code}");
    } else {
      _lastError = err;
    }
  }
}
