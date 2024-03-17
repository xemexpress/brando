import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.text,
    required this.next,
  });

  final String text;
  final Function() next;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: next,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: context.responsive(double.infinity, md: 270),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(
              context.responsive(7, md: 20),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
