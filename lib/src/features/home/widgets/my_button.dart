import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.height,
    this.textStyle,
    this.horizontalPadding,
  });

  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final double? height;
  final double? horizontalPadding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? context.responsive(15, md: 10),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              context.responsive(5, md: 15),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
