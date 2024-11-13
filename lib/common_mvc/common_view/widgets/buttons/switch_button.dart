import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class SwitchButtonWidget extends StatefulWidget {
  final Function onChange;
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final bool? initialValue;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  const SwitchButtonWidget(
      {super.key,
      required this.label,
      this.prefix,
      this.suffix,
      this.verticalPadding,
      this.horizontalPadding,
      this.initialValue = false,
      this.activeColor,
      this.activeTrackColor,
      this.inactiveThumbColor,
      this.inactiveTrackColor,
      required this.onChange});

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  bool state = false;
  @override
  void initState() {
    super.initState();
    state = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding ?? 0,
          horizontal: widget.horizontalPadding ?? 0),
      child: Row(
        children: [
          Text(widget.label, style: Theme.of(context).textTheme.bodyLarge),
          widget.prefix ?? const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Switch(
              value: state,
              onChanged: (value) {
                widget.onChange(value);
                setState(() {
                  state = !state;
                });
              },
              activeTrackColor:
                  widget.activeTrackColor ?? AppColors.green.withOpacity(0.9),
              activeColor: widget.activeColor ?? AppColors.backgroundWhite,
              inactiveThumbColor:
                  widget.inactiveThumbColor ?? AppColors.textGrey,
              inactiveTrackColor: widget.inactiveTrackColor ??
                  AppColors.textGrey.withOpacity(0.2),
            ),
          ),
          widget.suffix ?? const SizedBox()
        ],
      ),
    );
  }
}
