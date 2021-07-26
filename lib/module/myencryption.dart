import 'package:encrypt/encrypt.dart';

class MyEncryption {
  static final key = Key.fromLength(32);
  static final iv = IV.fromLength(8);
  static final encrypter = Encrypter(AES(key));

  static encrpteASE(String plainText) {
    var chiper = encrypter.encrypt(plainText, iv: iv).base64;

    return chiper;
  }

  static decrypteASE(Encrypted chiperText) {
    return encrypter.decrypt(chiperText, iv: iv);
  }
}
