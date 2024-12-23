import 'package:flutter/material.dart';

import '../../../common_controller/common_utility_classes/screen_utility_functions.dart';
import '../../theme/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Widget? child;
  final String? text;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      this.child,
      this.backgroundColor,
      this.foregroundColor,
      this.width,
      this.height,
      this.text = 'Button',
      this.borderRadius,
      this.horizontalPadding,
      this.verticalPadding,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? ScreenUtilityFunctions().getScreenWidth(context),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          foregroundColor: foregroundColor ?? AppColors.scaffoldBackgroundColor,
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 20,
              vertical: verticalPadding ?? 10),
          child: child ??
              Text(
                text ?? ' ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: foregroundColor ?? AppColors.scaffoldBackgroundColor,
                  fontSize: fontSize ?? (text!.length > 15 ? 17 : 20),
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}
