import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final FormFieldValidator validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF00BFFF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF00BFFF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey,
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Color(0xFF00BFFF),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Color(0xFF00BFFF),
      ),
      cursorColor: const Color(0xFF00BFFF),
      cursorHeight: 25,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
