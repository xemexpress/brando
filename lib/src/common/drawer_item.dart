import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.onTap,
    this.leading,
    this.title,
  });

  final String? title;
  final Widget? leading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title != null
          ? Text(
              title ?? '',
              style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.titleLarge,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}
