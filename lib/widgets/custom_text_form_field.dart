import 'package:flutter/material.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.themeColor = kColorPrimary,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final FormFieldValidator validator;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final Color? themeColor;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeColor!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeColor!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeColor!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: TextStyles.kMediumMontserrat(
          color: kColorTextSecondary,
        ),
        labelText: labelText,
        labelStyle: TextStyles.kMediumMontserrat(
          color: kColorTextSecondary,
        ),
        floatingLabelStyle: TextStyles.kMediumMontserrat(
          color: themeColor!,
        ),
        errorStyle: TextStyles.kRegularMontserrat(
          color: Colors.redAccent,
          fontSize: FontSize.k16FontSize,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: AppPaddings.p12,
      ),
      style: TextStyles.kSemiBoldMontserrat(
        color: themeColor!,
      ),
      cursorColor: themeColor,
      cursorHeight: 20,
      validator: validator,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}
