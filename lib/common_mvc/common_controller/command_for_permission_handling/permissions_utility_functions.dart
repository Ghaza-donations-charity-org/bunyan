
import 'permission_command_interface.dart';

class PermissionsUtilityFunctions {
  static Future<bool> requestPermission(PermissionCommand command) async {
    return await command.execute();
  }
}

