import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/datetime_page.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/cupertino.dart';
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

  Widget _buildAppBar({required String title}) {
    return MyAppBar(
      title: context.responsive(
        title,
        md: '',
      ),
      leading: context.responsive(
        const MenuButton(),
        md: Container(),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppointmentState appointmentState =
        ref.watch(appointmentControllerProvider);

    final BookingStage stage = appointmentState.stage;
    final bool isLoading = appointmentState.isLoading;

    final stages = [
      DateTimePage(appBar: _buildAppBar(title: 'Book your appointment')),
      ContactPage(appBar: _buildAppBar(title: 'You are almost there!')),
      ConfirmationPage(appBar: _buildAppBar(title: 'See you there!')),
    ];

    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: stages[stage.code],
        ),
        if (isLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
      ],
    );
  }
}
