import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch extends StatelessWidget {
  const CustomDropdownSearch({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hintText,
    required this.labelText,
    this.selectedItem,
    this.validatorText,
  });

  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  final String labelText;
  final String? selectedItem;
  final String? validatorText;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: items, // Predefined list
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
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
        baseStyle: const TextStyle(
          fontSize: 25,
          color: Color(0xFF00BFFF),
          fontWeight: FontWeight.w400,
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: false,
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(8),
          backgroundColor: const Color(0xFF00BFFF),
          elevation: 5,
        ),
        constraints: const BoxConstraints(
          maxHeight: 200,
        ),
        itemBuilder: (context, item, isSelected) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 24,
                        height: 0.8,
                      ),
                ),
              ),
              if (item != items.last)
                const Divider(
                  height: 1,
                  indent: 30,
                  endIndent: 30,
                  color: Colors.blueGrey,
                ),
            ],
          );
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      onChanged: onChanged,
      selectedItem: selectedItem,
    );
  }
}
