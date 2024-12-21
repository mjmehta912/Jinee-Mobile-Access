import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';
import 'package:jinee_mobile_access/widgets/app_button.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/features/company/screens/company_screen.dart';
import 'package:jinee_mobile_access/features/user/screens/user_screen.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_spacings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.ph24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jinee',
              style: TextStyles.kSemiBoldMontserrat(
                fontSize: FontSize.k34FontSize,
                color: kColorTextPrimary,
              ),
            ),
            Text(
              'Mobile Access',
              style: TextStyles.kSemiBoldMontserrat(
                fontSize: FontSize.k40FontSize,
                color: kColorTextPrimary,
              ),
            ),
            AppSpaces.v40,
            AppButton(
              title: 'Company',
              onPressed: () {
                Get.to(
                  () => CompanyScreen(),
                  transition: Transition.fadeIn,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                );
              },
            ),
            AppSpaces.v40,
            AppButton(
              title: 'User',
              buttonColor: kColorSecondary,
              onPressed: () {
                Get.to(
                  () => UserScreen(),
                  transition: Transition.fadeIn,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
