import 'package:flutter/material.dart';

class ThirdPartyLogInButton extends StatelessWidget {
  const ThirdPartyLogInButton({
    super.key,
    required this.imagePath,
    required this.labelText,
    this.width = 40,
    this.height = 40,
    this.offsetX = 0,
    this.offsetY = 0,
  });
  final String imagePath;
  final String labelText;
  final double width;
  final double height;
  final double offsetX;
  final double offsetY;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print('Log in with $labelText');
        },
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
              width: 1,
            ),
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
                child: Text(labelText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
