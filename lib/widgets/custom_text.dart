import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.fontSize,
  });

  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFF00FFFF),
          Color(0xFF00BFFF),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: const Color(0xFF00FFFF).withOpacity(0.7),
              offset: const Offset(4, 4),
            ),
            Shadow(
              blurRadius: 20.0,
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(-4, -4),
            ),
          ],
        ),
      ),
    );
  }
}
