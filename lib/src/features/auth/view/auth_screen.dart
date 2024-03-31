import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/view/log_in_screen.dart';
import 'package:brando/src/features/home/view/home_screen.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  static const String routeName = '/';

  static route() => MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<AuthUser?>(
      stream: ref.read(authControllerProvider.notifier).authStateChanges(),
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.active) {
        // print('test snapshot.connectionState: ${snapshot.connectionState}');
        // print('test snapshot.stackTrace: ${snapshot.stackTrace}');
        if (snapshot.hasData) {
          // print('test snapshot.data: ${snapshot.data}');
          // print('test snapshot.requireData: ${snapshot.requireData}');
          return const HomeScreen();

          // return const BookingScreen();
        } else {
          return const LogInScreen();
        }
      },
    );
  }
}
