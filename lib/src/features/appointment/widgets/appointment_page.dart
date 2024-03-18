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

  void goToHomePage() {
    ref.read(appointmentControllerProvider.notifier).resetStage();

    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  Widget Function({required String title, Function()? leadingFunction})
      _buildAppBar() {
    return ({required String title, Function()? leadingFunction}) => MyAppBar(
          title: context.responsive(
            title,
            md: '',
          ),
          leading: context.responsive(
            const MenuButton(),
            md: leadingFunction != null
                ? IconButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: leadingFunction,
                    icon: Transform.translate(
                      offset: const Offset(-1, 0),
                      child: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                  )
                : null,
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
            // md: Theme.of(context).colorScheme.surface,
            md: Colors.transparent,
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
      DateTimePage(appBarBuilder: _buildAppBar()),
      ContactPage(appBarBuilder: _buildAppBar()),
      ConfirmationPage(appBarBuilder: _buildAppBar()),
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
