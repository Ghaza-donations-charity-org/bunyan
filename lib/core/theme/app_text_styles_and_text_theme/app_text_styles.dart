import 'package:flutter/material.dart';

import '../app_colors.dart';


class AppTextSizes {
  static const double small = 14.0;
  static const double medium = 16.0;
  static const double large = 20.0;
  static const double extraLarge = 30.0;
  static const double superLarge = 40.0;
}

class AppTextStyles {
  static const String fontFamily = 'Cairo';
  static const Color textColor = AppColors.textPrimaryColor;

  // Base style to reuse common properties
  static const TextStyle baseStyle = TextStyle(
    fontFamily: fontFamily,
    color: textColor,
  );

  static final TextStyle titleSmall = baseStyle.copyWith(
    fontSize: AppTextSizes.medium,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle titleMedium = baseStyle.copyWith(
    fontSize: AppTextSizes.extraLarge,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle titleLarge = baseStyle.copyWith(
    fontSize: AppTextSizes.superLarge,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodySmall = baseStyle.copyWith(
    fontSize: AppTextSizes.small,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyMedium = baseStyle.copyWith(
    fontSize: AppTextSizes.medium,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyLarge = baseStyle.copyWith(
    fontSize: AppTextSizes.large,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle labelMedium = baseStyle.copyWith(
    fontSize: AppTextSizes.superLarge,
    fontWeight: FontWeight.w700,
  );
}