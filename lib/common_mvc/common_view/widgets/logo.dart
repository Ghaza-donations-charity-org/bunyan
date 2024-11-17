import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/image_utils.dart';

import '../app_constants/app_images.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isDarkMode;
  const AppLogo({super.key, this.height, this.width, this.isDarkMode = true, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 100,
        width: width ?? 100,
        child: Image(image: ImageUtilityFunctions.getImage(isDarkMode? AppImages.logoWithWhiteBackground : AppImages.logo),),
        );
  }
}
