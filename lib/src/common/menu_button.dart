import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => openDrawer(context),
      icon: Icon(
        Icons.menu_rounded,
        color: Theme.of(context).colorScheme.background,
        size: 35,
      ),
    );
  }
}
