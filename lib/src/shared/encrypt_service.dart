import 'dart:convert';
import 'dart:math';

import 'package:angular/di.dart';
import 'package:encrypt/encrypt.dart';

@Injectable()
class EncryptService{

  final iv ;
  final encrypter ;
  EncryptService():
  iv = IV.fromLength(16),
  encrypter = Encrypter(AES( Key.fromLength(32)));
  String encryptBase64(so){
   return encrypter.encrypt(so, iv: iv).base64;
  }
   String encryptBase16(so){
   return encrypter.encrypt(so, iv: iv).base16;
  }
   String decryptBase64(so){
   return encrypter.decrypt(Encrypted.fromBase64(so), iv: iv);
  }
  String decryptBase16(so){
   return encrypter.decrypt(Encrypted.fromBase16(so), iv: iv);
  }
 
}
class CryptoService {
    static final Random _random = Random.secure();

    static String CreateCryptoRandomString([int length = 32]) {
        var values = List<int>.generate(length, (i) => _random.nextInt(256));

        return base64Url.encode(values);
    }
}