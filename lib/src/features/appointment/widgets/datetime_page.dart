import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimePage extends ConsumerStatefulWidget {
  const DateTimePage({
    super.key,
    required this.appBar,
  });

  final Widget appBar;

  @override
  ConsumerState<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends ConsumerState<DateTimePage> {
  void goToHomePage() {
    ref.read(appointmentControllerProvider.notifier).resetStage();

    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final dateTimeBody = Container(
      padding: context.responsive(
        const EdgeInsets.symmetric(horizontal: 40),
        sm: const EdgeInsets.symmetric(horizontal: 30),
        md: const EdgeInsets.symmetric(horizontal: 10),
        lg: const EdgeInsets.symmetric(horizontal: 80),
      ),
      child: const DateTimePanel(),
    );

    return context.responsive(
      SingleChildScrollView(
        child: Column(
          children: [
            widget.appBar,
            dateTimeBody,
          ],
        ),
      ),
      md: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: widget.appBar,
          ),
          Align(
            alignment: Alignment.center,
            child: dateTimeBody,
          ),
        ],
      ),
    );
  }
}
