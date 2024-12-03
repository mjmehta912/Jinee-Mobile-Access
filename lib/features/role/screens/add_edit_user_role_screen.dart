import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jinee_mobile_access/common/widgets/custom_date_picker_field.dart';
import 'package:jinee_mobile_access/common/widgets/custom_dropdown.dart';
import 'package:jinee_mobile_access/common/widgets/custom_elevated_button.dart';
import 'package:jinee_mobile_access/common/widgets/custom_text.dart';
import 'package:jinee_mobile_access/common/widgets/custom_text_form_field.dart';
import 'package:jinee_mobile_access/features/role/controllers/add_edit_user_role_controller.dart';

class AddEditUserRoleScreen extends StatefulWidget {
  const AddEditUserRoleScreen({
    super.key,
    required this.isEdit,
    this.cid,
    this.coName,
    this.userTypeCode,
    this.seCodes,
    this.pCodes,
    this.ledgerStartDate,
    this.ledgerEndDate,
    this.isAppAccessAvailable,
    required this.userId,
  });

  final bool isEdit;
  final int userId;

  final int? cid;
  final String? coName;
  final int? userTypeCode;
  final String? seCodes;
  final String? pCodes;
  final DateTime? ledgerStartDate;
  final DateTime? ledgerEndDate;
  final bool? isAppAccessAvailable;

  @override
  State<AddEditUserRoleScreen> createState() => _AddEditUserRoleScreenState();
}

class _AddEditUserRoleScreenState extends State<AddEditUserRoleScreen> {
  final AddEditUserRoleController _controller = Get.put(
    AddEditUserRoleController(),
  );

  @override
  void initState() {
    super.initState();
    _initialize();
    if (widget.cid != null) {
      _controller.selectedCompanyCode.value = widget.cid!;
    }

    if (widget.coName != null) {
      _controller.selectedCompany.value = widget.coName!;
    }

    if (widget.userTypeCode != null) {
      _controller.selectedUserTypeCode.value = widget.userTypeCode!;
      _controller.selectedUserType.value = _controller.userTypes.entries
          .firstWhere((ut) => ut.value == widget.userTypeCode)
          .key;
    }

    if (widget.seCodes != null) {
      _controller.seCodeController.text = widget.seCodes!;
    }

    if (widget.pCodes != null) {
      _controller.pCodeController.text = widget.pCodes!;
    }

    if (widget.ledgerStartDate != null) {
      _controller.ledgerStartDateController.text =
          DateFormat('dd-MM-yyyy').format(widget.ledgerStartDate!);
    }

    if (widget.ledgerEndDate != null) {
      _controller.ledgerEndDateController.text =
          DateFormat('dd-MM-yyyy').format(widget.ledgerEndDate!);
    }

    if (widget.isAppAccessAvailable != null) {
      _controller.appAccess.value = widget.isAppAccessAvailable!;
    }
  }

  void _initialize() async {
    await _controller.fetchCompanies();
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
                title: widget.isEdit ? 'Edit User Role' : 'Add User Role',
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
                      Obx(
                        () => CustomDropdownSearch(
                          items: _controller.companyNames,
                          onChanged: _controller.onCompany,
                          hintText: 'Company Name',
                          labelText: 'Company Name',
                          validatorText: 'Please select a company',
                          selectedItem:
                              _controller.selectedCompany.value.isNotEmpty
                                  ? _controller.selectedCompany.value
                                  : null,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomDropdownSearch(
                        items: _controller.userTypes.keys.toList(),
                        onChanged: _controller.onUserTypeSelected,
                        hintText: 'User Type',
                        labelText: 'User Type',
                        selectedItem:
                            _controller.selectedUserType.value.isNotEmpty
                                ? _controller.selectedUserType.value
                                : null,
                        validatorText: 'Please select a user type',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        controller: _controller.seCodeController,
                        hintText: 'SE Codes',
                        labelText: 'SE Codes',
                        validator: (value) {
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        controller: _controller.pCodeController,
                        hintText: 'P Codes',
                        labelText: 'P Codes',
                        validator: (value) {
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomDatePickerTextFormField(
                        dateController: _controller.ledgerStartDateController,
                        hintText: 'Ledger Start',
                        labelText: 'Ledger Start',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomDatePickerTextFormField(
                        dateController: _controller.ledgerEndDateController,
                        hintText: 'Ledger End',
                        labelText: 'Ledger End',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => SwitchListTile(
                          title: const Text(
                            'App Access',
                            style: TextStyle(
                              height: 1,
                              fontSize: 30,
                              color: Color(0xFF00BFFF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          activeColor: const Color(0xFF00BFFF),
                          activeTrackColor: const Color(0xFFFFFF00),
                          inactiveTrackColor: Colors.transparent,
                          inactiveThumbColor: const Color(0xFF00BFFF),
                          value: _controller.appAccess.value,
                          onChanged: (bool value) {
                            _controller.appAccess.value = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomElevatedButton(
                        title: 'Save',
                        onPressed: () {
                          if (_controller.formKey.currentState!.validate()) {
                            if (widget.isEdit) {
                              _controller.updateUserRoleDetails(
                                userId: widget.userId,
                              );
                            } else {
                              _controller.addUserRoleDetails(
                                userId: widget.userId,
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
