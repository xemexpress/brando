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

  /// `Log out`
  String get common_logoutButton {
    return Intl.message(
      'Log out',
      name: 'common_logoutButton',
      desc: 'Text for the button or link to log out of the booking system.',
      args: [],
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

  /// `Personal Panel`
  String get home_personalPanel {
    return Intl.message(
      'Personal Panel',
      name: 'home_personalPanel',
      desc:
          'Title in the mobile version for the user\'s home screen that represents the personal panel or dashboard.',
      args: [],
    );
  }

  /// `How may I address you?`
  String get home_profile_howMayIAddressYou {
    return Intl.message(
      'How may I address you?',
      name: 'home_profile_howMayIAddressYou',
      desc:
          'Prompt asking for the preferred name or title for the user who not yet has their display name on the home profile screen.',
      args: [],
    );
  }

  /// `Email`
  String get home_profile_email {
    return Intl.message(
      'Email',
      name: 'home_profile_email',
      desc: 'Label for the email field on the home profile screen.',
      args: [],
    );
  }

  /// `Phone number not available`
  String get home_profile_phoneNumberNotAvailable {
    return Intl.message(
      'Phone number not available',
      name: 'home_profile_phoneNumberNotAvailable',
      desc:
          'Message displayed when the user\'s phone number is not available on the home profile screen.',
      args: [],
    );
  }

  /// `pw: ******`
  String get home_profile_pwHidden {
    return Intl.message(
      'pw: ******',
      name: 'home_profile_pwHidden',
      desc: 'Shows the password in a hidden format on the home profile screen.',
      args: [],
    );
  }

  /// `cancel`
  String get home_profile_cancel {
    return Intl.message(
      'cancel',
      name: 'home_profile_cancel',
      desc: 'Button text for canceling an action on the profile screen.',
      args: [],
    );
  }

  /// `submit`
  String get home_profile_submit {
    return Intl.message(
      'submit',
      name: 'home_profile_submit',
      desc: 'Button text for submitting changes on the profile screen.',
      args: [],
    );
  }

  /// `Edit Display Name`
  String get home_profile_editDisplayName {
    return Intl.message(
      'Edit Display Name',
      name: 'home_profile_editDisplayName',
      desc:
          'Dialog title for editing the display name on the home profile screen.',
      args: [],
    );
  }

  /// `Enter your new display name`
  String get home_profile_enterYourNewDisplayNameHint {
    return Intl.message(
      'Enter your new display name',
      name: 'home_profile_enterYourNewDisplayNameHint',
      desc:
          'Hint text for entering a new display name on the home profile screen.',
      args: [],
    );
  }

  /// `Edit Email`
  String get home_profile_editEmail {
    return Intl.message(
      'Edit Email',
      name: 'home_profile_editEmail',
      desc: 'Dialog title for editing email on the home profile screen.',
      args: [],
    );
  }

  /// `Enter your new email`
  String get home_profile_enterYourNewEmailHint {
    return Intl.message(
      'Enter your new email',
      name: 'home_profile_enterYourNewEmailHint',
      desc: 'Hint text for entering a new email on the home profile screen.',
      args: [],
    );
  }

  /// `Edit Phone Number`
  String get home_profile_editPhoneNumber {
    return Intl.message(
      'Edit Phone Number',
      name: 'home_profile_editPhoneNumber',
      desc:
          'Dialog title for editing the phone number on the home profile screen.',
      args: [],
    );
  }

  /// `Enter your new phone number`
  String get home_profile_enterYourNewPhoneNumberHint {
    return Intl.message(
      'Enter your new phone number',
      name: 'home_profile_enterYourNewPhoneNumberHint',
      desc:
          'Hint text for entering a new phone number on the home profile screen.',
      args: [],
    );
  }

  /// `Edit Password`
  String get home_profile_editPassword {
    return Intl.message(
      'Edit Password',
      name: 'home_profile_editPassword',
      desc: 'Dialog title for editing the password on the home profile screen.',
      args: [],
    );
  }

  /// `Enter your old password`
  String get home_profile_enterYourOldPasswordHint {
    return Intl.message(
      'Enter your old password',
      name: 'home_profile_enterYourOldPasswordHint',
      desc:
          'Hint text for entering the old password on the home profile screen.',
      args: [],
    );
  }

  /// `Enter your new password`
  String get home_profile_enterYourNewPasswordHint {
    return Intl.message(
      'Enter your new password',
      name: 'home_profile_enterYourNewPasswordHint',
      desc: 'Hint text for entering a new password on the home profile screen.',
      args: [],
    );
  }

  /// `Display name is updated!`
  String get home_profile_displayNameIsUpdated {
    return Intl.message(
      'Display name is updated!',
      name: 'home_profile_displayNameIsUpdated',
      desc:
          'Success message for updated display name on the home profile screen.',
      args: [],
    );
  }

  /// `New password is the same as the old password.`
  String get home_profile_newPasswordIsTheSame {
    return Intl.message(
      'New password is the same as the old password.',
      name: 'home_profile_newPasswordIsTheSame',
      desc:
          'Error message when the new password entered is the same as the old one on the home profile screen.',
      args: [],
    );
  }

  /// `Password is updated!`
  String get home_profile_passwordIsUpdated {
    return Intl.message(
      'Password is updated!',
      name: 'home_profile_passwordIsUpdated',
      desc: 'Success message for updated password on the home profile screen.',
      args: [],
    );
  }

  /// `Old password is invalid. Please try again.`
  String get home_profile_oldPasswordIsInvalid {
    return Intl.message(
      'Old password is invalid. Please try again.',
      name: 'home_profile_oldPasswordIsInvalid',
      desc:
          'Error message when the old password entered is invalid on the home profile screen.',
      args: [],
    );
  }

  /// `Password is too weak. Please try again.`
  String get home_profile_passwordIsTooWeak {
    return Intl.message(
      'Password is too weak. Please try again.',
      name: 'home_profile_passwordIsTooWeak',
      desc: 'Error message for a weak password on the home profile screen.',
      args: [],
    );
  }

  /// `Appointment time slot:`
  String get home_appointmentTimeSlot {
    return Intl.message(
      'Appointment time slot:',
      name: 'home_appointmentTimeSlot',
      desc: 'Label for displaying the appointment time slot.',
      args: [],
    );
  }

  /// `Date`
  String get home_date {
    return Intl.message(
      'Date',
      name: 'home_date',
      desc: 'Label for displaying the date of the appointment.',
      args: [],
    );
  }

  /// `Time Slot`
  String get home_timeSlot {
    return Intl.message(
      'Time Slot',
      name: 'home_timeSlot',
      desc: 'Label for displaying available time slots for appointments.',
      args: [],
    );
  }

  /// `States`
  String get home_states {
    return Intl.message(
      'States',
      name: 'home_states',
      desc:
          'Label for displaying the states or statuses of appointments or processes.',
      args: [],
    );
  }

  /// `change`
  String get home_change {
    return Intl.message(
      'change',
      name: 'home_change',
      desc: 'Button text for changing the details of an existing appointment.',
      args: [],
    );
  }

  /// `cancel`
  String get home_cancel {
    return Intl.message(
      'cancel',
      name: 'home_cancel',
      desc: 'Button text for cancelling an action or appointment.',
      args: [],
    );
  }

  /// `you don't have an appointment yet.`
  String get home_youDontHaveAnAppointmentYet {
    return Intl.message(
      'you don\'t have an appointment yet.',
      name: 'home_youDontHaveAnAppointmentYet',
      desc: 'Message displayed when the user has no appointments.',
      args: [],
    );
  }

  /// `make an appointment`
  String get home_makeAnAppointment {
    return Intl.message(
      'make an appointment',
      name: 'home_makeAnAppointment',
      desc:
          'Button or link text for initiating the appointment booking process.',
      args: [],
    );
  }

  /// `Error: {error}`
  String home_errorMessage(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'home_errorMessage',
      desc: 'Displays an error message with a dynamic error content.',
      args: [error],
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
