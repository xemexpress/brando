// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD03unNJ-5BXJ-chFnpvOEmdFuKtKYR4xo',
    appId: '1:1063177860443:web:2ecd0bfa411f6b2fcad67e',
    messagingSenderId: '1063177860443',
    projectId: 'michelleyuenjewelry-booking',
    authDomain: 'michelleyuenjewelry-booking.firebaseapp.com',
    storageBucket: 'michelleyuenjewelry-booking.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdnjbYb7p94qA6Fk4EVU0V48zXUQYw-dk',
    appId: '1:1063177860443:android:a38544ccdafefef9cad67e',
    messagingSenderId: '1063177860443',
    projectId: 'michelleyuenjewelry-booking',
    storageBucket: 'michelleyuenjewelry-booking.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBQPaw3RTf4HFG0QYthlRA8j3FbLSqt9I',
    appId: '1:1063177860443:ios:3db2e51021bea220cad67e',
    messagingSenderId: '1063177860443',
    projectId: 'michelleyuenjewelry-booking',
    storageBucket: 'michelleyuenjewelry-booking.appspot.com',
    iosBundleId: 'com.charmnsparkle.brando',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBQPaw3RTf4HFG0QYthlRA8j3FbLSqt9I',
    appId: '1:1063177860443:ios:8b3c5cce496119dacad67e',
    messagingSenderId: '1063177860443',
    projectId: 'michelleyuenjewelry-booking',
    storageBucket: 'michelleyuenjewelry-booking.appspot.com',
    iosBundleId: 'com.charmnsparkle.brando.RunnerTests',
  );
}
