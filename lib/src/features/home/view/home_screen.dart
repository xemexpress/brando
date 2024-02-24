import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logOut() {
    print('Log out');
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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile info
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile picture
                  const CircleAvatar(
                    radius: 40,
                    // backgroundImage: NetworkImage(
                    //   'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                    // ),
                    child: Icon(Icons.person_rounded, size: 60),
                  ),

                  const SizedBox(width: 20),
                  // Profile name
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowAndEdit(
                        displayText: 'Mary Cheung',
                        onEdit: () {},
                      ),
                      ShowAndEdit(
                        displayText: 'marycheung19950924@hotmail.com',
                        onEdit: () {},
                      ),
                      ShowAndEdit(
                        displayText: '57372948',
                        onEdit: () {},
                      ),
                      ShowAndEdit(
                        displayText: 'pw: ******',
                        onEdit: () {},
                      ),
                    ],
                  ),
                ],
              ),

              // Appointment Table

              const SizedBox(height: 50),
              // Appointment time slot
              Text(
                'Appointment time slot:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const AppointmentTimeSlot(),
            ],
          ),
        ),
      ),
    );
  }
}
