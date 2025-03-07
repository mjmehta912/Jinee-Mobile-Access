import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/utils/app_dialog_utils.dart';
import 'package:jinee_mobile_access/features/user/controllers/user_controller.dart';
import 'package:jinee_mobile_access/features/user/services/user_service.dart';

class AddEditUserController extends GetxController {
  var isLoading = false.obs;

  var fullNameController = TextEditingController();
  var userNamecontroller = TextEditingController();
  var mobileNoController = TextEditingController();
  var passwordController = TextEditingController();
  var userTypeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final UserController userController = Get.find<UserController>();

  Future<void> updateUserDetails({
    required int userId,
  }) async {
    isLoading(true);
    try {
      String successMessage = await UserService.updateUser(
        userId: userId,
        fullName: fullNameController.text,
        userName: userNamecontroller.text,
        mobile: mobileNoController.text,
        password: passwordController.text,
        userType: 0,
      );

      await userController.fetchUsers();
      Get.back();
      showSuccessSnackbar(
        'Success',
        successMessage,
      );
    } catch (e) {
      showErrorSnackbar(
        'Error',
        e.toString(),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> addUserDetails({
    required int userId,
  }) async {
    isLoading(true);
    try {
      String successMessage = await UserService.addUser(
        userId: userId,
        fullName: fullNameController.text,
        userName: userNamecontroller.text,
        mobile: mobileNoController.text,
        password: passwordController.text,
        userType: 0,
      );

      await userController.fetchUsers();
      Get.back();
      showSuccessSnackbar(
        'Success',
        successMessage,
      );
    } catch (e) {
      showErrorSnackbar(
        'Error',
        e.toString(),
      );
    } finally {
      isLoading(false);
    }
  }
}
