import 'package:flutter/material.dart';

import 'CircleTextButton.dart' show CircleTextButton;

class ImageButtonWithText extends StatelessWidget {
  final String backgroundImage;
  final String text;
  final Color borderColor;
  final Color textColor;

  const ImageButtonWithText({
    super.key,
    required this.backgroundImage,
    required this.text,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(backgroundImage),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: CircleTextButton(
            text: text,
            borderColor: borderColor,
            textColor: textColor,
          ),
        ),
      ],
    );
  }
}