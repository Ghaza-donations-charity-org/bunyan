import 'package:flutter/material.dart';
import '../app_constants/app_measures.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class DropDownMenuWidget extends StatefulWidget {
  final Color? fillColor;
  final OutlineInputBorder? focusBorder;
  final Color? cursorColor;
  final bool? filled;
  final Color? focusColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final String? label;
  String? hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController textController;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextStyle? labelTextStyle;
  final TextStyle? inputTextStyle;
  final Widget? prefix;
  final Widget? suffix;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final List<Widget>? dropdownItemsAsWidgets;
  final List<String> dropdownItemsAsStrings;
  String? selectedItem;
  final void Function(String?)? onChanged;

   DropDownMenuWidget({
    super.key,
    this.label,
    required this.textController,
    this.verticalPadding,
    this.horizontalPadding,
    this.fillColor,
    this.focusColor,
    this.textColor,
    this.borderColor,
    this.filled,
    this.focusBorder,
    this.cursorColor,
    this.labelTextStyle,
    this.inputTextStyle,
    this.borderRadius,
    this.errorBorderColor,
    this.validator,
    this.selectedItem,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.dropdownItemsAsWidgets,
    required this.dropdownItemsAsStrings,
    this.hintText,
    this.hintTextStyle,
  });

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.verticalPadding ?? 0,
        horizontal: widget.horizontalPadding ?? 0,
      ),
      child: DropdownButtonFormField<String>(
        autofocus: false,
        value: (widget.selectedItem != null && widget.selectedItem!.isNotEmpty )? widget.selectedItem : null,
        onChanged: (value) {
          setState(() {
            widget.selectedItem = value;
            widget.textController.text = value ?? '';
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          });
        },
        validator: widget.validator,
        dropdownColor: AppColors.backgroundWhite,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: widget.labelTextStyle ??
              TextStyle(
                color: widget.textColor ?? AppColors.textSecondaryColor,
              ),
          hintText: widget.textController.text,
          hintStyle: widget.hintTextStyle ??
              AppTextStyles.bodySmallTextStyle16
                  .copyWith(color: AppColors.textSecondaryColor),
          filled: widget.filled ?? false,
          fillColor: widget.fillColor ?? Colors.transparent,
          prefix: widget.prefix ?? const SizedBox(),
          suffix: widget.suffix ?? const SizedBox(),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.lightGrey2, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.lightGrey2, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          ),
          focusedBorder: widget.focusBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.focusColor ?? AppColors.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.errorBorderColor ?? AppColors.red, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.errorBorderColor ?? AppColors.red, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          ),
        ),
        items: widget.dropdownItemsAsStrings.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppMeasures.mediumPadding12,
                  horizontal: AppMeasures.largePadding24),
              child: Text(
                item,
                style: AppTextStyles.bodySmallTextStyle16
                    .copyWith(color: AppColors.textSecondaryColor),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
