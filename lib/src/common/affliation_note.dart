import 'package:brando/generated/l10n.dart';
import 'package:brando/src/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AffiliationNote extends StatefulWidget {
  const AffiliationNote({
    super.key,
  });

  @override
  State<AffiliationNote> createState() => _AffiliationNoteState();
}

class _AffiliationNoteState extends State<AffiliationNote> {
  void onTap() async {
    final uri = Uri.parse(companyWebsite);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (_) {
      showFeedback(message: 'Could not redirect to $uri. Please contact us.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String localizedNote =
        S.of(context).common_affiliationPoweredBy(companyName);
    final List<String> parts =
        splitWithTargetString(localizedNote, companyName);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.ebGaramond(
          textStyle: context.responsive(
            Theme.of(context).textTheme.labelMedium,
            md: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        children: parts
            .map(
              (part) => TextSpan(
                text: part,
                recognizer: part == companyName
                    ? (TapGestureRecognizer()..onTap = onTap)
                    : null,
              ),
            )
            .toList(),
      ),
    );

    // final Locale currentLocale = Localizations.localeOf(context);
    // print("Current locale: ${currentLocale.toString()}");
    // print("Current countryCode: ${currentLocale.countryCode}");
    // print("Current languageCode: ${currentLocale.languageCode}");
    // print("Current scriptCode: ${currentLocale.scriptCode}");

    /*
      Current locale: zh_Hant_HK
      Current languageCode: zh
      Current countryCode: HK
      Current scriptCode: Hant
    */

    // if (currentLocale.languageCode == 'zh') {
    //   return RichText(
    //     textAlign: TextAlign.center,
    //     text: TextSpan(
    //       style: GoogleFonts.ebGaramond(
    //         textStyle: context.responsive(
    //           Theme.of(context).textTheme.labelMedium,
    //           md: Theme.of(context).textTheme.titleSmall,
    //         ),
    //       ),
    //       children: [
    //         const TextSpan(
    //           text: '由 ',
    //         ),
    //         TextSpan(
    //           text: companyName,
    //           recognizer: TapGestureRecognizer()..onTap = onTap,
    //         ),
    //         const TextSpan(
    //           text: ' 提供技術支持',
    //         ),
    //       ],
    //     ),
    //   );
    // } else {
    //   return RichText(
    //     textAlign: TextAlign.center,
    //     text: TextSpan(
    //       style: GoogleFonts.ebGaramond(
    //         textStyle: context.responsive(
    //           Theme.of(context).textTheme.labelMedium,
    //           md: Theme.of(context).textTheme.titleSmall,
    //         ),
    //       ),
    //       children: [
    //         TextSpan(
    //           text: S.of(context).common_affiliationPoweredBy(companyName),
    //         ),
    //         TextSpan(
    //           text: companyName,
    //           recognizer: TapGestureRecognizer()..onTap = onTap,
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }
}
