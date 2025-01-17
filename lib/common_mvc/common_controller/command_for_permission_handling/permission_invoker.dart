import 'package:ghaza_donations_app/common_mvc/common_controller/command_for_permission_handling/permission_command_interface.dart';

class PermissionInvoker {
  final List<PermissionCommand> _commands = [];

  void addCommand(PermissionCommand command) {
    _commands.add(command);
  }

  Future<void> executeCommands() async {
    for (var command in _commands) {
      bool result = await command.execute();
      if (!result) {
       throw Exception("Permission was denied.");
      }
    }
  }
}


///Sample use case
///
//   PermissionInvoker invoker = PermissionInvoker();
//
//   invoker.addCommand(RequestStoragePermissionCommand());
//   invoker.addCommand(RequestPhotosPermissionCommand());
//
//   await invoker.executeCommands();
//