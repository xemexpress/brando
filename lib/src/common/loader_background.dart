import 'package:flutter/material.dart';

class LoaderBackground extends StatelessWidget {
  const LoaderBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.4,
      child: ModalBarrier(
        dismissible: false,
        color: Colors.black,
      ),
    );
  }
}
