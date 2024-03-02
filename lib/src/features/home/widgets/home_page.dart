import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:brando/src/models/time_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
    // Create a sample date (today's date)
    final DateTime appointmentDate = DateTime.now();

    // Create a start time (e.g., 2 hours from now)
    final DateTime appointmentStartTime =
        DateTime.now().add(const Duration(hours: 2));

    // Create an end time (e.g., 30 minutes after the start time)
    final DateTime appointmentEndTime =
        appointmentStartTime.add(const Duration(minutes: 30));

    // Create the Appointment object
    final Appointment myAppointment = Appointment(
      userId: ref.watch(authControllerProvider.notifier).currentUser!.id,
      date: appointmentDate,
      startTime: appointmentStartTime,
      endTime: appointmentEndTime,
    );

    return Column(
      children: [
        //  AppBar(
        //     backgroundColor:
        //         getCompensatedColor(Theme.of(context).colorScheme.primary)
        //             .withOpacity(0.5),
        //     leadingWidth: 80,
        //     leading: TextButton(
        //       style: TextButton.styleFrom(padding: EdgeInsets.zero),
        //       onPressed: logOut,
        //       child: Text(
        //         'Log Out',
        //         style: Theme.of(context).textTheme.labelLarge!.copyWith(
        //               color: Theme.of(context).colorScheme.onPrimary,
        //               fontWeight: FontWeight.bold,
        //             ),
        //       ),
        //     ),
        //     actions: [
        //       Icon(
        //         Icons.person_rounded,
        //         color: Theme.of(context).colorScheme.surface,
        //         size: 40,
        //       ),
        //     ],
        //   ),
        MyAppBar(
          leading: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: logOut,
            child: Text(
              'Log Out',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          trailing: Icon(
            Icons.person_rounded,
            color: Theme.of(context).colorScheme.surface,
            size: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile info
              ProfilePanel(),
              const SizedBox(height: 50),

              // Appointment Table
              Text(
                'Appointment time slot:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              AppointmentTimeSlot(
                  // appointment: myAppointment,
                  ),
            ],
          ),
        )
      ],
    );
  }
}
