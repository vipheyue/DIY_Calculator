import 'package:flutter/material.dart';

class CircleTextButton extends StatelessWidget {
  final String text;
  final double size;
  final double fontSize;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;
  final FontWeight fontWeight;

  const CircleTextButton({
    super.key,
    required this.text,
    this.size = 36,
    this.fontSize = 24,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black12,
    this.textColor = Colors.black,
    this.borderWidth = 1,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}