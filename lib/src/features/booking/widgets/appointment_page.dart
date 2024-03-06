import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/booking/controllers/controllers.dart';
import 'package:brando/src/features/booking/widgets/widgets.dart';
import 'package:brando/src/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentPage extends ConsumerWidget {
  const AppointmentPage({
    super.key,
  });

  void nextStage(BuildContext context, WidgetRef ref, int currentStage) {
    if (currentStage == 1) {
      final String name = ref.read(bookingProvider).appointment.name;
      final String phoneNumber =
          ref.read(bookingProvider).appointment.phoneNumber;

      if (name.isEmpty || phoneNumber.isEmpty) {
        if (name.isEmpty) {
          ref
              .read(bookingProvider.notifier)
              .raiseError(ContactPanelInputType.name);
        }

        if (phoneNumber.isEmpty) {
          ref
              .read(bookingProvider.notifier)
              .raiseError(ContactPanelInputType.phoneNumber);
        }

        showMySnackBar(context: context, message: 'Please fill in all fields.');
        return;
      }
    }

    ref.read(bookingProvider.notifier).nextStage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int stage = ref.watch(bookingProvider).stage;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        MyAppBar(
          leading: IconButton(
            onPressed: () {
              if (stage == 0) {
                Navigator.of(context).pushReplacement(HomeScreen.route());
              } else {
                ref.read(bookingProvider.notifier).previousStage();
              }
            },
            icon: Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
          trailing: Icon(
            Icons.person_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 40,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Center(
            child: IndexedStack(
              index: stage,
              children: const [
                DateTimePanel(),
                ContactPanel(),
                ConfirmationPanel(),
              ],
            ),
          ),
        ),
        ActionSection(
          stage: stage,
          next: () => nextStage(context, ref, stage),
        ),
      ],
    );
  }
}
