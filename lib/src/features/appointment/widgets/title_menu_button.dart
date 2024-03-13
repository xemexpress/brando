import 'package:flutter/material.dart';

class TitleMenuButton extends StatelessWidget {
  const TitleMenuButton({
    super.key,
    required this.value,
    required this.onPressed,
  });

  final String value;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      onPressed: () => onPressed(value),
      style: MenuItemButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      child: Text(value),
    );
  }
}
