import 'package:brando/generated/l10n.dart';
import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Appointment? myAppointment;

  List<PopupMenuEntry<String>> _buildMenuItems(BuildContext context) {
    // Check if the current route is not the AuthScreen route
    bool isNotAuthScreen =
        ModalRoute.of(context)?.settings.name != AuthScreen.routeName;

    // Always include the 'Log Out' option
    List<PopupMenuEntry<String>> menuItems = [
      const PopupMenuItem<String>(
        value: 'logout',
        child: Text('Log Out'),
      ),
    ];

    // If it's not the AuthScreen, include the 'Home' option at the beginning
    if (isNotAuthScreen) {
      menuItems.insert(
        0,
        const PopupMenuItem<String>(
          value: AuthScreen.routeName,
          child: Text('Home'),
        ),
      );
    }

    return menuItems;
  }

  void goToHomePage() {
    if (ModalRoute.of(context)?.settings.name != AuthScreen.routeName) {
      Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    }
  }

  void logOut() async {
    try {
      await ref.read(authControllerProvider.notifier).signOut();
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    } catch (e) {
      showFeedback(message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isAuthLoading = ref.watch(authControllerProvider);
    final bool isAppointmentLoading =
        ref.watch(appointmentControllerProvider).isLoading;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor:
                    getCompensatedColor(Theme.of(context).colorScheme.primary)
                        .withOpacity(0.5),
                title: Text(
                  context.responsive(
                    S.of(context).home_personalPanel,
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
                leadingWidth: 70,
                leading: context.responsive(
                  const MenuButton(),
                  md: const SizedBox(),
                  // md: Container(
                  //   alignment: Alignment.centerLeft,
                  //   padding: const EdgeInsets.only(left: 15.0),
                  //   child: MouseRegion(
                  //     cursor: SystemMouseCursors.click,
                  //     child: GestureDetector(
                  //       onTap: logOut,
                  //       child: Text(
                  //         S.of(context).common_logoutButton,
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .labelLarge!
                  //             .copyWith(
                  //               color: Theme.of(context).colorScheme.onPrimary,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //         textAlign: TextAlign.left,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
                actions: [
                  context.responsive(
                    const SizedBox(),
                    md: Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: PopupMenuButton<String>(
                        tooltip: 'Menu',
                        padding: const EdgeInsets.all(4),
                        icon: Icon(
                          Icons.person_rounded,
                          color: Theme.of(context).colorScheme.surface,
                          size: 40,
                        ),
                        onSelected: (String value) {
                          if (value == 'logout') {
                            logOut();
                          } else if (value == AuthScreen.routeName) {
                            goToHomePage();
                          }
                        },
                        offset: const Offset(0, 57),
                        itemBuilder: (BuildContext context) =>
                            _buildMenuItems(context),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: context.responsive(
                    20,
                    md: 50.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile info
                    const ProfilePanel(),
                    const SizedBox(height: 50),

                    // Appointment Table
                    Text(
                      S.of(context).home_appointmentTimeSlot,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    const AppointmentTimeSlot(),
                    // const Row(),
                  ],
                ),
              )
            ],
          ),
        ),
        if (isAuthLoading || isAppointmentLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
      ],
    );
  }
}
