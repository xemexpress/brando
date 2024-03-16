import 'package:brando/src/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AffiliationNote extends StatelessWidget {
  const AffiliationNote({
    super.key,
  });

  void onTap() async {
    final uri = Uri.parse('https://michelleyuenjewelry.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Handle the case where the link can't be launched
      print('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Powered by ',
        style: GoogleFonts.ebGaramond(
          textStyle: context.responsive(
            Theme.of(context).textTheme.labelMedium,
            md: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        children: [
          TextSpan(
            text: 'Michelle Yuen Jewelry',
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      // 'Powered by Michelle Yuen Jewelry',
      // style: GoogleFonts.ebGaramond(
      //   textStyle: Theme.of(context).textTheme.titleSmall,
      // ),
    );
  }
}
