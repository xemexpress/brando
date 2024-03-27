// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Booking`
  String get common_title {
    return Intl.message(
      'Booking',
      name: 'common_title',
      desc: 'The title of the booking system',
      args: [],
    );
  }

  /// `Welcome to\nMichelle Yuen Jewelry\nBooking System`
  String get common_greetings {
    return Intl.message(
      'Welcome to\nMichelle Yuen Jewelry\nBooking System',
      name: 'common_greetings',
      desc: 'The greeting message',
      args: [],
    );
  }

  /// `Powered by {company}`
  String common_affiliationPoweredBy(Object company) {
    return Intl.message(
      'Powered by $company',
      name: 'common_affiliationPoweredBy',
      desc: 'The phrase \'Powered by\' with a placeholder for the company name',
      args: [company],
    );
  }

  /// `Login`
  String get login_heading {
    return Intl.message(
      'Login',
      name: 'login_heading',
      desc: 'The heading for the login form',
      args: [],
    );
  }

  /// `Email`
  String get login_emailHint {
    return Intl.message(
      'Email',
      name: 'login_emailHint',
      desc: 'Hint text inside the email input field on the login screen.',
      args: [],
    );
  }

  /// `Password`
  String get login_passwordHint {
    return Intl.message(
      'Password',
      name: 'login_passwordHint',
      desc: 'Hint text inside the password input field on the login screen.',
      args: [],
    );
  }

  /// `Forgotten password? `
  String get login_forgotPasswordButton {
    return Intl.message(
      'Forgotten password? ',
      name: 'login_forgotPasswordButton',
      desc:
          'Text for the button or link to reset a forgotten password on the login screen.',
      args: [],
    );
  }

  /// `Remember me`
  String get login_rememberMeButton {
    return Intl.message(
      'Remember me',
      name: 'login_rememberMeButton',
      desc:
          'Text for the button or link to remember user\'s password on the login screen.',
      args: [],
    );
  }

  /// `LOGIN`
  String get login_loginButton {
    return Intl.message(
      'LOGIN',
      name: 'login_loginButton',
      desc: 'Text for the button or link to log in on the login screen.',
      args: [],
    );
  }

  /// `or\nlog in with`
  String get login_thirdPartyLoginIntro {
    return Intl.message(
      'or\nlog in with',
      name: 'login_thirdPartyLoginIntro',
      desc: 'Text for introducing 3rd party log-in method on the login screen.',
      args: [],
    );
  }

  /// `Please fill in all fields.`
  String get login_emptyFieldsMessage {
    return Intl.message(
      'Please fill in all fields.',
      name: 'login_emptyFieldsMessage',
      desc:
          'Message displayed when the user attempts to log in without filling in all the required fields.',
      args: [],
    );
  }

  /// `Invalid email. Please try again.`
  String get login_invalidEmailMessage {
    return Intl.message(
      'Invalid email. Please try again.',
      name: 'login_invalidEmailMessage',
      desc:
          'Displayed when the user enters an invalid email format and is prompted to try again.',
      args: [],
    );
  }

  /// `Invalid password. Please try again.`
  String get login_invalidPasswordMessage {
    return Intl.message(
      'Invalid password. Please try again.',
      name: 'login_invalidPasswordMessage',
      desc:
          'Shown to the user when they enter an invalid password and are prompted to try again.',
      args: [],
    );
  }

  /// `Network request temporarily failed. Please try logging in again.`
  String get login_networkRequestFailedMessage {
    return Intl.message(
      'Network request temporarily failed. Please try logging in again.',
      name: 'login_networkRequestFailedMessage',
      desc:
          'Shown when a network request fails temporarily and the user is advised to try logging in again.',
      args: [],
    );
  }

  /// `User not logged in via Facebook`
  String get login_userNotLoggedInFacebook {
    return Intl.message(
      'User not logged in via Facebook',
      name: 'login_userNotLoggedInFacebook',
      desc:
          'Message indicating the user has not logged in using their Facebook account.',
      args: [],
    );
  }

  /// `User not logged in via Google.`
  String get login_userNotLoggedInGoogle {
    return Intl.message(
      'User not logged in via Google.',
      name: 'login_userNotLoggedInGoogle',
      desc:
          'Message indicating the user has not logged in using their Google account.',
      args: [],
    );
  }

  /// `User not logged in via Apple`
  String get login_userNotLoggedInApple {
    return Intl.message(
      'User not logged in via Apple',
      name: 'login_userNotLoggedInApple',
      desc:
          'Message indicating the user has not logged in using their Apple account.',
      args: [],
    );
  }

  /// `Unknown Error. Please contact us.`
  String get login_unknownErrorMessage {
    return Intl.message(
      'Unknown Error. Please contact us.',
      name: 'login_unknownErrorMessage',
      desc:
          'Shown when an unknown error occurs, advising the user to contact support.',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'),
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
