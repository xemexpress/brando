import 'package:flutter/material.dart';

class ThirdPartyLogInButton extends StatelessWidget {
  final void Function() onTap;
  final String imagePath;
  final String labelText;
  final double width;
  final double height;
  final double offsetX;
  final double offsetY;
  final bool hasBorder;

  const ThirdPartyLogInButton({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.labelText,
    this.width = 40,
    this.height = 40,
    this.offsetX = 0,
    this.offsetY = 0,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: hasBorder
                ? Border.all(
                    width: 1,
                  )
                : null,
          ),
          child: Transform.translate(
            offset: Offset(offsetX, offsetY),
            child: Image.asset(
              imagePath,
              height: height,
              width: width,
              errorBuilder: (context, error, stackTrace) => Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                child: Text(
                  labelText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
