import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({
    super.key,
    required this.appBar,
  });

  final Widget appBar;

  @override
  ConsumerState<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage> {
  void goToHomePage() {
    ref.read(appointmentControllerProvider.notifier).resetStage();

    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final contactBody = Container(
      padding: context.responsive(
        const EdgeInsets.symmetric(horizontal: 40),
        sm: const EdgeInsets.symmetric(horizontal: 120),
        md: const EdgeInsets.symmetric(horizontal: 50),
        lg: const EdgeInsets.symmetric(horizontal: 110),
        xl: const EdgeInsets.symmetric(horizontal: 130),
      ),
      child: const ContactPanel(),
    );

    return context.responsive(
      SingleChildScrollView(
        child: Column(
          children: [
            widget.appBar,
            contactBody,
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
            child: contactBody,
          ),
        ],
      ),
    );
  }
}
