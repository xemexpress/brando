// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// void configureApp() {
//   if (kIsWeb) {
//     // Web-specific configuration (import libraries, set strategies, initialize plugins)
//     // import 'package:flutter_dotenv/flutter_dotenv.dart';
//     // import 'package:flutter_web_plugins/flutter_web_plugins.dart';
//     // import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

//     setUrlStrategy(PathUrlStrategy());
//     dotenv.load(fileName: '.env');

//     // Initialize the facebook javascript SDK
//   } else {
//     // Potentially mobile-specific configuration if needed
//   }
//   FacebookAuth.i.webAndDesktopInitialize(
//     appId: "1795026430921225",
//     cookie: true,
//     xfbml: true,
//     version: "v15.0",
//   );
// }
