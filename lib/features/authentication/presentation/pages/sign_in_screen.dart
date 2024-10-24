import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles_and_text_theme/app_text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('Sign In',
        style: AppTextStyles.bodySmall,
        ),
    ),
      body:  Center(
        child: Text('Sign In',
        style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
