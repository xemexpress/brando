import 'package:flutter/material.dart';

class StateButton extends StatelessWidget {
  const StateButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
  });

  final String text;
  final Function() onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        // style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
