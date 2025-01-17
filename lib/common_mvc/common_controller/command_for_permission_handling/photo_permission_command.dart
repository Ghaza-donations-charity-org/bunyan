
import 'package:ghaza_donations_app/common_mvc/common_controller/command_for_permission_handling/permission_command_interface.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPhotosPermissionCommand implements PermissionCommand {
  @override
  Future<bool> execute() async {
    return await _requestPermission(Permission.photos);
  }

  Future<bool> _requestPermission(Permission permission) async {
    PermissionStatus status = await permission.status;

    if (status.isDenied) {
      status = await permission.request();
      if (status.isDenied) {
        // Permission denied
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
}