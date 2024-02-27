import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopLayout(
      leftSide: WelcomeSign(),
      rightSide: HomePage(),
    );
  }
}
