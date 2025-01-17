import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common_mvc/common_controller/user_controller.dart';
import 'common_mvc/common_model/user_model.dart';
import 'common_mvc/common_view/theme/app_theme.dart';
import 'features/authentication/view/widget/auth_wrapper.dart';
import 'features/make_donation_screen/controller/donation_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return

        MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationController()),
        ChangeNotifierProvider(
          create: (context) => UserControllerProvider(user: UserModel()),
        ),
        ChangeNotifierProvider(
          create: (_) => MakeDonationController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bunyan',
        theme: AppTheme.darkTheme,
        home: AuthWrapper(),
      ),
    );
  }
}
