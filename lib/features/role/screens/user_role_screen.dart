import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_appbar.dart';
import 'package:jinee_mobile_access/widgets/app_button.dart';
import 'package:jinee_mobile_access/widgets/app_card_text.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';
import 'package:jinee_mobile_access/widgets/app_size_extensions.dart';
import 'package:jinee_mobile_access/widgets/app_spacings.dart';
import 'package:jinee_mobile_access/features/role/controllers/user_role_controller.dart';
import 'package:jinee_mobile_access/features/role/screens/add_edit_user_role_screen.dart';

class UserRoleScreen extends StatefulWidget {
  const UserRoleScreen({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  State<UserRoleScreen> createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
  final UserRoleController _controller = Get.put(
    UserRoleController(),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchUserRoles(
      userId: widget.userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppAppbar(
            title: 'User Roles',
            actions: [
              AppButton(
                width: 0.30.screenWidth,
                buttonColor: kColorUserRole,
                height: 35,
                title: '+ Add',
                titleSize: FontSize.k16FontSize,
                onPressed: () {
                  Get.to(
                    () => AddEditUserRoleScreen(
                      userId: widget.userId,
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
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.userRoles.length,
                itemBuilder: (context, index) {
                  final userRole = _controller.userRoles[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => AddEditUserRoleScreen(
                          userId: widget.userId,
                          isEdit: true,
                          cid: userRole.cid,
                          coName: userRole.coName,
                          userTypeCode: userRole.userType,
                          seCodes: userRole.secodes,
                          pCodes: userRole.pcodes,
                          ledgerStartDate: userRole.ledgerStart,
                          ledgerEndDate: userRole.ledgerEnd,
                          isAppAccessAvailable: userRole.appAccess,
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
                          color: kColorUserRole,
                          child: Padding(
                            padding: AppPaddings.p10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppCardText(
                                  title: userRole.coName,
                                  fontSize: FontSize.k22FontSize,
                                ),
                                AppCardText(
                                  title:
                                      'User Type : ${_controller.userTypes.entries.firstWhere(
                                            (ut) =>
                                                ut.value == userRole.userType,
                                          ).key}',
                                  fontSize: FontSize.k18FontSize,
                                ),
                                AppCardText(
                                  title: 'SE Code : ${userRole.secodes}',
                                  fontSize: FontSize.k18FontSize,
                                ),
                                AppCardText(
                                  title: 'P Code : ${userRole.pcodes}',
                                  fontSize: FontSize.k18FontSize,
                                ),
                                AppCardText(
                                  title:
                                      'Ledger Start : ${userRole.ledgerStart != null ? DateFormat('dd-MM-yyyy').format(userRole.ledgerStart!) : null}',
                                  fontSize: FontSize.k18FontSize,
                                ),
                                AppCardText(
                                  title:
                                      'Ledger End : ${userRole.ledgerEnd != null ? DateFormat('dd-MM-yyyy').format(userRole.ledgerEnd!) : null}',
                                  fontSize: FontSize.k18FontSize,
                                ),
                                AppCardText(
                                  title: 'App Access : ${userRole.appAccess}',
                                  fontSize: FontSize.k18FontSize,
                                ),
                                const Row(),
                              ],
                            ),
                          ),
                        ),
                        AppSpaces.v16
                      ],
                    ),
                  );
                },
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
                      color: kColorUserRole,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
