import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';

class CopyToClipboardButton extends StatelessWidget {
  final String textToCopy;

  const CopyToClipboardButton({
    super.key,
    required this.textToCopy,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: textToCopy));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.lightGrey2,
            content: Text(
              'Copied to clipboard',
              style: AppTextStyles.bodyMediumTextStyle20,
            ),
          ),
        );
      },
      child: const Icon(
        IconsaxPlusBold.copy,
        color: AppColors.grey,
        size: 18,
      ),
    );
  }
}
