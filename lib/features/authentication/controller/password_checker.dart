import 'dart:ui';
import '../../../common_mvc/common_view/theme/app_colors.dart';

enum PasswordCheckerStatus { notFulfilled, fulfilled, error }

class PasswordChecker {
  String label;
  PasswordCheckerStatus status;
  Color fulfillmentColor = AppColors.green;
  Color unfulfilledColor = AppColors.grey;
  Color errorColor = AppColors.red;

  PasswordChecker(
      {required this.label, this.status = PasswordCheckerStatus.notFulfilled});
}
