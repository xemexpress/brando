import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/booking/widgets/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const BookingScreen(),
      );

  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      leftSide: PrimarySection(
        child: Text(
          'Your booking time slot is',
          style: GoogleFonts.libreBaskerville(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      rightSide: const BookingPage(),
    );
  }
}
