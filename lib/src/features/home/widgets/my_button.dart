import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.horizontalPadding,
  });

  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 23,
    //   width: null,
    //   child: FilledButton(
    //     style: FilledButton.styleFrom(
    //       padding: EdgeInsets.symmetric(
    //         horizontal: horizontalPadding,
    //         vertical: 10,
    //       ),
    //       backgroundColor: backgroundColor,
    //     ),
    //     onPressed: onPressed,
    //     child: Text(
    //       text,
    //       style: Theme.of(context).textTheme.labelSmall,
    //     ),
    //   ),
    // );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 20,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ??
                context.responsive(
                  15,
                  md: 10,
                ),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              context.responsive(
                5,
                md: 15,
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}
