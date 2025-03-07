import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/utils/app_dialog_utils.dart';
import 'package:jinee_mobile_access/features/company/controllers/company_controller.dart';
import 'package:jinee_mobile_access/features/company/services/company_service.dart';

class AddEditCompanyController extends GetxController {
  var isLoading = false.obs;

  var companyNameController = TextEditingController();
  var companyCodeController = TextEditingController();
  var databaseNameController = TextEditingController();
  var serverIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final CompanyController companyController = Get.find<CompanyController>();

  Future<void> updateCompanyDetails({
    required int cid,
  }) async {
    isLoading(true);
    try {
      String successMessage = await CompanyService.updateCompany(
        cid: cid,
        coName: companyNameController.text,
        coCode: int.parse(companyCodeController.text),
        databaseName: databaseNameController.text,
        serverId: int.parse(serverIdController.text),
      );

      await companyController.fetchCompanies();
      Get.back();
      showSuccessSnackbar(
        'Success',
        successMessage,
        bgColor: kColorSecondary,
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

  Future<void> addCompanyDetails({
    required int cid,
  }) async {
    isLoading(true);
    try {
      String successMessage = await CompanyService.addCompany(
        cid: cid,
        coName: companyNameController.text,
        coCode: int.parse(companyCodeController.text),
        databaseName: databaseNameController.text,
        serverId: int.parse(serverIdController.text),
      );

      await companyController.fetchCompanies();
      Get.back();
      showSuccessSnackbar(
        'Success',
        successMessage,
        bgColor: kColorSecondary,
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
