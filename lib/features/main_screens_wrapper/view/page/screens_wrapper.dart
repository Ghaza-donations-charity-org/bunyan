import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/screen_utility_functions.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/widget/mobile_app_view.dart';
import 'package:ghaza_donations_app/features/main_screens_wrapper/view/widget/web_view.dart';
import 'package:ghaza_donations_app/features/navigation_bar/view/bottom_navigation_bar.dart';

import '../../../navigation_bar/view/side_navigation_rail.dart';
class ScreensWrapper extends StatelessWidget {
  const ScreensWrapper({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilityFunctions().isWideScreen(context) ? WebAppView() : MobileAppView();

  }
}
