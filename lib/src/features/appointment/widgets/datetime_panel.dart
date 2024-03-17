import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimePanel extends ConsumerStatefulWidget {
  const DateTimePanel({
    super.key,
  });

  @override
  ConsumerState<DateTimePanel> createState() => _DateTimePanelState();
}

class _DateTimePanelState extends ConsumerState<DateTimePanel> {
  void nextStage() async {
    ref.read(appointmentControllerProvider.notifier).nextStage();
  }

  @override
  Widget build(BuildContext context) {
    Widget button = ActionButton(
      text: 'NEXT',
      next: nextStage,
    );

    List<Widget> mainBodyChildren = context.responsive(
      [
        const DatePicker(),
        const TimeslotPicker(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: button,
        ),
      ],
      md: [
        const Spacer(),
        const DatePicker(),
        const Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const TimeslotPicker(),
            Positioned(
              bottom: -100,
              right: 0,
              child: button,
            ),
          ],
        ),
        const Spacer(),
      ],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          context.responsive(const SizedBox(), md: const SizedBox(height: 110)),
          const MonthDisplay(),
          ...context.responsive(
            mainBodyChildren,
            md: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: mainBodyChildren,
              ),
            ],
          ),
          context.responsive(const SizedBox(), md: const SizedBox(height: 110)),
        ],
      ),
    );
  }
}
