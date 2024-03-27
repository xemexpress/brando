// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hant_HK locale. All the
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
  String get localeName => 'zh_Hant_HK';

  static String m0(company) => "由 ${company} 提供技術支援";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common_affiliationPoweredBy": m0,
        "common_greetings": MessageLookupByLibrary.simpleMessage(
            "歡迎來到\nMichelle Yuen Jewelry\n預約系統"),
        "common_title": MessageLookupByLibrary.simpleMessage("預約"),
        "login_emailHint": MessageLookupByLibrary.simpleMessage("電郵"),
        "login_emptyFieldsMessage":
            MessageLookupByLibrary.simpleMessage("請填寫所有欄位。"),
        "login_forgotPasswordButton":
            MessageLookupByLibrary.simpleMessage("忘記密碼？"),
        "login_heading": MessageLookupByLibrary.simpleMessage("登入"),
        "login_invalidEmailMessage":
            MessageLookupByLibrary.simpleMessage("無效的電子郵件地址，請再試一次。"),
        "login_invalidPasswordMessage":
            MessageLookupByLibrary.simpleMessage("無效的密碼，請再試一次。"),
        "login_loginButton": MessageLookupByLibrary.simpleMessage("登入"),
        "login_networkRequestFailedMessage":
            MessageLookupByLibrary.simpleMessage("網絡請求暫時失敗。請嘗試重新登入。"),
        "login_passwordHint": MessageLookupByLibrary.simpleMessage("密碼"),
        "login_rememberMeButton": MessageLookupByLibrary.simpleMessage("記住我"),
        "login_thirdPartyLoginIntro":
            MessageLookupByLibrary.simpleMessage("或者\n使用以下方式登入"),
        "login_unknownErrorMessage":
            MessageLookupByLibrary.simpleMessage("未知錯誤。請聯繫我們。"),
        "login_userNotLoggedInApple":
            MessageLookupByLibrary.simpleMessage("用戶未通過 Apple 登入。"),
        "login_userNotLoggedInFacebook":
            MessageLookupByLibrary.simpleMessage("用戶未通過 Facebook 登入。"),
        "login_userNotLoggedInGoogle":
            MessageLookupByLibrary.simpleMessage("用戶未通過 Google 登入。")
      };
}
