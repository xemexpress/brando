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
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? context.responsive(10, md: 13),
            vertical: context.responsive(2, md: 3),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              context.responsive(5, md: 15),
            ),
          ),
          child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}
