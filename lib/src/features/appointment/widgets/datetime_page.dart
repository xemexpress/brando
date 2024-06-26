import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimePage extends ConsumerStatefulWidget {
  const DateTimePage({
    super.key,
    required this.appBarBuilder,
  });

  final Widget Function({
    required String title,
    required Function()? leadingFunction,
  }) appBarBuilder;

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
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: context.responsive(40, sm: 30, md: 40, lg: 80, xl: 130),
      ),
      child: const DateTimePanel(),
    );

    final Widget appBar = widget.appBarBuilder(
      title: 'Book your appointment',
      leadingFunction: goToHomePage,
    );

    return context.responsive(
      SingleChildScrollView(
        child: Column(
          children: [
            appBar,
            dateTimeBody,
          ],
        ),
      ),
      md: SingleChildScrollView(
        child: Column(
          children: [
            appBar,
            dateTimeBody,
          ],
        ),
      ),
    );
  }
}
