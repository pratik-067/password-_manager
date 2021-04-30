import 'package:encrypt/encrypt.dart';

class MyEncryption {
  static final key = Key.fromLength(32);
  static final iv = IV.fromLength(8);
  static final encrypter = Encrypter(AES(key));

  static encrpte(String plainText) {
    return encrypter.encrypt(plainText, iv: iv);
  }

  static decrypte(Encrypted chiperText) {
    return encrypter.decrypt(chiperText, iv: iv);
  }
}
