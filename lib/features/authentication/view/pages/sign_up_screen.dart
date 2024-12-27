import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/app_constants/app_measures.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/buttons/button_widget.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/logo.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/text_fields/text_field.dart';
import 'package:ghaza_donations_app/features/authentication/controller/sign_up_controller.dart';
import 'package:ghaza_donations_app/features/authentication/view/pages/sign_in_screen.dart';
import '../../../../common_mvc/common_view/theme/app_text_styles_and_text_theme/app_text_styles.dart';
import '../../../../common_mvc/common_view/widgets/alert_dialog.dart';
import '../../../main_screens_wrapper/view/page/screens_wrapper.dart';
import '../../model/sign_in_result.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final SignUpController signUpController ;

  @override
  void initState() {
    super.initState();
    signUpController= SignUpController(context: context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppMeasures.scaffoldPadding24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppMeasures.largeSpacer24 * 2,
              ),
              const Row(), // Empty row to let the Column take the full width
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Bunyan',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),
              const Align(
                alignment: Alignment.center,
                child: AppLogo(),
              ),
              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),

              Text(
                'Email',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: AppMeasures.mediumSpacer12,
              ),
              TextFieldWidget(
                textController: emailController,
                hintText: 'Email',
              ),
              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),

              Text(
                'Password',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),



              const SizedBox(
                height: AppMeasures.mediumSpacer12,
              ),
              TextFieldWidget(
                textController: passwordController,
                hintText: 'Password',
                isHiddenByDefault: true,
              ),
              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),
              Text(
                'Confirm password',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: AppMeasures.mediumSpacer12,
              ),


              TextFieldWidget(
                textController: passwordController,
                hintText: 'Password',
                isHiddenByDefault: true,
              ),
              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),

              Text(
                "User type",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              chooseUserTypeDrowpDownButton(),

              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),
              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),

              signUpButton(),

              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),



              signInInsteadButton(),
            ],
          ),
        ),
      ),
    );
  }


  Widget chooseUserTypeDrowpDownButton(){
    String selectedUserType = 'Donor';
    return DropdownButton<String>(
      value: selectedUserType,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          selectedUserType = value!;
        });
      },
      items:
        const [
          DropdownMenuItem<String>(
          value: 'Donor',
          child: Text('Donor'),
        ),

    DropdownMenuItem<String>(
    value: 'Refugee',
    child: Text('Refugee'),
    ),
      ],
    );
  }



  Widget signInInsteadButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: AppTextStyles.bodyMedium,
        ),
        const SizedBox(
          width: 3,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: Text(
            "Sign In",
            style:
            AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget signUpButton() {
    return ButtonWidget(
      onPressed: () async {
        SignUpController signUpController = SignUpController(context: context);

        try {
          //validate user input first
          signUpController.validateSignUpData(
              email: emailController.text, password: passwordController.text);

          //now, sign up
          try {
            FirebaseAuthResult signUpResult = (await signUpController.signUp( email: emailController.text, password: passwordController.text)) as FirebaseAuthResult;
            signUpController.handleSignUpResult(signUpResult);
          } catch (e) {
            showDialog(
                context: context,
                builder: (context) =>
                    AlertDialogWidget(contentText: e.toString()));
          }
        } catch (e) {
          //handle the exception
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialogWidget(contentText: e.toString()));
        }
      },
      text: 'Sign Up',
    );
  }
}
