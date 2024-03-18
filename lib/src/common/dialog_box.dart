import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      elevation: 8.0,
      shadowColor: Theme.of(context).colorScheme.surfaceVariant,
      content: content,
    );
  }
}
