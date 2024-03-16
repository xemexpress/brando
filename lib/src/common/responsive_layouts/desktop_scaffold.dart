import 'package:flutter/material.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({
    super.key,
    required this.leftSide,
    required this.rightSide,
  });

  final Widget leftSide;
  final Widget rightSide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: leftSide,
          ),
          Flexible(
            flex: 5,
            child: rightSide,
          ),
        ],
      ),
    );
  }
}
