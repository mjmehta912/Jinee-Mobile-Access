import 'package:flutter/material.dart';

class CustomCardText extends StatelessWidget {
  const CustomCardText({
    super.key,
    required this.title,
    this.fontSize = 25,
  });

  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        height: 0.75,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
