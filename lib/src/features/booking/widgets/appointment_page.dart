import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/booking/controllers/controllers.dart';
import 'package:brando/src/features/booking/widgets/widgets.dart';
import 'package:brando/src/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentPage extends ConsumerWidget {
  const AppointmentPage({
    super.key,
  });

  void nextStage(WidgetRef ref) {
    ref.read(bookingProvider.notifier).nextStage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int stage = ref.watch(bookingProvider).stage;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        MyAppBar(
          leading: IconButton(
            onPressed: () {
              if (stage == 0) {
                Navigator.of(context).pushReplacement(HomeScreen.route());
              } else {
                ref.read(bookingProvider.notifier).previousStage();
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          trailing: Icon(
            Icons.person_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 40,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Center(
            child: IndexedStack(
              index: stage,
              // index: 1,
              children: const [
                DateTimePanel(),
                ContactPanel(),
                ConfirmationPanel(),
              ],
            ),
          ),
        ),
        if (stage < 2)
          Positioned(
            bottom: 40,
            right: 90,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => nextStage(ref),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 270,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    stage == 0
                        ? 'NEXT'
                        : stage == 1
                            ? 'CONFIRM'
                            : '',
                  ),
                ),
              ),
            ),
          ),
        if (stage == 2)
          const Positioned(
            bottom: 40,
            child: Text('change time'),
          ),
      ],
    );
  }
}
