import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'app_text_styles.dart';
import 'base_text_style_and_style_decorators.dart';

// Client code that uses decorators
class AppTextTheme {
  static final appTextTheme = TextTheme(
    titleLarge: BoldTextStyleDecorator()
        .apply(AppTextStyles.titleLarge),
    titleMedium: NormalTextStyleDecorator()
        .apply(AppTextStyles.titleMedium),
    titleSmall: BoldTextStyleDecorator()
        .apply(AppTextStyles.titleSmall),
    bodyLarge: NormalTextStyleDecorator()
        .apply(AppTextStyles.bodyLarge),
    bodyMedium: NormalTextStyleDecorator()
        .apply(AppTextStyles.bodyMedium),
    bodySmall: NormalTextStyleDecorator()
        .apply(AppTextStyles.bodySmall),
    labelMedium: BoldTextStyleDecorator()
        .apply(AppTextStyles.labelMedium),
  );
}
