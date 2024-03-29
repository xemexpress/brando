// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hant_TW locale. All the
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
  String get localeName => 'zh_Hant_TW';

  static String m0(company) => "由 ${company} 提供技術支持";

  static String m1(error) => "錯誤：${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common_affiliationPoweredBy": m0,
        "common_greetings": MessageLookupByLibrary.simpleMessage(
            "歡迎使用\nMichelle Yuen Jewelry\n預約系統"),
        "common_logoutButton": MessageLookupByLibrary.simpleMessage("登出"),
        "common_myAppointment": MessageLookupByLibrary.simpleMessage("我的預約"),
        "common_title": MessageLookupByLibrary.simpleMessage("預約"),
        "home_appointmentTimeSlot":
            MessageLookupByLibrary.simpleMessage("預約時間段："),
        "home_cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "home_change": MessageLookupByLibrary.simpleMessage("修改"),
        "home_date": MessageLookupByLibrary.simpleMessage("日期"),
        "home_errorMessage": m1,
        "home_makeAnAppointment": MessageLookupByLibrary.simpleMessage("立即預約"),
        "home_personalPanel": MessageLookupByLibrary.simpleMessage("首頁"),
        "home_profile_cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "home_profile_displayNameIsUpdated":
            MessageLookupByLibrary.simpleMessage("顯示名稱已更新！"),
        "home_profile_editDisplayName":
            MessageLookupByLibrary.simpleMessage("編輯顯示名稱"),
        "home_profile_editEmail":
            MessageLookupByLibrary.simpleMessage("修改電子郵件地址"),
        "home_profile_editPassword":
            MessageLookupByLibrary.simpleMessage("修改密碼"),
        "home_profile_editPhoneNumber":
            MessageLookupByLibrary.simpleMessage("修改電話號碼"),
        "home_profile_email": MessageLookupByLibrary.simpleMessage("電子郵件"),
        "home_profile_enterYourNewDisplayNameHint":
            MessageLookupByLibrary.simpleMessage("請輸入您的新顯示名稱"),
        "home_profile_enterYourNewEmailHint":
            MessageLookupByLibrary.simpleMessage("請輸入您的新電子郵件地址"),
        "home_profile_enterYourNewPasswordHint":
            MessageLookupByLibrary.simpleMessage("請輸入您的新密碼"),
        "home_profile_enterYourNewPhoneNumberHint":
            MessageLookupByLibrary.simpleMessage("請輸入您的新電話號碼"),
        "home_profile_enterYourOldPasswordHint":
            MessageLookupByLibrary.simpleMessage("請輸入您的舊密碼"),
        "home_profile_howMayIAddressYou":
            MessageLookupByLibrary.simpleMessage("我們該如何稱呼您？"),
        "home_profile_newPasswordIsTheSame":
            MessageLookupByLibrary.simpleMessage("新密碼與舊密碼相同。"),
        "home_profile_oldPasswordIsInvalid":
            MessageLookupByLibrary.simpleMessage("舊密碼不正確，請重新試一次。"),
        "home_profile_passwordIsTooWeak":
            MessageLookupByLibrary.simpleMessage("密碼強度不足，請重新設定。"),
        "home_profile_passwordIsUpdated":
            MessageLookupByLibrary.simpleMessage("密碼已更新！"),
        "home_profile_phoneNumberNotAvailable":
            MessageLookupByLibrary.simpleMessage("電話號碼暫未登記"),
        "home_profile_pwHidden":
            MessageLookupByLibrary.simpleMessage("密碼：******"),
        "home_profile_submit": MessageLookupByLibrary.simpleMessage("提交"),
        "home_states": MessageLookupByLibrary.simpleMessage("狀態"),
        "home_timeSlot": MessageLookupByLibrary.simpleMessage("時段"),
        "home_youDontHaveAnAppointmentYet":
            MessageLookupByLibrary.simpleMessage("您目前沒有任何預約。"),
        "login_emailHint": MessageLookupByLibrary.simpleMessage("電子郵件"),
        "login_emptyFieldsMessage":
            MessageLookupByLibrary.simpleMessage("請填寫所有字段。"),
        "login_forgotPasswordButton":
            MessageLookupByLibrary.simpleMessage("忘記密碼？"),
        "login_heading": MessageLookupByLibrary.simpleMessage("登入"),
        "login_invalidEmailMessage":
            MessageLookupByLibrary.simpleMessage("電子郵件地址無效，請重新嘗試。"),
        "login_invalidPasswordMessage":
            MessageLookupByLibrary.simpleMessage("密碼無效，請重新嘗試。"),
        "login_loginButton": MessageLookupByLibrary.simpleMessage("登入"),
        "login_networkRequestFailedMessage":
            MessageLookupByLibrary.simpleMessage("網絡請求失敗。請再試一次登入。"),
        "login_passwordHint": MessageLookupByLibrary.simpleMessage("密碼"),
        "login_rememberMeButton": MessageLookupByLibrary.simpleMessage("記住我"),
        "login_thirdPartyLoginIntro":
            MessageLookupByLibrary.simpleMessage("或使用以下方式登入"),
        "login_unknownErrorMessage":
            MessageLookupByLibrary.simpleMessage("發生未知錯誤。請聯絡我們。"),
        "login_userNotLoggedInApple":
            MessageLookupByLibrary.simpleMessage("用戶尚未透過 Apple 登入。"),
        "login_userNotLoggedInFacebook":
            MessageLookupByLibrary.simpleMessage("用戶尚未透過 Facebook 登入。"),
        "login_userNotLoggedInGoogle":
            MessageLookupByLibrary.simpleMessage("用戶尚未透過 Google 登入。")
      };
}
