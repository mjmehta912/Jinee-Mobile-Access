import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jinee_mobile_access/common/widgets/custom_card_text.dart';
import 'package:jinee_mobile_access/common/widgets/custom_text.dart';
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
          appBar: AppBar(
            title: const CustomText(
              title: 'User Roles',
              fontSize: 40,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(
                    () => AddEditUserRoleScreen(
                      userId: widget.userId,
                      isEdit: false,
                    ),
                    transition: Transition.fade,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
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
                        transition: Transition.fade,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF00FFFF),
                                Color(0xFF00BFFF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00FFFF).withOpacity(0.6),
                                offset: const Offset(4, 4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCardText(
                                  title: userRole.coName,
                                  fontSize: 30,
                                ),
                                CustomCardText(
                                  title:
                                      'User Type : ${_controller.userTypes.entries.firstWhere(
                                            (ut) =>
                                                ut.value == userRole.userType,
                                          ).key}',
                                ),
                                CustomCardText(
                                  title: 'SE Code : ${userRole.secodes}',
                                ),
                                CustomCardText(
                                  title: 'P Code : ${userRole.pcodes}',
                                ),
                                CustomCardText(
                                  title:
                                      'Ledger Start : ${userRole.ledgerStart != null ? DateFormat('dd-MM-yyyy').format(userRole.ledgerStart!) : null}',
                                ),
                                CustomCardText(
                                  title:
                                      'Ledger End : ${userRole.ledgerEnd != null ? DateFormat('dd-MM-yyyy').format(userRole.ledgerEnd!) : null}',
                                ),
                                CustomCardText(
                                  title: 'App Access : ${userRole.appAccess}',
                                ),
                                const Row(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
                      color: Color(0xFF00FFFF),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
