import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'app_text_styles.dart';
import 'base_text_style_and_style_decorators.dart';

// Client code that uses decorators
class AppTextTheme {
  static final appTextTheme = TextTheme(
    titleLarge: BoldTextStyleDecorator()
        .apply(AppTextStyles.titleLarge)
        .copyWith(color: AppColors.textSecondaryColor),
    titleMedium: NormalTextStyleDecorator()
        .apply(AppTextStyles.titleMedium)
        .copyWith(color: AppColors.textSecondaryColor),
    titleSmall: BoldTextStyleDecorator()
        .apply(AppTextStyles.titleSmall)
        .copyWith(color: AppColors.textSecondaryColor),
    bodyLarge: NormalTextStyleDecorator()
        .apply(AppTextStyles.bodyLarge)
        .copyWith(color: AppColors.textSecondaryColor),
    bodyMedium: BoldTextStyleDecorator()
        .apply(AppTextStyles.bodyMedium)
        .copyWith(color: AppColors.textSecondaryColor),
    bodySmall: NormalTextStyleDecorator()
        .apply(AppTextStyles.bodySmall)
        .copyWith(color: AppColors.textSecondaryColor),
    labelMedium: BoldTextStyleDecorator()
        .apply(AppTextStyles.labelMedium)
        .copyWith(color: AppColors.textSecondaryColor),
  );
}
