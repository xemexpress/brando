import 'dart:ui';

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

  @override
  void dispose() {
    _accountNumberController.dispose();
    _passwordController.dispose();

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
                        fontWeight: FontWeight.w400,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _accountNumberController,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(height: 1),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      // labelText: 'Account Number',
                      labelStyle: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15.0,
                      ),
                      // contentPadding: const EdgeInsets.fromLTRB(
                      //   20,
                      //   30,
                      //   20,
                      //   0,
                      // ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _accountNumberController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      labelText: 'Account Number',
                      labelStyle: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        fontWeight: FontWeight.w400,
                        // height: 1.5,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15.0,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
