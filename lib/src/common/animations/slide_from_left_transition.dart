import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

PageRouteBuilder slideFromLeftTransition(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0); // Start position (offscreen to the left)
      const end = Offset.zero; // End position (center of the screen)
      const curve = Curves.easeInOut; // Define the animation curve

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: animationDuration),
  );
}
