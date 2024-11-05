import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final Alignment alignment;
  CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}