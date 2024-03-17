import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.leading,
    this.trailing,
    this.backgroundColor,
  });

  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: backgroundColor ??
            getCompensatedColor(Theme.of(context).colorScheme.primary)
                .withOpacity(0.5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading ?? Container(),
              trailing ?? Container(),
            ],
          ),
          if (title != null)
            Text(
              title!,
              style: GoogleFonts.libreBaskerville(
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
