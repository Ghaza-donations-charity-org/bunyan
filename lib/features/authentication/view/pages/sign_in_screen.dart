import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/app_constants/app_measures.dart';
import '../../../../common_mvc/common_view/theme/app_text_styles_and_text_theme/app_text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:  Padding(padding: EdgeInsets.all(AppMeasures.scaffoldPadding24),child:
    SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppMeasures.largeSpacer24*2,),
        const Row(), // Empty row to let the Column take the full width
         Text('Sign In',style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: AppMeasures.smallSpacer6,),
    ],),),

    ),
    );
  }
}
