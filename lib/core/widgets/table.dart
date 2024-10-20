import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class TableWidget extends StatelessWidget {
  final List<Map<String, String>> items;
  final Color evenRowColor;
  final Color oddRowColor;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final String? tableTitle;

  const TableWidget({
    super.key,
    required this.items,
    this.evenRowColor = AppColors.white,
    this.oddRowColor = const Color(0xFFF7F7F7),
    this.titleStyle,
    this.valueStyle,
    this.tableTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tableTitle != null)
          Text(tableTitle!,
              style: AppTextStyles.bodyMediumTextStyle20.copyWith(
                fontWeight: FontWeight.w700,
              )),
        ...List.generate(items.length, (index) {
          final item = items[index];
          final isEven = index % 2 == 0;
          return Container(
            color: isEven ? evenRowColor : oddRowColor,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['title'] ?? '',
                  style: titleStyle ?? AppTextStyles.bodySmallTextStyle16,
                ),
                Text(
                  item['value'] ?? '',
                  style: valueStyle ?? AppTextStyles.bodySmallTextStyle16,
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
