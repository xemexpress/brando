import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      leftSide: const WelcomeSign(),
      rightSide: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
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
          actions: [
            Icon(
              Icons.person_rounded,
              color: Theme.of(context).colorScheme.surface,
              size: 40,
            ),
          ],
        ),
        body: Padding(
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
              const AppointmentTimeSlot(),
            ],
          ),
        ),
      ),
    );
  }
}
