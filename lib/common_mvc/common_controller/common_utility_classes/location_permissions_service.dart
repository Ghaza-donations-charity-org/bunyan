import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Requests location permission when the app is in use.
  static Future<bool> requestLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.locationWhenInUse.request();
      return result.isGranted;
    }
  }

  /// Requests background location permission.
  static Future<bool> requestBackgroundLocationPermission() async {
    var status = await Permission.locationAlways.status;
    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.locationAlways.request();
      return result.isGranted;
    }
  }

  /// Checks if location permission is granted.
  static Future<bool> isLocationPermissionGranted() async {
    return await Permission.locationWhenInUse.isGranted;
  }

  /// Checks if background location permission is granted.
  static Future<bool> isBackgroundLocationPermissionGranted() async {
    return await Permission.locationAlways.isGranted;
  }
}
