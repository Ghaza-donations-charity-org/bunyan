import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common_mvc/common_model/firebase_models/firebase_services_singleton.dart';
import 'common_mvc/common_view/theme/app_theme.dart';
import 'features/authentication/view/widget/auth_wrapper.dart';
import 'features/navigation_bar/controller/navigation_controller.dart';

void main()  {
   WidgetsFlutterBinding.ensureInitialized();
   FirebaseService().initializeFirebase();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NavigationController(),
    child:
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bunyan',
      theme: AppTheme.darkTheme,
      home:  AuthWrapper(),
      ),
    );
  }
}
