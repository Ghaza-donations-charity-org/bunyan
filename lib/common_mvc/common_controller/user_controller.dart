import 'package:provider/provider.dart';

import '../common_model/user_model.dart';

class UserControllerProvider extends ChangeNotifierProvider{
  final UserModel user;
  //todo: get current user id and as docs as whole
  //todo: firestore services folder responsible for manipulating user data (points)

  UserControllerProvider({required this.user, required super.create});

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
