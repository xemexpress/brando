import 'package:brando/generated/l10n.dart';
import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/features/auth/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPanel extends ConsumerStatefulWidget {
  const LogInPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogInPanelState();
}

class _LogInPanelState extends ConsumerState<LogInPanel> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void goToAuthScreen() {
    Navigator.of(context).pushNamed(AuthScreen.routeName);
  }

  void signInUserWithEmailAndPassword() async {
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        if (_emailController.text.isEmpty) {
          _emailFocusNode.requestFocus();
        } else {
          _passwordFocusNode.requestFocus();
        }

        showFeedback(
          message: S.current.login_emptyFieldsMessage,
        );
        return;
      }
      await ref.read(authControllerProvider.notifier).signInEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
    } on InvalidEmailAuthException catch (_) {
      _emailFocusNode.requestFocus();

      _emailController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _emailController.text.length,
      );

      showFeedback(
        message: S.current.login_invalidEmailMessage,
      );
    } on InvalidPasswordAuthException catch (_) {
      _passwordFocusNode.requestFocus();

      _passwordController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _passwordController.text.length,
      );

      showFeedback(
        message: S.current.login_invalidPasswordMessage,
      );
    } on NetworkRequestAuthException catch (_) {
      showFeedback(
        message: S.current.login_networkRequestFailedMessage,
      );
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void signInUserWithGoogle() async {
    try {
      await ref.read(authControllerProvider.notifier).signInWithGoogle();
      goToAuthScreen();
    } on UserNotLoggedInException catch (_) {
      showFeedback(message: S.current.login_userNotLoggedInGoogle);
    } on GenericAuthException catch (_) {
      showFeedback(message: S.current.login_unknownErrorMessage);
    }
  }

  void signInUserWithFacebook() async {
    try {
      await ref.read(authControllerProvider.notifier).signInWithFacebook();
      goToAuthScreen();
    } on UserNotLoggedInException catch (_) {
      showFeedback(message: S.current.login_userNotLoggedInFacebook);
    } on GenericAuthException catch (_) {
      showFeedback(message: S.current.login_unknownErrorMessage);
    }
  }

  void signInUserWithApple() async {
    try {
      await ref.read(authControllerProvider.notifier).signInWithApple();
      goToAuthScreen();
    } on UserNotLoggedInException catch (_) {
      showFeedback(message: S.current.login_userNotLoggedInApple);
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              S.of(context).login_heading,
              style: GoogleFonts.openSans(
                textStyle: context.responsive(
                  Theme.of(context).textTheme.headlineLarge,
                  md: Theme.of(context).textTheme.displaySmall,
                ),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          AuthField(
            controller: _emailController,
            currentFocusNode: _emailFocusNode,
            nextFocusNode: _passwordFocusNode,
            hintText: S.of(context).login_emailHint,
            icon: CupertinoIcons.person_fill,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 15),
          AuthField(
            controller: _passwordController,
            currentFocusNode: _passwordFocusNode,
            signInUser: signInUserWithEmailAndPassword,
            hintText: S.of(context).login_passwordHint,
            icon: CupertinoIcons.lock_fill,
            textInputAction: TextInputAction.go,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: double.infinity,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                RememberMe(),
                ForgotPassword(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          LogInButton(
            onClick: signInUserWithEmailAndPassword,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).login_thirdPartyLoginIntro,
            style: GoogleFonts.openSans(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThirdPartyLogInButton(
                onTap: signInUserWithFacebook,
                imagePath: 'images/meta_icon.png',
                labelText: 'Meta',
                hasBorder: false,
              ),
              const SizedBox(width: 25),
              ThirdPartyLogInButton(
                onTap: signInUserWithGoogle,
                imagePath: 'images/google_icon.png',
                labelText: 'Google',
              ),
              const SizedBox(width: 25),
              ThirdPartyLogInButton(
                onTap: signInUserWithApple,
                imagePath: 'images/apple_icon.png',
                labelText: 'Apple',
                width: 29,
                height: 29,
                offsetX: 0.5,
                offsetY: -1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
