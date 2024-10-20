import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final bool? hasBackgroundColor;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const BackButtonWidget(
      {super.key,
      this.foregroundColor,
      this.backgroundColor,
      this.hasBackgroundColor = true,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: hasBackgroundColor == true
              ? (backgroundColor ?? AppColors.lightGreyGedan)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: foregroundColor ?? AppColors.darkTextColor,
          size: 18,
        ),
      ),
    );
  }
}
