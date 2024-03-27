import 'package:brando/generated/l10n.dart';
import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).common_greetings,
      textAlign: TextAlign.center,
      style: GoogleFonts.libreBaskerville(
        textStyle: context.responsive(
          Theme.of(context).textTheme.titleLarge,
          md: Theme.of(context).textTheme.displaySmall!.copyWith(height: 1.5),
        ),
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
