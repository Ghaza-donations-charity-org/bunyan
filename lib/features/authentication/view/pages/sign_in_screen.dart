import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/app_constants/app_measures.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/buttons/button_widget.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/logo.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/text_fields/text_field.dart';
import '../../../../common_mvc/common_view/theme/app_text_styles_and_text_theme/app_text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
         Text('Bunyan',style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
        const SizedBox(height: AppMeasures.largeSpacer24,),
        const AppLogo(),
        const SizedBox(height: AppMeasures.largeSpacer24,),

        TextFieldWidget(textController: emailController, hintText: 'Email',),
        const SizedBox(height: AppMeasures.largeSpacer24,),
        TextFieldWidget(textController: passwordController, hintText: 'Password', isHiddenByDefault: true,),
        const SizedBox(height: AppMeasures.largeSpacer24,),
        ButtonWidget(onPressed: (){}, text: 'Sign In',),
        const SizedBox(height: AppMeasures.largeSpacer24,),

    ],),),

    ),
    );
  }
}
