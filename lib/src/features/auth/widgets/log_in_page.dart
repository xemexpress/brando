import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  @override
  ConsumerState<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void signInUserWithEmailAndPassword() async {
    try {
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
        message: 'Invalid email. Please try again.',
      );
    } on InvalidCredentialsAuthException catch (_) {
      _passwordFocusNode.requestFocus();

      _passwordController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _passwordController.text.length,
      );

      showFeedback(
        message: 'Invalid password. Please try again.',
      );
    } on NetworkRequestAuthException catch (_) {
      showFeedback(
        message:
            'Network request temporarily failed. Please try logging in again.',
      );
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void signInUserWithGoogle() async {
    try {
      await ref.read(authControllerProvider.notifier).signInWithGoogle();
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void signInUserWithFacebook() async {
    try {
      await ref.read(authControllerProvider.notifier).signInWithFacebook();
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void signInUserWithApple() async {
    try {
      await ref.read(authControllerProvider.notifier).signInWithApple();
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
    final isLoading = ref.watch(authControllerProvider);

    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  AuthField(
                    controller: _emailController,
                    currentFocusNode: _emailFocusNode,
                    nextFocusNode: _passwordFocusNode,
                    hintText: 'Email',
                    // icon: Icons.person_rounded,
                    icon: CupertinoIcons.person_fill,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  AuthField(
                    controller: _passwordController,
                    currentFocusNode: _passwordFocusNode,
                    signInUser: signInUserWithEmailAndPassword,
                    hintText: 'Password',
                    // icon: Icons.lock_rounded,
                    icon: CupertinoIcons.lock_fill,
                    obscureText: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberMe(),
                        ForgotPassword(),
                      ],
                    ),
                  ),
                  LogInButton(
                    onClick: signInUserWithEmailAndPassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'or\nlog in with',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
            ),
          ),
        ),
        if (isLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
      ],
    );
  }
}
