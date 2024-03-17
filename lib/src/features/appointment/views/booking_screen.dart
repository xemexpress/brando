import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingScreen extends ConsumerWidget {
  static const String routeName = 'booking';
  static route() => MaterialPageRoute(
        builder: (context) => const BookingScreen(),
      );

  const BookingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<AuthUser?>(
      stream: ref.read(authControllerProvider.notifier).userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          const body = AppointmentPage();

          return context.responsive(
            const MobileScaffold(
              body: body,
            ),
            md: const DesktopScaffold(
              leftSide: PrimarySection(
                child: BookingSummary(),
              ),
              rightSide: body,
            ),
          );
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}
