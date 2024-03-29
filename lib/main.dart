import 'package:brando/src/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "1795026430921225",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );

    if (kIsWeb) {
      await dotenv.load(fileName: '.env');

      // Disable the below to access iphone
      // setUrlStrategy(PathUrlStrategy());
    }
  }

  runApp(
    const ProviderScope(
      child: BrandoApp(),
    ),
  );
}
