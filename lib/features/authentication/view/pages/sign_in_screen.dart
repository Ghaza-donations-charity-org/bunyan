import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/image_utils.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/app_constants/app_images.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/app_constants/app_measures.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/buttons/button_widget.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/logo.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/text_fields/text_field.dart';
import 'package:ghaza_donations_app/features/authentication/model/sign_in_with_google.dart';
import 'package:ghaza_donations_app/features/authentication/view/pages/sign_up_screen.dart';
import '../../../../common_mvc/common_view/theme/app_text_styles_and_text_theme/app_text_styles.dart';
import '../../../../common_mvc/common_view/widgets/alert_dialog.dart';
import '../../../main_screens_wrapper/view/page/screens_wrapper.dart';
import '../../controller/sign_in_controller.dart';
import '../../model/sign_in_result.dart';
import '../../model/sign_in_with_apple.dart';
import '../../model/sign_in_with_email_and_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final SignInController signInController;

  @override
  void initState() {
    super.initState();
    signInController = SignInController(context: context);
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

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),

              signInButton(),

              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),

              orDivider(),

              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),
              socialMediaButtons(),
              const SizedBox(
                height: AppMeasures.largeSpacer24,
              ),
              createAccountButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('OR'),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget socialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        signInWithGoogleButton(),
        const SizedBox(
          width: AppMeasures.largeSpacer24 * 2,
        ),
        signInWithAppleButton(),
      ],
    );
  }

  Widget signInWithGoogleButton() {
    return GestureDetector(
      onTap: () {
        signInController.setStrategy(GoogleSignInStrategy());
        signInController.signIn();
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image(
              image: ImageUtilityFunctions.getImage(AppImages.googleLogo),
            )),
      ),
    );
  }

  Widget signInWithAppleButton() {
    return GestureDetector(
      onTap: () {
        signInController.setStrategy(AppleSignInStrategy());
        signInController.signIn();
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image(
              image: ImageUtilityFunctions.getImage(AppImages.appleLogo),
            )),
      ),
    );
  }

  Widget createAccountButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppTextStyles.bodyMedium,
        ),
        const SizedBox(
          width: 3,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignUpScreen()));
          },
          child: Text(
            "Create Account",
            style:
                AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget signInButton() {
    return ButtonWidget(
      onPressed: () async {
        SignInController signInController = SignInController(context: context);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ScreensWrapper()));

      //   try {
      //     //validate user input first
      //     signInController.validateSignInData(
      //         email: emailController.text, password: passwordController.text);
      //     //if valid, set the strategy
      //     signInController.setStrategy(SignInWithEmailAndPassword(
      //         email: emailController.text, password: passwordController.text));
      //     //now, sign in
      //     try {
      //       FirebaseAuthResult signInResult = await signInController.signIn();
      //       signInController.handleSignInResult(signInResult);
      //     } catch (e) {
      //       showDialog(
      //           context: context,
      //           builder: (context) =>
      //               AlertDialogWidget(contentText: e.toString()));
      //     }
      //   } catch (e) {
      //     //handle the exception
      //     showDialog(
      //         context: context,
      //         builder: (context) =>
      //             AlertDialogWidget(contentText: e.toString()));
      //   }
       },

      text: 'Sign In',
    );
  }
}
