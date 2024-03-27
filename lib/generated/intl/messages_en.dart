// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(company) => "Powered by ${company}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common_affiliationPoweredBy": m0,
        "common_greetings": MessageLookupByLibrary.simpleMessage(
            "Welcome to\nMichelle Yuen Jewelry\nBooking System"),
        "common_title": MessageLookupByLibrary.simpleMessage("Booking"),
        "login_emailHint": MessageLookupByLibrary.simpleMessage("Email"),
        "login_emptyFieldsMessage":
            MessageLookupByLibrary.simpleMessage("Please fill in all fields."),
        "login_forgotPasswordButton":
            MessageLookupByLibrary.simpleMessage("Forgotten password? "),
        "login_heading": MessageLookupByLibrary.simpleMessage("Login"),
        "login_invalidEmailMessage": MessageLookupByLibrary.simpleMessage(
            "Invalid email. Please try again."),
        "login_invalidPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Invalid password. Please try again."),
        "login_loginButton": MessageLookupByLibrary.simpleMessage("LOGIN"),
        "login_networkRequestFailedMessage": MessageLookupByLibrary.simpleMessage(
            "Network request temporarily failed. Please try logging in again."),
        "login_passwordHint": MessageLookupByLibrary.simpleMessage("Password"),
        "login_rememberMeButton":
            MessageLookupByLibrary.simpleMessage("Remember me"),
        "login_thirdPartyLoginIntro":
            MessageLookupByLibrary.simpleMessage("or\nlog in with"),
        "login_unknownErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Unknown Error. Please contact us."),
        "login_userNotLoggedInApple": MessageLookupByLibrary.simpleMessage(
            "User not logged in via Apple"),
        "login_userNotLoggedInFacebook": MessageLookupByLibrary.simpleMessage(
            "User not logged in via Facebook"),
        "login_userNotLoggedInGoogle": MessageLookupByLibrary.simpleMessage(
            "User not logged in via Google.")
      };
}
