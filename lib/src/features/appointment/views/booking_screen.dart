import 'package:brando/src/apis/analytics/analytics.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingScreen extends ConsumerStatefulWidget {
  static const String routeName = '/booking';
  static const String screenName = 'Booking Screen';

  static route() => MaterialPageRoute(
        builder: (context) => const BookingScreen(),
      );

  const BookingScreen({
    super.key,
  });

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        await ref
            .read(analyticsAPIProvider)
            .setCurrentScreen(pageName: BookingScreen.screenName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                isShadowed: false,
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
