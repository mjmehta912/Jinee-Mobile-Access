import 'package:flutter/material.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';

class AppCardText extends StatelessWidget {
  const AppCardText({
    super.key,
    required this.title,
    this.fontSize = FontSize.k20FontSize,
  });

  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.kMediumMontserrat(
        fontSize: fontSize,
        color: kColorBlack,
      ).copyWith(
        height: 1.5,
      ),
    );
  }
}
