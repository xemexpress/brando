import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationPage extends ConsumerStatefulWidget {
  const ConfirmationPage({
    super.key,
    required this.appBarBuilder,
  });

  final Widget Function({
    required String title,
    Function()? leadingFunction,
  }) appBarBuilder;

  @override
  ConsumerState<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends ConsumerState<ConfirmationPage> {
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

    final Widget appBar = widget.appBarBuilder(
      title: 'See you there!',
    );

    return context.responsive(
      SingleChildScrollView(
        child: Column(
          children: [
            appBar,
            confirmationBody,
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
            child: confirmationBody,
          ),
        ],
      ),
    );
  }
}
