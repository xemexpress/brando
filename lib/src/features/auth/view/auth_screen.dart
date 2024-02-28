import 'package:brando/src/features/auth/view/log_in_screen.dart';
import 'package:brando/src/features/home/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.active) {
          // print('test snapshot.connectionState: ${snapshot.connectionState}');
          // print('test snapshot.stackTrace: ${snapshot.stackTrace}');
          if (snapshot.hasData) {
            // print('test snapshot.data: ${snapshot.data}');
            // print('test snapshot.requireData: ${snapshot.requireData}');
            return const HomeScreen();
          } else {
            return const LogInScreen();
          }
        },
      ),
    );
  }
}
