import 'package:brando/generated/l10n.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/views/booking_screen.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandoApp extends ConsumerStatefulWidget {
  const BrandoApp({
    super.key,
  });

  @override
  ConsumerState<BrandoApp> createState() => _BrandoAppState();
}

class _BrandoAppState extends ConsumerState<BrandoApp>
    with WidgetsBindingObserver {
  late final WidgetsBinding _widgetsBinding;

  @override
  void initState() {
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    _widgetsBinding.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness = _widgetsBinding.platformDispatcher.platformBrightness;

    ref
        .read(themeControllerProvider.notifier)
        .changeBrightness(brightness: brightness);

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeControllerProvider);

    return MaterialApp(
      onGenerateTitle: (context) => '${S.current.common_title} | $companyName',
      // onGenerateTitle: (context) {
      //   final Locale myLocale = Localizations.localeOf(context);
      //   print("Current Locale: ${myLocale.toString()}");
      //   print('test: ${S.current.common_title}');
      //   return '${S.current.common_title} | Michelle Yuen Jewelry';
      // },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.currentTheme(
        brightness: themeState.appBrightness,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // localeListResolutionCallback: (locales, supportedLocales) {
      //   // Iterate through the preferred locales from the device
      //   for (Locale locale in locales!) {
      //     // Check if we support the locale
      //     for (Locale supportedLocale in supportedLocales) {
      //       if (supportedLocale.languageCode == locale.languageCode &&
      //           supportedLocale.countryCode == locale.countryCode) {
      //         return supportedLocale;
      //       }
      //     }
      //     // If a match wasn't found with country code, try matching just the language code
      //     for (Locale supportedLocale in supportedLocales) {
      //       if (supportedLocale.languageCode == locale.languageCode) {
      //         return supportedLocale;
      //       }
      //     }
      //   }
      //   // If no match is found, fall back to the first supportedLocale
      //   // You can change this to any default Locale you prefer
      //   return supportedLocales.first;
      // },
      initialRoute: AuthScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AuthScreen.routeName:
            return slideFromLeftTransition(
              const AuthScreen(),
            );
          case BookingScreen.routeName:
            return slideFromRightTransition(
              const BookingScreen(),
            );
          default:
            return null;
        }
      },
    );
  }
}
