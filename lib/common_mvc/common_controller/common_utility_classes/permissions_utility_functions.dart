import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PermissionsUtilityFunctions {
  static Future<bool> requestPermission(Permission permission) async {
    PermissionStatus status = await permission.status;

    if (status.isDenied) {
      status = await permission.request();
      if (status.isDenied) {
        // Permission denied, handle accordingly
        debugPrint("Permission denied: $permission");
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied, navigate to app settings
      await openAppSettings();
      return false;
    }

    // Permission granted
    return status.isGranted;
  }

  static Future<bool> checkPermission(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  static Future<bool> requestStoragePermission() async {
    bool storageGranted = await requestPermission(Permission.storage);
    return storageGranted;
  }

  static Future<bool> requestPhotosAccessPermission() async {
    bool photosGranted = await requestPermission(Permission.photos);
    return photosGranted;
  }

  static Future<bool> requestVideosAccessPermission() async {
    bool videosGranted = await requestPermission(Permission.videos);
    return videosGranted;
  }

  static Future<bool> requestCameraPermission() async {
    return await requestPermission(Permission.camera);
  }

  //some packages require android 13 or above to work properly
  //this function checks if the device is running android 13 or above
  static Future<bool> _isAndroid13OrAbove() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.version.sdkInt >= 33;
  }
}
