import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentPage extends ConsumerStatefulWidget {
  const AppointmentPage({
    super.key,
  });

  @override
  ConsumerState<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends ConsumerState<AppointmentPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (!ModalRoute.of(context)!.canPop) {
          final Appointment? appointment = await ref
              .read(appointmentControllerProvider.notifier)
              .currentAppointment();

          if (appointment != null) {
            ref
                .read(appointmentControllerProvider.notifier)
                .updateAppointment(appointment);
          }
        }
      },
    );
  }

  void nextStage(BookingStage currentStage) async {
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
        return;
      }

      await ref.read(appointmentControllerProvider.notifier).bookAppointment();
    }

    ref.read(appointmentControllerProvider.notifier).nextStage();
  }

  void previousStage(BookingStage stage) {
    if (stage == BookingStage.datetime) {
      ref.read(appointmentControllerProvider.notifier).resetStage();
      Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    } else {
      ref.read(appointmentControllerProvider.notifier).previousStage();
    }
  }

  void goToHomePage() {
    ref.read(appointmentControllerProvider.notifier).resetStage();

    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final AppointmentState appointmentState =
        ref.watch(appointmentControllerProvider);

    final BookingStage stage = appointmentState.stage;
    final bool isLoading = appointmentState.isLoading;

    final List<Widget> mainBodyChildren = [
      MyAppBar(
        title: context.responsive(
            stage == BookingStage.datetime
                ? 'Book your appointment'
                : stage == BookingStage.contact
                    ? 'You are almost there!'
                    : 'See you there!',
            md: ''),
        leading: context.responsive(
          const MenuButton(),
          md: [BookingStage.datetime, BookingStage.confirmation].contains(stage)
              ? null
              : IconButton(
                  onPressed: () => previousStage(stage),
                  icon: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
        ),
        trailing: context.responsive(
          null,
          md: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: goToHomePage,
              child: Icon(
                Icons.person_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
            ),
          ),
        ),
        backgroundColor: context.responsive(
          null,
          md: Theme.of(context).colorScheme.surface,
        ),
      ),
      Padding(
        padding: context.responsive(
          const EdgeInsets.symmetric(horizontal: 30),
          sm: const EdgeInsets.symmetric(horizontal: 20),
          md: const EdgeInsets.symmetric(horizontal: 15),
          lg: const EdgeInsets.symmetric(horizontal: 80),
        ),
        child: IndexedStack(
          index: stage.code,
          children: const [
            DateTimePanel(),
            ContactPanel(),
            ConfirmationPanel(),
          ],
        ),
      ),
    ];

    return Stack(
      children: [
        ...context.responsive(
          [
            SingleChildScrollView(
              child: Column(
                children: mainBodyChildren +
                    [
                      Padding(
                        padding: context.responsive(
                          const EdgeInsets.symmetric(horizontal: 30),
                          sm: const EdgeInsets.symmetric(horizontal: 20),
                          md: const EdgeInsets.symmetric(horizontal: 15),
                          lg: const EdgeInsets.symmetric(horizontal: 80),
                        ),
                        child: ActionSection(
                          stage: stage,
                          next: () => nextStage(stage),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
              ),
            ),
          ],
          md: mainBodyChildren,
        ),
        context.responsive(
          Container(),
          md: ActionSection(
            stage: stage,
            next: () => nextStage(stage),
          ),
        ),
        if (isLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
      ],
    );
  }
}
