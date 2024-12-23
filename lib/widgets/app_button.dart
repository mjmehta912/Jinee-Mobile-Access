import 'package:flutter/material.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonColor = kColorPrimary,
    this.titleColor = kColorBackground,
    this.height = 45,
    this.width = double.infinity,
    this.titleSize = FontSize.k24FontSize,
  });

  final String title;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final double? titleSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(0),
        ),
        child: Text(
          title,
          style: TextStyles.kSemiBoldMontserrat(
            fontSize: titleSize!,
            color: titleColor!,
          ),
        ),
      ),
    );
  }
}
