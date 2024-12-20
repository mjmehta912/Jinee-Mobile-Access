import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/widgets/app_elevated_button.dart';
import 'package:jinee_mobile_access/widgets/custom_text.dart';
import 'package:jinee_mobile_access/widgets/custom_text_form_field.dart';
import 'package:jinee_mobile_access/features/user/controllers/add_edit_user_controller.dart';

class AddEditUserScreen extends StatefulWidget {
  const AddEditUserScreen({
    super.key,
    required this.isEdit,
    this.fullName,
    this.userName,
    this.mobileNo,
    this.userId,
  });

  final bool isEdit;
  final String? fullName;
  final String? userName;
  final String? mobileNo;
  final int? userId;

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final AddEditUserController _controller = Get.put(
    AddEditUserController(),
  );

  @override
  void initState() {
    super.initState();
    if (widget.fullName != null) {
      _controller.fullNameController.text = widget.fullName!;
    }

    if (widget.userName != null) {
      _controller.userNamecontroller.text = widget.userName!;
    }

    if (widget.mobileNo != null) {
      _controller.mobileNoController.text = widget.mobileNo!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: CustomText(
                title: widget.isEdit ? 'Edit User' : 'Add User',
                fontSize: 40,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Form(
                key: _controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _controller.fullNameController,
                        hintText: 'Full Name',
                        labelText: 'Full Name',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a full name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        controller: _controller.userNamecontroller,
                        hintText: 'User Name',
                        labelText: 'User Name',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a user name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        controller: _controller.mobileNoController,
                        hintText: 'Mobile Number',
                        labelText: 'Mobile Number',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a mobile number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        controller: _controller.passwordController,
                        hintText: 'Password',
                        labelText: 'Password',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AppElevatedButton(
                        title: 'Save',
                        onPressed: () {
                          if (_controller.formKey.currentState!.validate()) {
                            if (widget.isEdit) {
                              _controller.updateUserDetails(
                                userId: widget.userId!,
                              );
                            } else {
                              _controller.addUserDetails(
                                userId: 0,
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
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
