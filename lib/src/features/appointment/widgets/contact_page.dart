import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({
    super.key,
    required this.appBarBuilder,
  });

  final Widget Function({
    required String title,
    required Function()? leadingFunction,
  }) appBarBuilder;

  @override
  ConsumerState<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage> {
  void goToPreviousPage() {
    ref.read(appointmentControllerProvider.notifier).previousStage();
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

    final Widget appBar = widget.appBarBuilder(
      title: 'You are almost there!',
      leadingFunction: goToPreviousPage,
    );

    return context.responsive(
      SingleChildScrollView(
        child: Column(
          children: [
            appBar,
            contactBody,
          ],
        ),
      ),
      md: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: appBar,
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
