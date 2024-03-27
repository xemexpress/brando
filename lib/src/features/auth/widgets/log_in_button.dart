import 'package:brando/generated/l10n.dart';
import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.onClick,
  });

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius:
                BorderRadius.circular(context.responsive(7, md: 35.0)),
          ),
          alignment: Alignment.center,
          child: Text(
            S.of(context).login_loginButton,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              textStyle: Theme.of(context).textTheme.titleMedium,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
