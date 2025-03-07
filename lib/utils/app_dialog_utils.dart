import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';

void showErrorSnackbar(
  String title,
  String message,
) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.redAccent,
    colorText: kColorBackground,
    duration: const Duration(
      seconds: 5,
    ),
    margin: AppPaddings.p10,
    borderRadius: 10,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    titleText: Text(
      title,
      style: TextStyles.kSemiBoldMontserrat(
        fontSize: FontSize.k22FontSize,
        color: kColorBackground,
      ),
    ),
    messageText: Text(
      message,
      style: TextStyles.kSemiBoldMontserrat(
        fontSize: FontSize.k18FontSize,
        color: kColorBackground,
      ),
    ),
    mainButton: TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        'OK',
        style: TextStyles.kSemiBoldMontserrat(
          fontSize: FontSize.k22FontSize,
          color: kColorBackground,
        ),
      ),
    ),
  );
}

void showSuccessSnackbar(
  String title,
  String message, {
  Color? bgColor = kColorPrimary,
}) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: bgColor,
    colorText: kColorBackground,
    duration: const Duration(
      seconds: 5,
    ),
    margin: AppPaddings.p10,
    borderRadius: 10,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    titleText: Text(
      title,
      style: TextStyles.kSemiBoldMontserrat(
        fontSize: FontSize.k22FontSize,
        color: kColorBackground,
      ),
    ),
    messageText: Text(
      message,
      style: TextStyles.kSemiBoldMontserrat(
        fontSize: FontSize.k18FontSize,
        color: kColorBackground,
      ),
    ),
    mainButton: TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        'OK',
        style: TextStyles.kSemiBoldMontserrat(
          fontSize: FontSize.k22FontSize,
          color: kColorBackground,
        ),
      ),
    ),
  );
}

void showAlertSnackbar(
  String title,
  String message,
) {
  Get.snackbar(
    '',
    '',
    icon: const Icon(
      Icons.error_outline,
      color: Colors.black,
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color(0xFFE9D502),
    colorText: Colors.black,
    duration: const Duration(
      seconds: 5,
    ),
    margin: const EdgeInsets.all(10),
    borderRadius: 8,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    titleText: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
    ),
    mainButton: TextButton(
      onPressed: () {
        Get.back(); // This will close the snackbar
      },
      child: const Text(
        'OK',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    ),
  );
}
