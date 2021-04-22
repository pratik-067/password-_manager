import 'dart:math';

class PasswordGenrator {
  String capLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String smallLetter = "abcdefghijklmnopqrstuvwxyz";
  String number = "123456789";
  String specialChar = "!\$@#&?<>{}[]()+|_-";
  // Future<String> newPwd;
  String pwd = " ";
  String genrate(int length) {
    for (var i = 0; i < length; i++) {
      var randNo = new Random();
      pwd += capLetter.split('')[randNo.nextInt(capLetter.length)];
      pwd += smallLetter.split('')[randNo.nextInt(smallLetter.length)];
      pwd += number.split('')[randNo.nextInt(number.length)];
      pwd += specialChar.split('')[randNo.nextInt(specialChar.length)];
    }

    return pwd;
  }
}
