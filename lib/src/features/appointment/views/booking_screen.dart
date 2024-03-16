import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';

import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  static const String routeName = 'booking';
  static route() => MaterialPageRoute(
        builder: (context) => const BookingScreen(),
      );

  const BookingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: MobileScaffold(
        body: AppointmentPage(),
      ),
      tabletScaffold: DesktopScaffold(
        leftSide: PrimarySection(
          child: BookingSummary(),
        ),
        rightSide: AppointmentPage(),
      ),
      desktopScaffold: DesktopScaffold(
        leftSide: PrimarySection(
          child: BookingSummary(),
        ),
        rightSide: AppointmentPage(),
      ),
    );
  }
}
