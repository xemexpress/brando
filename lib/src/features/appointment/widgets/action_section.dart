import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionSection extends ConsumerWidget {
  const ActionSection({super.key, required this.stage, required this.next});

  final BookingStage stage;
  final Function()? next;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (stage) {
      case BookingStage.datetime:
      case BookingStage.contact:
        final String text = stage == BookingStage.datetime ? 'NEXT' : 'CONFIRM';

        return Positioned(
          bottom: 40,
          right: 90,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: next,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 270,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(text),
              ),
            ),
          ),
        );
      case BookingStage.confirmation:
        return Positioned(
          bottom: 40,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () =>
                  ref.read(appointmentControllerProvider.notifier).nextStage(),
              child: Text(
                'change time',
                style: GoogleFonts.libreBaskerville(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.underline,
                  letterSpacing: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
          ),
        );
    }
  }
}
