
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/image_utils.dart';

import '../app_constants/app_measures.dart';
import '../theme/app_colors.dart';

class AlertDialogWidget extends StatelessWidget {
  final String contentText;
  final String? title;
  final Widget? actionWidget;
  final VoidCallback? onPressed;

  const AlertDialogWidget(
      {super.key,
      required this.contentText,
      this.onPressed,
      this.title,
      this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title ?? '',
        style:
        Theme.of(context)
            .textTheme.bodyLarge
        //   style: //bodyLargeTextStyle25,
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          contentText,
          style: Theme.of(context)
              .textTheme.bodyMedium
        ),
      ),
      actions: [

        actionWidget ??
            Padding(
              padding: const EdgeInsets.all(AppMeasures.mediumPadding12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppMeasures.mediumBorderRadius12))),
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                child: Text("OK",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!.copyWith(color: AppColors.scaffoldBackgroundColor)),
              ),
            ),
      ],
    );
  }
}
