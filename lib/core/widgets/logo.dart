import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_constants/app_images.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? isWhite;
  const AppLogo({super.key, this.height, this.width, this.isWhite});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 100,
        width: width ?? 100,
        child: isWhite == null || isWhite == false
            ? Image.asset(
                AppImages.logo,
                fit: BoxFit.contain,
              )
            : Image.asset(
                AppImages.whiteLogoPng,
                fit: BoxFit.contain,
              )
        // SvgPicture.asset(
        //   AppImages.whiteLogo,
        //   width: width,
        //   height: height,
        // ),

        );
  }
}
