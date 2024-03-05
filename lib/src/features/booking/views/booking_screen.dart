import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/booking/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const BookingScreen(),
      );

  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopLayout(
      leftSide: PrimarySection(
        child: BookingSummary(),
      ),
      rightSide: AppointmentPage(),
    );
  }
}
