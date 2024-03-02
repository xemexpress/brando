import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.horizontalPadding = 10,
  });

  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      width: null,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 10,
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
