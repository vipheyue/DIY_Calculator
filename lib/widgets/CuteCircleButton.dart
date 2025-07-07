import 'package:flutter/material.dart';

class CuteCircleButton extends StatelessWidget {
  final String text;
  final double size;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const CuteCircleButton({
    super.key,
    required this.text,
    this.size = 140,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.pink,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 4),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size / 6,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}