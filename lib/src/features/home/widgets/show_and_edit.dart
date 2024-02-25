import 'package:flutter/material.dart';

class ShowAndEdit extends StatelessWidget {
  const ShowAndEdit({
    super.key,
    required this.displayText,
    required this.onEdit,
    this.isVerified = false,
  });

  final String displayText;
  final Function() onEdit;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(displayText),
        if (isVerified) ...[
          const SizedBox(width: 2),
          const Icon(
            Icons.verified,
            size: 12,
          ),
        ],
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
