import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.leading,
    this.trailing,
    this.backgroundColor,
  });

  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: backgroundColor ??
            getCompensatedColor(Theme.of(context).colorScheme.primary)
                .withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? Container(),
          trailing ?? Container(),
        ],
      ),
    );
  }
}
