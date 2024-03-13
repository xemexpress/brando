import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/home/view/home_screen.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentPage extends ConsumerWidget {
  const AppointmentPage({
    super.key,
  });

  void nextStage(
      BuildContext context, WidgetRef ref, BookingStage currentStage) async {
    if (currentStage == BookingStage.contact) {
      final Appointment appointment =
          ref.read(appointmentControllerProvider).appointment;
      final String name = appointment.name;
      final String phoneNumber = appointment.phoneNumber;

      if (name.isEmpty || phoneNumber.isEmpty) {
        if (name.isEmpty) {
          ref
              .read(appointmentControllerProvider.notifier)
              .raiseError(ContactPanelInputType.name);
        }

        if (phoneNumber.isEmpty) {
          ref
              .read(appointmentControllerProvider.notifier)
              .raiseError(ContactPanelInputType.phoneNumber);
        }

        showMySnackBar(context: context, message: 'Please fill in all fields.');
      }

      await ref.read(appointmentControllerProvider.notifier).bookAppointment();
    }

    ref.read(appointmentControllerProvider.notifier).nextStage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppointmentState appointmentState =
        ref.watch(appointmentControllerProvider);

    final BookingStage stage = appointmentState.stage;
    final bool isLoading = appointmentState.isLoading;
    print('test ${appointmentState.appointment}');
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        MyAppBar(
          leading: stage == BookingStage.confirmation
              ? null
              : IconButton(
                  onPressed: () {
                    if (stage == BookingStage.datetime) {
                      ref
                          .read(appointmentControllerProvider.notifier)
                          .resetStage();
                      Navigator.of(context).pushReplacement(HomeScreen.route());
                    } else {
                      ref
                          .read(appointmentControllerProvider.notifier)
                          .previousStage();
                    }
                  },
                  icon: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
          trailing: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ref.read(appointmentControllerProvider.notifier).resetStage();
                Navigator.of(context).pushReplacement(HomeScreen.route());
              },
              child: Icon(
                Icons.person_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: IndexedStack(
            index: stage.code,
            alignment: Alignment.center,
            children: const [
              DateTimePanel(),
              ContactPanel(),
              ConfirmationPanel(),
            ],
          ),
        ),
        ActionSection(
          stage: stage,
          next: () => nextStage(context, ref, stage),
        ),
        if (isLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
      ],
    );
  }
}
