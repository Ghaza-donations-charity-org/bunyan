import '../common_model/user_model.dart';

class UserController {
  final UserModel user;

  UserController(this.user);

  void autoUpdatePoints(int amount, String triggerKey) {
    try {
      user.autoUpdatePoints(amount, triggerKey);
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  void manipulatePoints(int amount, String verifier) {
    try {
      user.manipulatePoints(amount, verifier);
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}
