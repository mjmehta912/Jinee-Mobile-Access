import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackbar(
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
    backgroundColor: Colors.red,
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

void showSuccessSnackbar(
  String title,
  String message,
) {
  Get.snackbar(
    '',
    '',
    icon: const Icon(
      Icons.verified_outlined,
      color: Colors.black,
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color(0xFF00BFFF),
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
