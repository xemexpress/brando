import 'package:brando/src/features/auth/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPanel extends StatefulWidget {
  const LogInPanel({super.key});

  @override
  State<LogInPanel> createState() => _LogInPanelState();
}

class _LogInPanelState extends State<LogInPanel> {
  final TextEditingController _emailNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _accountNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void signInUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailNumberController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailNumberController.dispose();
    _passwordController.dispose();

    _accountNumberFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              controller: _emailNumberController,
              currentFocusNode: _accountNumberFocusNode,
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
    );
  }
}
