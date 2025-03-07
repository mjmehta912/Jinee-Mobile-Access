import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';

class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField({
    super.key,
    required this.dateController,
    required this.hintText,
    required this.labelText,
    this.themeColor = kColorPrimary,
  });

  final TextEditingController dateController;
  final String hintText;
  final String labelText;
  final Color? themeColor;

  @override
  State<AppDatePickerField> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends State<AppDatePickerField> {
  static const String dateFormat = 'dd-MM-yyyy';

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate =
        _parseDate(widget.dateController.text) ?? DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: _buildDatePickerTheme(context),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      _focusNode.unfocus();
      setState(
        () {
          widget.dateController.text =
              DateFormat(dateFormat).format(pickedDate);
        },
      );
    }
  }

  DateTime? _parseDate(String dateString) {
    try {
      return DateFormat(dateFormat).parseStrict(dateString);
    } catch (e) {
      return null;
    }
  }

  ThemeData _buildDatePickerTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: kColorTextPrimary,
      colorScheme: const ColorScheme.light(
        primary: kColorTextSecondary,
        onPrimary: kColorBackground,
        surface: kColorTextPrimary,
      ),
      dialogBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headlineLarge: TextStyles.kSemiBoldMontserrat(
          fontSize: FontSize.k24FontSize,
          color: kColorBackground,
        ),
        bodyLarge: TextStyles.kSemiBoldMontserrat(
          fontSize: FontSize.k16FontSize,
          color: kColorBackground,
        ),
        titleLarge: TextStyles.kSemiBoldMontserrat(
          fontSize: FontSize.k18FontSize,
          color: kColorBackground,
        ),
        displayLarge: TextStyles.kSemiBoldMontserrat(
          fontSize: FontSize.k18FontSize,
          color: kColorBackground,
        ),
        labelLarge: TextStyles.kSemiBoldMontserrat(
          fontSize: FontSize.k18FontSize,
          color: kColorBackground,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      focusNode: _focusNode,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.themeColor!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.themeColor!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.themeColor!,
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
        hintText: widget.hintText,
        hintStyle: TextStyles.kMediumMontserrat(
          color: kColorTextSecondary,
          fontSize: FontSize.k16FontSize,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyles.kMediumMontserrat(
          color: kColorTextSecondary,
          fontSize: FontSize.k16FontSize,
        ),
        floatingLabelStyle: TextStyles.kMediumMontserrat(
          color: widget.themeColor!,
          fontSize: FontSize.k16FontSize,
        ),
        errorStyle: TextStyles.kRegularMontserrat(
          color: Colors.redAccent,
          fontSize: FontSize.k16FontSize,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: AppPaddings.p12,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.calendar_today_rounded,
            size: 20,
            color: widget.themeColor,
          ),
          onPressed: () => _selectDate(context),
        ),
      ),
      style: TextStyles.kSemiBoldMontserrat(
        color: widget.themeColor!,
        fontSize: FontSize.k18FontSize,
      ),
      cursorColor: widget.themeColor,
      cursorHeight: 25,
      validator: (value) {
        return null;
      },
    );
  }
}
