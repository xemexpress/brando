import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayTextBox extends StatelessWidget {
  const DisplayTextBox(
    this.content, {
    super.key,
    this.width,
  });

  final String content;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(bottom: 2),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.7),
        ),
      ),
      child: Text(
        content,
        style: GoogleFonts.libreBaskerville(
          textStyle: Theme.of(context).textTheme.titleLarge,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
