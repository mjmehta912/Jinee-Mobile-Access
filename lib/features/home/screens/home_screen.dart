import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/common/widgets/custom_elevated_button.dart';
import 'package:jinee_mobile_access/common/widgets/custom_text.dart';
import 'package:jinee_mobile_access/features/company/screens/company_screen.dart';
import 'package:jinee_mobile_access/features/user/screens/user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
              title: 'Jinee Mobile Access',
              fontSize: 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            CustomElevatedButton(
              title: 'Company',
              onPressed: () {
                Get.to(
                  () => CompanyScreen(),
                  transition: Transition.fade,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            CustomElevatedButton(
              title: 'User',
              onPressed: () {
                Get.to(
                  () => UserScreen(),
                  transition: Transition.fade,
                  duration: const Duration(
                    milliseconds: 500,
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
