import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationPanel extends ConsumerWidget {
  const ConfirmationPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text('Your booking is all set!');
  }
}
