import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome to\nMichelle Yuen Jewelry\nBooking System',
      textAlign: TextAlign.center,
      style: GoogleFonts.libreBaskerville(
        textStyle: Theme.of(context).textTheme.displaySmall,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
