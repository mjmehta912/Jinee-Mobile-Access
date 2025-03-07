import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hintText,
    required this.labelText,
    this.selectedItem,
    this.validatorText,
    this.themeColor = kColorPrimary,
    this.height = 300,
  });

  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  final String labelText;
  final String? selectedItem;
  final String? validatorText;
  final Color? themeColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
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
            fontSize: FontSize.k16FontSize,
          ),
          labelText: labelText,
          labelStyle: TextStyles.kMediumMontserrat(
            color: kColorTextSecondary,
            fontSize: FontSize.k16FontSize,
          ),
          floatingLabelStyle: TextStyles.kMediumMontserrat(
            color: themeColor!,
            fontSize: FontSize.k16FontSize,
          ),
          errorStyle: TextStyles.kRegularMontserrat(
            color: Colors.redAccent,
            fontSize: FontSize.k16FontSize,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: AppPaddings.p12,
        ),
        baseStyle: TextStyles.kSemiBoldMontserrat(
          color: themeColor!,
          fontSize: FontSize.k18FontSize,
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: false,
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(8),
          backgroundColor: themeColor,
          elevation: 5,
        ),
        constraints: BoxConstraints(
          maxHeight: height!,
        ),
        itemBuilder: (context, item, isSelected) {
          return Column(
            children: [
              ListTile(
                title: Text(item,
                    style: TextStyles.kSemiBoldMontserrat(
                      fontSize: FontSize.k20FontSize,
                      color: kColorBackground,
                    )),
              ),
              if (item != items.last)
                const Divider(
                  height: 1,
                  indent: 30,
                  endIndent: 30,
                  color: kColorBackground,
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
