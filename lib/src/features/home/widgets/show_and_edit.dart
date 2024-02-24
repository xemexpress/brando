import 'package:flutter/material.dart';

class ShowAndEdit extends StatelessWidget {
  const ShowAndEdit({
    super.key,
    required this.displayText,
    required this.onEdit,
  });

  final String displayText;
  final Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(displayText),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: onEdit,
          child: Icon(
            Icons.edit,
            size: 15,
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
        ),
      ],
    );
  }
}
