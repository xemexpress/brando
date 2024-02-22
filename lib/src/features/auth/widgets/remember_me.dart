import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
  });

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  int rememberMe = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          value: 0,
          groupValue: rememberMe,
          toggleable: true,
          visualDensity: VisualDensity.compact,
          onChanged: (_) {
            setState(() {
              rememberMe = (rememberMe == 1 ? 0 : 1);
            });
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          'Remember me',
          style: GoogleFonts.openSans(
            textStyle: Theme.of(context).textTheme.titleSmall,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
