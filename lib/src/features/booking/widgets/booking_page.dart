import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/booking/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
          MyAppBar(
            trailing: Icon(
              Icons.person_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 40,
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 90),
            child: Column(
              children: [
                Text(
                  'Feburary',
                  style: GoogleFonts.libreBaskerville(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    // CalendarDatePicker(
                    //   initialDate: DateTime.now(),
                    //   firstDate: DateTime(2021),
                    //   lastDate: DateTime(2022),
                    //   onDateChanged: (DateTime date) {
                    //     print('Selected date: $date');
                    //   },
                    // ),
                    SizedBox(
                      width: 250,
                      child: CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 60),
                        ), // Dynamically sets the lastDate
                        onDateChanged: (DateTime date) {
                          print('Selected date: $date');
                        },
                      ),
                    ),
                    const TimeslotPicker(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
