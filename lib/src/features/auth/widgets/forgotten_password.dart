import 'package:brando/generated/l10n.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print('Forgotten password');
          FirebaseAnalytics.instance.logEvent(name: 'forgotten_password');
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Text(
              S.of(context).login_forgotPasswordButton,
              style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.labelMedium,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
            Positioned(
              bottom: 1,
              left: 0,
              right: 0,
              child: Container(
                height: 1, // Thickness of the underline
                color: Theme.of(context)
                    .colorScheme
                    .surfaceVariant, // Color of the underline
              ),
            ),
          ],
        ),
      ),
    );
  }
}
