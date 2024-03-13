import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/auth/widgets/log_in_page.dart';
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
    // return const DesktopLayout(
    // leftSide: PrimarySection(
    //   child: WelcomeSign(),
    // ),
    //   rightSide: LogInPage(),
    // );

    return const ResponsiveLayout(
      mobileScaffold: DesktopScaffold(
        leftSide: PrimarySection(
          child: WelcomeSign(),
        ),
        rightSide: LogInPage(),
      ),
      desktopScaffold: DesktopScaffold(
        leftSide: PrimarySection(
          child: WelcomeSign(),
        ),
        rightSide: LogInPage(),
      ),
    );
  }
}
