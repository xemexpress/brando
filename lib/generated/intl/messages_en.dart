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

  static String m1(error) => "Error: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common_affiliationPoweredBy": m0,
        "common_greetings": MessageLookupByLibrary.simpleMessage(
            "Welcome to\nMichelle Yuen Jewelry\nBooking System"),
        "common_locale": MessageLookupByLibrary.simpleMessage("en"),
        "common_logoutButton": MessageLookupByLibrary.simpleMessage("Log out"),
        "common_myAppointment":
            MessageLookupByLibrary.simpleMessage("My appointment"),
        "common_title": MessageLookupByLibrary.simpleMessage("Booking"),
        "home_appointmentTimeSlot":
            MessageLookupByLibrary.simpleMessage("Appointment time slot:"),
        "home_cancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "home_change": MessageLookupByLibrary.simpleMessage("change"),
        "home_date": MessageLookupByLibrary.simpleMessage("Date"),
        "home_errorMessage": m1,
        "home_makeAnAppointment":
            MessageLookupByLibrary.simpleMessage("make an appointment"),
        "home_personalPanel":
            MessageLookupByLibrary.simpleMessage("Personal Panel"),
        "home_profile_cancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "home_profile_contactNumberIsUpdated":
            MessageLookupByLibrary.simpleMessage("Contact number is updated!"),
        "home_profile_displayNameIsUpdated":
            MessageLookupByLibrary.simpleMessage("Display name is updated!"),
        "home_profile_editDisplayName":
            MessageLookupByLibrary.simpleMessage("Edit Display Name"),
        "home_profile_editEmail":
            MessageLookupByLibrary.simpleMessage("Edit Email"),
        "home_profile_editPassword":
            MessageLookupByLibrary.simpleMessage("Edit Password"),
        "home_profile_editPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Edit Phone Number"),
        "home_profile_email": MessageLookupByLibrary.simpleMessage("Email"),
        "home_profile_enterYourNewDisplayNameHint":
            MessageLookupByLibrary.simpleMessage("Enter your new display name"),
        "home_profile_enterYourNewEmailHint":
            MessageLookupByLibrary.simpleMessage("Enter your new email"),
        "home_profile_enterYourNewPasswordHint":
            MessageLookupByLibrary.simpleMessage("Enter your new password"),
        "home_profile_enterYourNewPhoneNumberHint":
            MessageLookupByLibrary.simpleMessage("Enter your new phone number"),
        "home_profile_enterYourOldPasswordHint":
            MessageLookupByLibrary.simpleMessage("Enter your old password"),
        "home_profile_howMayIAddressYou":
            MessageLookupByLibrary.simpleMessage("How may I address you?"),
        "home_profile_newPasswordIsTheSame":
            MessageLookupByLibrary.simpleMessage(
                "New password is the same as the old password."),
        "home_profile_oldPasswordIsInvalid":
            MessageLookupByLibrary.simpleMessage(
                "Old password is invalid. Please try again."),
        "home_profile_passwordIsTooWeak": MessageLookupByLibrary.simpleMessage(
            "Password is too weak. Please try again."),
        "home_profile_passwordIsUpdated":
            MessageLookupByLibrary.simpleMessage("Password is updated!"),
        "home_profile_phoneNumberNotAvailable":
            MessageLookupByLibrary.simpleMessage("Phone number not available"),
        "home_profile_pwHidden":
            MessageLookupByLibrary.simpleMessage("pw: ******"),
        "home_profile_submit": MessageLookupByLibrary.simpleMessage("submit"),
        "home_states": MessageLookupByLibrary.simpleMessage("States"),
        "home_timeSlot": MessageLookupByLibrary.simpleMessage("Time Slot"),
        "home_youDontHaveAnAppointmentYet":
            MessageLookupByLibrary.simpleMessage(
                "you don\'t have an appointment yet."),
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
