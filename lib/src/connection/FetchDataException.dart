class FetchDataException implements Exception {
  // ignore: prefer_final_fields
  String _message;
  get message => _message;
  int _code;
  get code => _code;

  FetchDataException(this._code, this._message);

  @override
  String toString() {
    switch (_code) {
      case 7:
        return 'Erreur (17) No associated address';
        break;
      case 111:
        return 'Erreur (1111) Connection refused';
        break;
      case 404:
        return 'Erreur (1404) Page not found';
        break;
      case 405:
        return 'Erreur (1405) Unauthorized method';
        break;
      case 406:
        return 'Erreur (1406) Rejected request';
        break;
      case 444:
        return 'Erreur (1444) No response';
        break;
      case 401:
        return 'Erreur (1401) Authentication error';
        break;
      case 403:
        return 'Erreur (1403) Request rejected by Remote Server';
        break;
      case 504:
        return 'Erreur (1504) Server timeout';
        break;
      case 500:
        return 'Erreur (1500) Server internal error';
        break;
      case 503:
        return 'Erreur (1503) No service';
        break;

      default:
        return 'Erreur (${_code}) ${_message}';
    }
  }
}
