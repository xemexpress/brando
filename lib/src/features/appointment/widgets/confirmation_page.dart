import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationPage extends ConsumerStatefulWidget {
  const ConfirmationPage({
    super.key,
    required this.appBar,
  });

  final Widget appBar;

  @override
  ConsumerState<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends ConsumerState<ConfirmationPage> {
  void goToHomePage() {
    ref.read(appointmentControllerProvider.notifier).resetStage();

    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final confirmationBody = Container(
      padding: context.responsive(
        const EdgeInsets.symmetric(horizontal: 30),
        sm: const EdgeInsets.symmetric(horizontal: 130),
        md: const EdgeInsets.symmetric(horizontal: 20),
        lg: const EdgeInsets.symmetric(horizontal: 90),
        xl: const EdgeInsets.symmetric(horizontal: 165),
      ),
      child: const ConfirmationPanel(),
    );

    return context.responsive(
      SingleChildScrollView(
        child: Column(
          children: [
            widget.appBar,
            confirmationBody,
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
            child: confirmationBody,
          ),
        ],
      ),
    );
  }
}
