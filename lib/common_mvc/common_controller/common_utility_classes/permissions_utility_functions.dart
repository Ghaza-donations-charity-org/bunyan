import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsUtilityFunctions {
  //ToDo: Consider applying command design pattern
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


}
