import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentPage extends ConsumerStatefulWidget {
  const AppointmentPage({super.key});

  @override
  ConsumerState<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends ConsumerState<AppointmentPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (ModalRoute.of(context)!.canPop) {
          final Appointment? appointment = await ref
              .read(appointmentControllerProvider.notifier)
              .currentAppointment();

          if (appointment != null) {
            ref
                .read(appointmentControllerProvider.notifier)
                .localUpdateAppointment(appointment);
          }
        }
      },
    );
  }

  void goToHomePage() {
    Navigator.of(context).pushReplacementNamed(
      AuthScreen.routeName,
      arguments: slideFromLeftTransition,
    );
    ref.read(appointmentControllerProvider.notifier).resetStage();
  }

  Widget Function({
    required String title,
    Function()? leadingFunction,
  }) _buildAppBar() {
    return ({
      required String title,
      Function()? leadingFunction,
    }) {
      return AppBar(
        backgroundColor: context.responsive(
          Theme.of(context).colorScheme.primary,
          md: Colors.transparent,
        ),
        surfaceTintColor: context.responsive(
          Theme.of(context).colorScheme.primary,
          md: Colors.transparent,
        ),
        title: Text(
          context.responsive(
            title,
            md: '',
          ),
          style: GoogleFonts.libreBaskerville(
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
          ),
        ),
        leading: context.responsive(
          const MenuButton(),
          md: leadingFunction != null
              ? IconButton(
                  onPressed: leadingFunction,
                  icon: Transform.translate(
                    offset: const Offset(-1, 0),
                    child: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                )
              : null,
        ),
        actions: [
          context.responsive(
            Container(),
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
        ],
      );

      //   return MyAppBar(
      //     title: context.responsive(
      //       title,
      //       md: '',
      //     ),
      //     leading: context.responsive(
      //       const MenuButton(),
      //       md: leadingFunction != null
      //           ? IconButton(
      //               style: TextButton.styleFrom(padding: EdgeInsets.zero),
      //               onPressed: leadingFunction,
      //               icon: Transform.translate(
      //                 offset: const Offset(-1, 0),
      //                 child: const Icon(Icons.arrow_back_ios_rounded),
      //               ),
      //             )
      //           : null,
      //     ),
      //     trailing: context.responsive(
      //       null,
      //       md: MouseRegion(
      //         cursor: SystemMouseCursors.click,
      //         child: GestureDetector(
      //           onTap: goToHomePage,
      //           child: Icon(
      //             Icons.person_rounded,
      //             color: Theme.of(context).colorScheme.primary,
      //             size: 40,
      //           ),
      //         ),
      //       ),
      //     ),
      //     backgroundColor: context.responsive(
      //       null,
      //       md: Colors.transparent,
      //     ),
      //   );
    };
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
      children: [
        // IndexedStack(
        //   alignment: Alignment.topCenter,
        //   index: stage.code,
        //   children: stages,
        // ),
        stages[stage.code],
        if (isLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
      ],
    );
  }
}
