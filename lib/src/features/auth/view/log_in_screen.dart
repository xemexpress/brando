import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/auth/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
