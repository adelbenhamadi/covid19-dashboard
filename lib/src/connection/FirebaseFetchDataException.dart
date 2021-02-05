class FirebaseFetchDataException implements Exception {
  String _code;
  get code => _code;
  String _message;
  get message => _message;

  FirebaseFetchDataException(this._code, this._message);

  @override
  String toString() {
    switch (_code) {
      case 'unavailable':
        return 'Unavailable database: you'
            're offline or database server is offline!';
        break;
      case 'auth/network-request-failed':
        return 'Connection problem: you' 're offline!';
        break;
      case 'auth/invalid-email':
        return 'Invalid email address';
        break;
      case 'auth/user-not-found':
        return 'This account was deleted or does not exist';
        break;
      case 'auth/invalid-password':
        return 'Invalid password';
        break;
      case 'auth/wrong-password':
        return 'Wrong password';
        break;
      case 'auth/invalid-password-hash':
        return 'Invalid password hash';
        break;
      case 'auth/insufficient-permission':
        return 'Insufficient permission';
        break;
      case 'auth/email-already-in-use':
        return 'This email address is already in use by another account!';
        break;
      case 'auth/user-disabled':
        return 'This account was disabled by an administrator';
        break;
/*
    case 'auth/account-exists-with-different-credential': return '''; break;
    case 'auth/credential-already-in-use': return '''; break;
    case 'auth/app-deleted': return '''; break;
    case 'auth/app-not-authorized': return ''; break;
    case 'auth/argument-error': return ''; break;
    case 'auth/invalid-api-key': return ''; break;
    case 'auth/invalid-user-token': return ''; break;
    case 'auth/invalid-tenant-id': return ''; break;
    case 'auth/operation-not-allowed': return ''; break;
    case 'auth/requires-recent-login': return ''; break;
    case 'auth/too-many-requests': return ''; break;
    case 'auth/unauthorized-domain': return ''; break;
    case 'auth/user-token-expired': return ''; break;
    case 'auth/web-storage-unsupported': return ''; break;
 */
      case 'auth/internal-error':
        return 'Oops! This is an internal error';
        break;

      default:
        return 'Error: ($_code) $_message';
    }
  }
}
