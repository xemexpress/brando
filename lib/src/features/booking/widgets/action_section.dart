import 'package:flutter/material.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key, required this.stage, required this.next});

  final int stage;
  final Function()? next;

  @override
  Widget build(BuildContext context) {
    switch (stage) {
      case 0:
      case 1:
        final String text = stage == 0 ? 'NEXT' : 'CONFIRM';
        return Positioned(
          bottom: 40,
          right: 90,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: next,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 270,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(text),
              ),
            ),
          ),
        );
      case 2:
        return const Positioned(
          bottom: 40,
          child: Text('change time'),
        );

      default:
        return Container();
    }
  }
}
