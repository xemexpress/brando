import 'package:brando/generated/l10n.dart';
import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Appointment? myAppointment;

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
              MyAppBar(
                title: context.responsive(
                  S.of(context).home_personalPanel,
                  md: '',
                ),
                leading: context.responsive(
                  const MenuButton(),
                  md: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: logOut,
                    child: Text(
                      S.of(context).common_logoutButton,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                trailing: context.responsive(
                  null,
                  md: Icon(
                    Icons.person_rounded,
                    color: Theme.of(context).colorScheme.surface,
                    size: 40,
                  ),
                ),
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
