import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_size_extensions.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final double titleSpacing;
  final List<Widget>? actions;

  const AppAppbar({
    super.key,
    required this.title,
    this.titleStyle,
    this.leading,
    this.automaticallyImplyLeading = false,
    this.titleSpacing = 24.0,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: kColorBackground,
      title: Text(
        title,
        style: titleStyle ??
            TextStyles.kSemiBoldMontserrat(
              fontSize: FontSize.k20FontSize,
              color: kColorTextPrimary,
            ),
      ),
      titleSpacing: titleSpacing.appWidth,
      leading: leading ??
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kColorTextPrimary,
              size: 20,
            ),
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
