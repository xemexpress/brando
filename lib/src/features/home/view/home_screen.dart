import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return context.responsive(
      const MobileScaffold(
        body: HomePage(),
      ),
      md: const DesktopScaffold(
        leftSide: PrimarySection(
          isShadowed: true,
          child: WelcomeSign(),
        ),
        rightSide: HomePage(),
      ),
    );
  }
}
