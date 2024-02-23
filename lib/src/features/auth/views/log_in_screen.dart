import 'dart:ui';

import 'package:brando/src/features/auth/widgets/auth_field.dart';
import 'package:brando/src/features/auth/widgets/forgotten_password.dart';
import 'package:brando/src/features/auth/widgets/log_in_button.dart';
import 'package:brando/src/features/auth/widgets/remember_me.dart';
import 'package:brando/src/features/auth/widgets/third_party_log_in_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _accountNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void signInUser() {
    print('${_accountNumberController.text} ${_passwordController.text}');
    // Log the user in.
    print('Log in user');
  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    _passwordController.dispose();

    _accountNumberFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome to\nMichelle Yuen Jewelry\nBooking System',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.libreBaskerville(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Powered by Michelle Yuen Jewelry',
                        style: GoogleFonts.ebGaramond(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      controller: _accountNumberController,
                      currentFocusNode: _accountNumberFocusNode,
                      nextFocusNode: _passwordFocusNode,
                      hintText: 'Account Number',
                      // icon: Icons.person_rounded,
                      icon: CupertinoIcons.person_fill,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    const SizedBox(height: 15),
                    AuthField(
                      controller: _passwordController,
                      currentFocusNode: _passwordFocusNode,
                      signInUser: signInUser,
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
                      onClick: signInUser,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ThirdPartyLogInButton(
                          imagePath: 'images/meta_icon.png',
                          labelText: 'Meta',
                        ),
                        SizedBox(width: 25),
                        ThirdPartyLogInButton(
                          imagePath: 'images/google_icon.png',
                          labelText: 'Google',
                        ),
                        SizedBox(width: 25),
                        ThirdPartyLogInButton(
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
        ],
      ),
    );
  }
}
