import 'package:brando/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome to\nMichelle Yuen Jewelry\nBooking System',
              textAlign: TextAlign.center,
              style: GoogleFonts.libreBaskerville(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: AffiliationNote(),
            ),
          ),
        ],
      ),
    );
  }
}
