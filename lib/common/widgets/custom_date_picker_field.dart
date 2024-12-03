import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerTextFormField extends StatefulWidget {
  const CustomDatePickerTextFormField({
    super.key,
    required this.dateController,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController dateController;
  final String hintText;
  final String labelText;

  @override
  State<CustomDatePickerTextFormField> createState() =>
      _CustomDatePickerTextFormFieldState();
}

class _CustomDatePickerTextFormFieldState
    extends State<CustomDatePickerTextFormField> {
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
      setState(() {
        widget.dateController.text = DateFormat(dateFormat).format(pickedDate);
      });
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
      primaryColor: const Color(0xFF00BFFF),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFFFFF00),
        onPrimary: Colors.black,
        surface: Color(0xFF00BFFF),
      ),
      dialogBackgroundColor: Colors.white,
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
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey,
        ),
        labelText: widget.labelText,
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
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.calendar_today_rounded,
            size: 20,
            color: Color(0xFF00BFFF),
          ),
          onPressed: () => _selectDate(context),
        ),
      ),
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Color(0xFF00BFFF),
      ),
      cursorColor: const Color(0xFF00BFFF),
      cursorHeight: 25,
      validator: (value) {
        return null;
      },
    );
  }
}
