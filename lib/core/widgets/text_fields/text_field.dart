import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../app_constants/app_measures.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles_and_theme/app_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  final Color? fillColor;
  final bool autoFocus;
  final OutlineInputBorder? focusBorder;
  final Color? cursorColor;
  final bool? filled;
  final Color? focusColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final String? labelText;
  final String? hintText;
  final TextEditingController textController;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final Widget? prefix;
  final Widget? suffix;
  final bool? isHiddenByDefault;
  final bool? canBeVisible;
  final Widget? suffixWhenTextIsHidden;
  final Widget? suffixWhenTextIsVisible;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function? onSubmitted;
  final Function? onTap;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final bool enabled; //a variable to enable editing the textfield or not (why? in some areas of the app we'll need a container that looks like a text field, to show the users what they have entered, but they cannot modify it)

  const TextFieldWidget({
    super.key,
    this.autoFocus = false,
    this.labelText,
    this.prefix,
    this.suffix,
    this.isHiddenByDefault,
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
    this.suffixWhenTextIsHidden,
    this.suffixWhenTextIsVisible,
    this.labelTextStyle,
    this.inputTextStyle,
    this.canBeVisible,
    this.borderRadius,
    this.errorBorderColor,
    this.validator,
    this.hintText,
    this.hintTextStyle,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.prefixIcon,
    this.focusNode,
    this.keyboardType,
    this.cursorHeight,
    this.enabled = true,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool isHidden;
  @override
  void initState() {
    super.initState();
    if (widget.isHiddenByDefault == null || widget.isHiddenByDefault == false) {
      isHidden = false;
    }
    if (widget.canBeVisible != null && widget.canBeVisible == false) {
      isHidden = true;
    } else {
      isHidden = widget.isHiddenByDefault ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding ?? 0,
          horizontal: widget.horizontalPadding ?? 0),
      child: TextFormField(
        enabled: widget.enabled ?? true,
        focusNode: widget.focusNode,
        autofocus: widget.autoFocus,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.textController,
        obscureText: isHidden ?? false,
        obscuringCharacter: '*',
        validator: widget.validator,
        style: widget.inputTextStyle ??
            TextStyle(
              fontFamily: 'Cairo',
              color: widget.textColor ?? AppColors.textSecondaryColor,
              fontSize: 16,
            ),
        cursorColor: widget.cursorColor ?? AppColors.primaryColor,
        cursorHeight: widget.cursorHeight ?? 18,
        cursorWidth: 1,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
         // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText ?? '',
          labelText: widget.labelText ?? '',
          hintStyle: widget.hintTextStyle ??
              AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.textSecondaryColor),
          labelStyle: widget.labelTextStyle ??
              AppTextStyles.bodyMedium.copyWith(
                color: widget.textColor ?? AppColors.textSecondaryColor,
              ),
          filled: widget.filled ?? false,
          fillColor: widget.fillColor ?? Colors.transparent,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.lightGrey2, width: 0),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius ?? 12),
            ),
          ),
          focusedBorder: widget.focusBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.focusColor ?? AppColors.primaryColor,
                    width: 0),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 12),
                ),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.lightGrey2, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius ?? 12),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.errorBorderColor ?? AppColors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius ?? 12),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.errorBorderColor ?? AppColors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius ?? 12),
            ),
          ),
          prefix:  widget.prefix!= null ?
          Padding(padding: const EdgeInsets.only(right: AppMeasures.smallPadding6),child: widget.prefix!) :
          const SizedBox(),
          suffix: (widget.isHiddenByDefault == null ||
                  widget.isHiddenByDefault == false)
              ? (widget.suffix == null)
                  ? const SizedBox()
                  : widget.suffix
              : (widget.canBeVisible != null || widget.canBeVisible == false)
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      child: isHidden
                          ? (widget.suffixWhenTextIsHidden ??
                              const Icon(
                                IconsaxPlusBold.eye_slash,
                                color: AppColors.grey,
                              ))
                          : widget.suffixWhenTextIsVisible ??
                              const Icon(IconsaxPlusBold.eye,
                                  color: AppColors.grey),
                    ),
        ),
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
      ),
    );
  }
}
