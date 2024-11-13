import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color? textColors;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  const TextButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.textColors = Colors.black,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontFamily: 'Cairo',
              color: textColors,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
