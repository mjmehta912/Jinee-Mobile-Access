import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/widgets/app_appbar.dart';
import 'package:jinee_mobile_access/widgets/app_button.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';
import 'package:jinee_mobile_access/widgets/app_spacings.dart';
import 'package:jinee_mobile_access/widgets/app_text_form_field.dart';
import 'package:jinee_mobile_access/features/company/controllers/add_edit_company_controller.dart';

class AddEditCompanyScreen extends StatefulWidget {
  const AddEditCompanyScreen({
    super.key,
    required this.isEdit,
    this.companyName,
    this.companyCode,
    this.databaseName,
    this.serverId,
    this.cid,
  });

  final bool isEdit;

  final String? companyName;
  final int? companyCode;
  final String? databaseName;
  final int? serverId;
  final int? cid;

  @override
  State<AddEditCompanyScreen> createState() => _AddEditCompanyScreenState();
}

class _AddEditCompanyScreenState extends State<AddEditCompanyScreen> {
  final AddEditCompanyController _controller = Get.put(
    AddEditCompanyController(),
  );

  @override
  void initState() {
    super.initState();
    if (widget.companyName != null) {
      _controller.companyNameController.text = widget.companyName!;
    }

    if (widget.companyCode != null) {
      _controller.companyCodeController.text = widget.companyCode.toString();
    }

    if (widget.databaseName != null) {
      _controller.databaseNameController.text = widget.databaseName!;
    }

    if (widget.serverId != null) {
      _controller.serverIdController.text = widget.serverId.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: kColorBackground,
            appBar: AppAppbar(
              title: widget.isEdit ? 'Edit Company' : 'Add Company',
            ),
            body: Padding(
              padding: AppPaddings.p16,
              child: Form(
                key: _controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: _controller.companyNameController,
                        hintText: 'Company Name',
                        labelText: 'Company Name',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a company name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      AppSpaces.v16,
                      AppTextFormField(
                        controller: _controller.companyCodeController,
                        hintText: 'Company Code',
                        labelText: 'Company Code',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a company code';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      AppSpaces.v16,
                      AppTextFormField(
                        controller: _controller.databaseNameController,
                        hintText: 'Database Name',
                        labelText: 'Database Name',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a database name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      AppSpaces.v16,
                      AppTextFormField(
                        controller: _controller.serverIdController,
                        hintText: 'Server Id',
                        labelText: 'Server Id',
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Please enter a server id';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      AppSpaces.v40,
                      AppButton(
                        title: 'Save',
                        onPressed: () {
                          if (_controller.formKey.currentState!.validate()) {
                            if (widget.isEdit) {
                              _controller.updateCompanyDetails(
                                cid: widget.cid!,
                              );
                            } else {
                              _controller.addCompanyDetails(
                                cid: 0,
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
                      color: kColorPrimary,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
