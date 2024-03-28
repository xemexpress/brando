// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hans locale. All the
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
  String get localeName => 'zh_Hans';

  static String m0(company) => "由 ${company} 提供技術支持";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common_affiliationPoweredBy": m0,
        "common_greetings": MessageLookupByLibrary.simpleMessage(
            "欢迎来到\nMichelle Yuen Jewelry\n预约系统"),
        "common_logoutButton": MessageLookupByLibrary.simpleMessage("登出"),
        "common_title": MessageLookupByLibrary.simpleMessage("预约"),
        "login_emailHint": MessageLookupByLibrary.simpleMessage("电邮"),
        "login_emptyFieldsMessage":
            MessageLookupByLibrary.simpleMessage("请填写所有字段。"),
        "login_forgotPasswordButton":
            MessageLookupByLibrary.simpleMessage("忘记密码？"),
        "login_heading": MessageLookupByLibrary.simpleMessage("登录"),
        "login_invalidEmailMessage":
            MessageLookupByLibrary.simpleMessage("电子邮箱无效，请再试一次。"),
        "login_invalidPasswordMessage":
            MessageLookupByLibrary.simpleMessage("密码无效，请再试一次。"),
        "login_loginButton": MessageLookupByLibrary.simpleMessage("登录"),
        "login_networkRequestFailedMessage":
            MessageLookupByLibrary.simpleMessage("网络请求暂时失败。请尝试重新登录。"),
        "login_passwordHint": MessageLookupByLibrary.simpleMessage("密码"),
        "login_rememberMeButton": MessageLookupByLibrary.simpleMessage("记住我"),
        "login_thirdPartyLoginIntro":
            MessageLookupByLibrary.simpleMessage("或者\n使用以下方式登录"),
        "login_unknownErrorMessage":
            MessageLookupByLibrary.simpleMessage("未知错误。请联系我们。"),
        "login_userNotLoggedInApple":
            MessageLookupByLibrary.simpleMessage("用户未通过 Apple 登录。"),
        "login_userNotLoggedInFacebook":
            MessageLookupByLibrary.simpleMessage("用户未通过 Facebook 登录。"),
        "login_userNotLoggedInGoogle":
            MessageLookupByLibrary.simpleMessage("用户未通过 Google 登录。")
      };
}
