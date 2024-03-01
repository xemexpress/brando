import 'package:flutter/material.dart';

class RightBordered extends StatelessWidget {
  const RightBordered({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(),
        ),
      ),
      child: child,
    );
  }
}
