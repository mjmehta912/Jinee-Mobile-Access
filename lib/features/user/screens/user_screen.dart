import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_appbar.dart';
import 'package:jinee_mobile_access/widgets/app_button.dart';
import 'package:jinee_mobile_access/widgets/app_card_text.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';
import 'package:jinee_mobile_access/widgets/app_size_extensions.dart';
import 'package:jinee_mobile_access/widgets/app_spacings.dart';
import 'package:jinee_mobile_access/features/right/screens/right_screen.dart';
import 'package:jinee_mobile_access/features/role/screens/user_role_screen.dart';
import 'package:jinee_mobile_access/features/user/controllers/user_controller.dart';
import 'package:jinee_mobile_access/features/user/screens/add_edit_user_screen.dart';
import 'package:jinee_mobile_access/widgets/app_text_form_field.dart';

class UserScreen extends StatelessWidget {
  UserScreen({
    super.key,
  });

  final UserController _controller = Get.put(
    UserController(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: AppAppbar(
              title: 'Users',
              actions: [
                AppButton(
                  width: 0.30.screenWidth,
                  height: 35,
                  buttonColor: kColorSecondary,
                  title: '+ Add',
                  titleSize: FontSize.k18FontSize,
                  onPressed: () {
                    Get.to(
                      () => const AddEditUserScreen(
                        isEdit: false,
                      ),
                      transition: Transition.fadeIn,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                    );
                  },
                ),
              ],
            ),
            body: Padding(
              padding: AppPaddings.p16,
              child: Column(
                children: [
                  AppTextFormField(
                    onChanged: (value) {
                      _controller.searchQuery.value = value;
                    },
                    hintText: 'Search',
                    labelText: 'Search',
                    controller: TextEditingController(),
                    validator: (value) {
                      return null;
                    },
                    themeColor: kColorSecondary,
                  ),
                  AppSpaces.v20,
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: _controller.filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = _controller.filteredUsers[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => AddEditUserScreen(
                                  isEdit: true,
                                  fullName: user.fullName,
                                  userName: user.userName,
                                  mobileNo: user.mobileNumber,
                                  userId: user.userId,
                                ),
                                transition: Transition.fadeIn,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Card(
                                  color: kColorSecondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: AppPaddings.p10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppCardText(
                                          title: user.fullName,
                                          fontSize: FontSize.k22FontSize,
                                        ),
                                        AppCardText(
                                          title: 'User Id : ${user.userId}',
                                          fontSize: FontSize.k18FontSize,
                                        ),
                                        AppCardText(
                                            title:
                                                'User Name : ${user.userName}',
                                            fontSize: FontSize.k18FontSize),
                                        AppCardText(
                                            title:
                                                'Mobile : ${user.mobileNumber}',
                                            fontSize: FontSize.k18FontSize),
                                        AppSpaces.v10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppButton(
                                              width: 0.40.screenWidth,
                                              titleSize: FontSize.k16FontSize,
                                              buttonColor: kColorUserRole,
                                              onPressed: () {
                                                Get.to(
                                                  () => UserRoleScreen(
                                                    userId: user.userId,
                                                  ),
                                                  transition: Transition.fadeIn,
                                                  duration: const Duration(
                                                    milliseconds: 300,
                                                  ),
                                                );
                                              },
                                              title: 'User Role',
                                            ),
                                            AppButton(
                                              width: 0.40.screenWidth,
                                              titleSize: FontSize.k16FontSize,
                                              buttonColor: kColorUserRight,
                                              onPressed: () {
                                                Get.to(
                                                  () => RightScreen(
                                                    userId: user.userId,
                                                    userName: user.userName,
                                                  ),
                                                  transition: Transition.fadeIn,
                                                  duration: const Duration(
                                                    milliseconds: 300,
                                                  ),
                                                );
                                              },
                                              title: 'User Rights',
                                            ),
                                          ],
                                        ),
                                        const Row(),
                                      ],
                                    ),
                                  ),
                                ),
                                AppSpaces.v16,
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => _controller.isLoading.value
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: kColorSecondary,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
