import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void logOut(WidgetRef ref) async {
    print('3');
    await ref.read(authControllerProvider.notifier).signOut();
    print('4');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('1');
    final isLoading = ref.watch(authControllerProvider);
    print('2');
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leadingWidth: 80,
            leading: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => logOut(ref),
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
        if (isLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
      ],
    );
  }
}
