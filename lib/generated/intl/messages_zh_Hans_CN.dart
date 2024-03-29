// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hans_CN locale. All the
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
  String get localeName => 'zh_Hans_CN';

  static String m0(company) => "由 ${company} 提供技術支持";

  static String m1(error) => "出错了：${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "common_affiliationPoweredBy": m0,
        "common_greetings": MessageLookupByLibrary.simpleMessage(
            "欢迎来到\nMichelle Yuen Jewelry\n预约系统"),
        "common_logoutButton": MessageLookupByLibrary.simpleMessage("登出"),
        "common_myAppointment": MessageLookupByLibrary.simpleMessage("我的预约"),
        "common_title": MessageLookupByLibrary.simpleMessage("预约"),
        "home_appointmentTimeSlot":
            MessageLookupByLibrary.simpleMessage("预约时间段："),
        "home_cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "home_change": MessageLookupByLibrary.simpleMessage("修改"),
        "home_date": MessageLookupByLibrary.simpleMessage("日期"),
        "home_errorMessage": m1,
        "home_makeAnAppointment": MessageLookupByLibrary.simpleMessage("立即预约"),
        "home_personalPanel": MessageLookupByLibrary.simpleMessage("主页"),
        "home_profile_cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "home_profile_displayNameIsUpdated":
            MessageLookupByLibrary.simpleMessage("昵称已更新！"),
        "home_profile_editDisplayName":
            MessageLookupByLibrary.simpleMessage("编辑昵称"),
        "home_profile_editEmail":
            MessageLookupByLibrary.simpleMessage("修改电子邮件"),
        "home_profile_editPassword":
            MessageLookupByLibrary.simpleMessage("修改密码"),
        "home_profile_editPhoneNumber":
            MessageLookupByLibrary.simpleMessage("修改电话号码"),
        "home_profile_email": MessageLookupByLibrary.simpleMessage("电子邮件"),
        "home_profile_enterYourNewDisplayNameHint":
            MessageLookupByLibrary.simpleMessage("请输入您的新昵称"),
        "home_profile_enterYourNewEmailHint":
            MessageLookupByLibrary.simpleMessage("请输入您的新电子邮件地址"),
        "home_profile_enterYourNewPasswordHint":
            MessageLookupByLibrary.simpleMessage("请输入您的新密码"),
        "home_profile_enterYourNewPhoneNumberHint":
            MessageLookupByLibrary.simpleMessage("请输入您的新电话号码"),
        "home_profile_enterYourOldPasswordHint":
            MessageLookupByLibrary.simpleMessage("请输入您的旧密码"),
        "home_profile_howMayIAddressYou":
            MessageLookupByLibrary.simpleMessage("我们应如何称呼您？"),
        "home_profile_newPasswordIsTheSame":
            MessageLookupByLibrary.simpleMessage("新密码不能与旧密码相同。"),
        "home_profile_oldPasswordIsInvalid":
            MessageLookupByLibrary.simpleMessage("旧密码错误，请重试。"),
        "home_profile_passwordIsTooWeak":
            MessageLookupByLibrary.simpleMessage("密码强度过低，请重新设置。"),
        "home_profile_passwordIsUpdated":
            MessageLookupByLibrary.simpleMessage("密码已成功更新！"),
        "home_profile_phoneNumberNotAvailable":
            MessageLookupByLibrary.simpleMessage("电话号码暂未注册"),
        "home_profile_pwHidden":
            MessageLookupByLibrary.simpleMessage("密码: ******"),
        "home_profile_submit": MessageLookupByLibrary.simpleMessage("提交"),
        "home_states": MessageLookupByLibrary.simpleMessage("状态"),
        "home_timeSlot": MessageLookupByLibrary.simpleMessage("时间段"),
        "home_youDontHaveAnAppointmentYet":
            MessageLookupByLibrary.simpleMessage("您当前没有任何预约。"),
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
