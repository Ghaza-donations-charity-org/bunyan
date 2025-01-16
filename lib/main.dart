import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common_mvc/common_controller/user_controller.dart';
import 'common_mvc/common_model/firebase_models/firebase_services_singleton.dart';
import 'common_mvc/common_model/user_model.dart';
import 'common_mvc/common_view/theme/app_theme.dart';
import 'features/authentication/view/widget/auth_wrapper.dart';
import 'features/dummy_screen_for_testing.dart';
import 'features/navigation_bar/controller/navigation_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return
      // MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   theme: AppTheme.darkTheme,
      //   home: const DummyScreenForTesting(),);

      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationController()),
        ChangeNotifierProvider(
          create: (context) => UserControllerProvider(user: UserModel()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bunyan',
        theme: AppTheme.darkTheme,
        home: AuthWrapper(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
