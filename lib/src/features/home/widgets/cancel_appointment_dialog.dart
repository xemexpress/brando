import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CancelAppointmentDialog extends ConsumerStatefulWidget {
  const CancelAppointmentDialog({super.key});

  @override
  ConsumerState<CancelAppointmentDialog> createState() =>
      _CancelAppointmentDialogState();
}

class _CancelAppointmentDialogState
    extends ConsumerState<CancelAppointmentDialog> {
  void confrimCancellation() async {
    try {
      Navigator.of(context).pop();

      await ref
          .read(appointmentControllerProvider.notifier)
          .cancelAppointment();

      ref.read(appointmentControllerProvider.notifier).resetStage();
    } on GenericAppointmentException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void popOut() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DialogBox(
      content: SizedBox(
        height: 80,
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Are you sure to cancel?',
              style: context.responsive(
                Theme.of(context).textTheme.titleLarge,
                md: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  text: 'No',
                  onPressed: popOut,
                  horizontalPadding: 25,
                  height: 25,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textStyle: context.responsive(
                    Theme.of(context).textTheme.titleMedium,
                    md: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                MyButton(
                  text: 'Yes',
                  onPressed: confrimCancellation,
                  horizontalPadding: 25,
                  height: 25,
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  textStyle: context.responsive(
                    Theme.of(context).textTheme.titleMedium,
                    md: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
