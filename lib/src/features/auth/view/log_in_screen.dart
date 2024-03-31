import 'package:brando/src/apis/analytics/analytics.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/auth/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInScreen extends ConsumerStatefulWidget {
  static const String screenName = 'Log In Screen';

  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        await ref
            .read(analyticsAPIProvider)
            .setCurrentScreen(pageName: LogInScreen.screenName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return context.responsive(
      const MobileScaffold(
        body: LogInPage(),
      ),
      md: const DesktopScaffold(
        leftSide: PrimarySection(
          child: WelcomeSign(),
        ),
        rightSide: LogInPage(),
      ),
    );
  }
}
