import 'package:flutter/cupertino.dart';
import '../app_constants/app_measures.dart';
import '../theme/app_colors.dart';

class CheckboxListTileWidget extends StatefulWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final bool canSelectMultipleOptions;

  const CheckboxListTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.canSelectMultipleOptions = false,
  });

  @override
  State<CheckboxListTileWidget> createState() => _CheckboxListTileWidgetState();
}

class _CheckboxListTileWidgetState extends State<CheckboxListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppMeasures.smallPadding6 * 0.5),
        child: Container(
          decoration: BoxDecoration(
            color: widget.value ? AppColors.lightGreyGedan : null,
            borderRadius: const BorderRadius.all(
                Radius.circular(AppMeasures.mediumBorderRadius12)),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppMeasures.smallPadding6,
            horizontal: AppMeasures.mediumPadding12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CupertinoCheckbox(
                shape: widget.canSelectMultipleOptions == true
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            AppMeasures.smallBorderRadius),
                      )
                    : const CircleBorder(),
                value: widget.value,
                activeColor: AppColors.primaryColor,
                onChanged: widget.onChanged,
              ),
              const SizedBox(width: AppMeasures.smallSpacer6),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.value
                        ? AppColors.primaryColor
                        : AppColors.darkTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
