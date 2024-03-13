import 'package:flutter/material.dart';

class BrandedArrow extends StatelessWidget {
  const BrandedArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 34,
        ),
        Positioned(
          top: -1.8,
          child: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 34,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        Positioned(
          top: -0.5,
          child: Icon(
            Icons.arrow_drop_down_outlined,
            size: 34,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
    // return const Icon(
    //   Icons.keyboard_arrow_down,
    // );
  }
}
