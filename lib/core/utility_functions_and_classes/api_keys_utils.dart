import 'package:flutter/foundation.dart';

import '../app_constants/api_keys.dart';

class APIKeysUtilityFunctions {
  static String getSecuredGoogleMapsAPIKeyForAndroidDevices() {
    return securedGoogleMapsAPIKeyForAndroidDevices;
  }

  static String getSecuredGoogleMapsAPIKeyForIOSDevices() {
    return securedGoogleMapsAPIKeyForIOSDevices;
  }

  static String getSecuredGoogleMapsAPIKeyForWeb() {
    return securedGoogleMapsAPIKeyForWeb;
  }

  static String getUnsecuredGoogleMapsAPIKey() {
    return unsecuredGoogleMapsAPIKey;
  }

  static String getSecuredGoogleMapsAPIKeyForCurrentPlatform() {
    if (kIsWeb) {
      return getSecuredGoogleMapsAPIKeyForWeb();
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return getSecuredGoogleMapsAPIKeyForAndroidDevices();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return getSecuredGoogleMapsAPIKeyForIOSDevices();
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
