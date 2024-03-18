import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayOfMonth extends StatefulWidget {
  const DayOfMonth({
    super.key,
    required this.date,
    required this.selectedDate,
    required this.circled,
    required this.colored,
    required this.enabled,
    required this.isSecondary,
    required this.onSelectDate,
    required this.borderWidth,
  });

  final DateTime date;
  final DateTime selectedDate;
  final bool circled;
  final bool colored;
  final bool enabled;
  final bool isSecondary;
  final Function(DateTime) onSelectDate;
  final double borderWidth;

  @override
  State<DayOfMonth> createState() => _DayOfMonthState();
}

class _DayOfMonthState extends State<DayOfMonth> {
  bool isHovered = false;

  void onHover(event) => setState(() {
        isHovered = !isHovered;
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.enabled ? () => widget.onSelectDate(widget.date) : null,
        child: MouseRegion(
          cursor: widget.enabled
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          onEnter: onHover,
          onExit: onHover,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                width: widget.borderWidth,
              ),
              color: widget.enabled && isHovered
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                  : widget.colored
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
            ),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.circled
                      ? Theme.of(context).colorScheme.outline
                      : Colors.transparent,
                  width: 1.5,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '${widget.date.day}',
                style: GoogleFonts.cabin(
                  textStyle: context
                      .responsive(
                        Theme.of(context).textTheme.titleSmall,
                        md: Theme.of(context).textTheme.titleMedium,
                      )!
                      .copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                  color: widget.isSecondary
                      ? Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                      : Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
