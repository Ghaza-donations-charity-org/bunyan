
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_constants/app_images.dart';
import '../../app_constants/app_measures.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import '../buttons/back_button_widget.dart';
import '../text_fields/text_field.dart';

class SearchBarWidget extends StatefulWidget {
  bool isSearching;
  final Function? onBackButtonPressed;
  final Function? onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool? filled;
  final Color? fillColor;
  final TextEditingController textController;
  final Color? backButtonBackgroundColor;
  final String? hintText;
  final Color? textColor;
  final FocusNode? focusNode;

  SearchBarWidget({
    this.backButtonBackgroundColor,
    this.filled,
    this.fillColor,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
    this.isSearching = false,
    required this.textController,
    this.onBackButtonPressed,
    this.onTap,
    this.hintText,
    this.textColor,
    this.focusNode,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return searchBarWithBackButtonWidget();
  }

  Widget searchBarWidget() {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
      ),
      height: 42,
      width: isSearching == true ? 300 : double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextFieldWidget(
              focusColor: AppColors.textSecondaryColor,
              filled: widget.filled ?? false,
              fillColor: widget.fillColor ?? Colors.transparent,
              onTap: () {
                isSearching = true;
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              textController: widget.textController,
              hintText: 'Search',
              labelText: 'Search',
              labelTextStyle: AppTextStyles.bodySmallTextStyle16.copyWith(
                color: widget.textColor ?? AppColors.textSecondaryColor,
                fontSize: 16,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppMeasures.mediumPadding12 * 1.2),
                child: SvgPicture.asset(
                  AppImages.searchIconSVG,
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBarWithBackButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        isSearching == false
            ? const SizedBox.shrink()
            : BackButtonWidget(
                backgroundColor: widget.backButtonBackgroundColor ??
                    AppColors.lightGreyGedan,
                onPressed: () {
                  if (widget.onBackButtonPressed != null) {
                    widget.onBackButtonPressed!();
                  }
                  widget.textController.clear();
                  isSearching = false;

                  if (widget.onBackButtonPressed != null) {
                    widget.onBackButtonPressed!();
                  }

                  if (context.mounted) {
                    FocusScope.of(context).unfocus(); //dismiss the keyboard
                  }
                },
              ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppMeasures.mediumPadding12),
              child: searchBarWidget()),
        ),
      ],
    );
  }
}
