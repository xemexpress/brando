import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeTimeButton extends ConsumerWidget {
  const ChangeTimeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () =>
            ref.read(appointmentControllerProvider.notifier).nextStage(),
        child: Text(
          'change time',
          style: GoogleFonts.libreBaskerville(
            textStyle: context.responsive(
              Theme.of(context).textTheme.labelSmall,
              md: Theme.of(context).textTheme.labelLarge,
            ),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
            decoration: TextDecoration.underline,
            letterSpacing: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
    );
  }
}
