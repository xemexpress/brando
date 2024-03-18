import 'package:flutter/material.dart';

class ShowAndEdit extends StatefulWidget {
  const ShowAndEdit({
    super.key,
    required this.displayText,
    this.onEdit,
    this.isVerified = false,
  });

  final String displayText;
  final Function()? onEdit;
  final bool isVerified;

  @override
  State<ShowAndEdit> createState() => _ShowAndEditState();
}

class _ShowAndEditState extends State<ShowAndEdit> {
  bool isHovered = false;

  void onHovering(e) {
    setState(() {
      isHovered = !isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.displayText),
        if (widget.isVerified) ...[
          const SizedBox(width: 2),
          const Icon(
            Icons.verified,
            size: 12,
          ),
        ],
        if (widget.onEdit != null) ...[
          const SizedBox(width: 7),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: onHovering,
            onExit: onHovering,
            child: GestureDetector(
              onTap: widget.onEdit,
              child: Icon(
                Icons.edit,
                size: 15,
                color: isHovered
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : Theme.of(context).colorScheme.surfaceVariant,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
