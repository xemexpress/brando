import 'package:brando/src/common/common.dart';
import 'package:flutter/material.dart';

class PrimarySection extends StatelessWidget {
  const PrimarySection({
    super.key,
    required this.child,
    this.isShadowed = false,
  });

  final Widget child;
  final bool isShadowed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: isShadowed
            ? [
                BoxShadow(
                  color:
                      Colors.black.withOpacity(0.2), // Adjust opacity as needed
                  offset: const Offset(4.0, 0.0), // Offset to the right
                  blurRadius: 5.0,
                  spreadRadius:
                      1.0, // Optional: Controls how far the shadow extends
                ),
              ]
            : null,
      ),
      child: SafeArea(
        right: false,
        bottom: false,
        top: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: child,
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: AffiliationNote(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
