import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final LocalAuthentication _auth = LocalAuthentication();
  // bool _canCheckBiomatric = false;
  // String _authorized = "Not Aothorize";

  static Future<bool> authenticate() async {
    bool isAvailable = await _auth.canCheckBiometrics;
    List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();
    try {
      if (isAvailable == true) {
        if (availableBiometrics.contains(BiometricType.fingerprint)) {
          bool authenticated = await _auth.authenticateWithBiometrics(
            localizedReason: "Scan Figerprint",
            useErrorDialogs: true,
            stickyAuth: true,
          );
          return authenticated;
        }
      }
    } on PlatformException catch (e) {
      return false;
    }
  }
}
