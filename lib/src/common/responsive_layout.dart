import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.desktopScaffold,
  });

  final Widget mobileScaffold;
  final Widget desktopScaffold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}

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
