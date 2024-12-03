import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/common/widgets/custom_card_text.dart';
import 'package:jinee_mobile_access/common/widgets/custom_text.dart';
import 'package:jinee_mobile_access/features/right/screens/right_screen.dart';
import 'package:jinee_mobile_access/features/role/screens/user_role_screen.dart';
import 'package:jinee_mobile_access/features/user/controllers/user_controller.dart';
import 'package:jinee_mobile_access/features/user/screens/add_edit_user_screen.dart';

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
        Scaffold(
          appBar: AppBar(
            title: const CustomText(
              title: 'Users',
              fontSize: 40,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(
                    () => const AddEditUserScreen(
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
                itemCount: _controller.users.length,
                itemBuilder: (context, index) {
                  final user = _controller.users[index];

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
                                  title: user.fullName,
                                  fontSize: 30,
                                ),
                                CustomCardText(
                                  title: 'User Id : ${user.userId}',
                                ),
                                CustomCardText(
                                  title: 'User Name : ${user.userName}',
                                ),
                                CustomCardText(
                                  title: 'Mobile : ${user.mobileNumber}',
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFFFF00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                            40),
                                      ),
                                      onPressed: () {
                                        Get.to(
                                          () => UserRoleScreen(
                                            userId: user.userId,
                                          ),
                                          transition: Transition.fade,
                                          duration: const Duration(
                                            milliseconds: 500,
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'User Role',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFFFF00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                            40),
                                      ),
                                      onPressed: () {
                                        Get.to(
                                          () => RightScreen(
                                            userId: user.userId,
                                            userName: user.userName,
                                          ),
                                          transition: Transition.fade,
                                          duration: const Duration(
                                            milliseconds: 500,
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'User Rights',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
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
