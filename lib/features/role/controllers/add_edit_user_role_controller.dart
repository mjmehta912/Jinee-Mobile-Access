import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/utils/app_dialog_utils.dart';
import 'package:jinee_mobile_access/features/company/models/company_dm.dart';
import 'package:jinee_mobile_access/features/company/services/company_service.dart';
import 'package:jinee_mobile_access/features/role/controllers/user_role_controller.dart';
import 'package:jinee_mobile_access/features/role/services/user_role_service.dart';

class AddEditUserRoleController extends GetxController {
  var isLoading = false.obs;

  var companies = <CompanyDm>[].obs;
  var companyNames = <String>[].obs;
  var selectedCompany = ''.obs;
  var selectedCompanyCode = 0.obs;
  var seCodeController = TextEditingController();
  var pCodeController = TextEditingController();
  var ledgerStartDateController = TextEditingController();
  var ledgerEndDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var userTypes = {
    'Admin': 0,
    'Salesman': 1,
    'User': 2,
  }.obs;

  var selectedUserType = ''.obs;
  var selectedUserTypeCode = 0.obs;

  var appAccess = false.obs;

  void onUserTypeSelected(String? value) {
    if (value != null) {
      selectedUserType.value = value;
      selectedUserTypeCode.value = userTypes.entries
          .firstWhere(
            (element) => element.key == value,
          )
          .value;
    }
  }

  Future<void> fetchCompanies() async {
    isLoading(true);
    try {
      final fetchedCompanies = await CompanyService.fetchCompanies();
      companies.assignAll(fetchedCompanies);
      companyNames.assignAll(
        companies
            .map(
              (company) => company.coName,
            )
            .toList(),
      );
    } catch (e) {
      // print('Error');
    } finally {
      isLoading(false);
    }
  }

  void onCompany(String? selectedValue) async {
    if (selectedValue == null) return;
    selectedCompany.value = selectedValue;

    final selectedCompanyObj = companies.firstWhere(
      (company) => company.coName == selectedValue,
    );
    selectedCompanyCode.value = selectedCompanyObj.cid;
  }

  final UserRoleController userRoleController = Get.find<UserRoleController>();

  Future<void> updateUserRoleDetails({
    required int userId,
  }) async {
    isLoading(true);
    try {
      String successMessage = await UserRoleService.updateUserRole(
        userId: userId,
        userType: selectedUserTypeCode.value,
        cid: selectedCompanyCode.value,
        seCode: seCodeController.text.isNotEmpty ? seCodeController.text : '',
        pCode: pCodeController.text.isNotEmpty ? pCodeController.text : '',
        ledgerStartDate: ledgerStartDateController.text.isNotEmpty
            ? DateFormat('yyyy-MM-dd').format(
                DateFormat('dd-MM-yyyy').parse(ledgerStartDateController.text),
              )
            : null,
        ledgerEndDate: ledgerEndDateController.text.isNotEmpty
            ? DateFormat('yyyy-MM-dd').format(
                DateFormat('dd-MM-yyyy').parse(ledgerEndDateController.text),
              )
            : null,
        appAccess: appAccess.value,
      );

      await userRoleController.fetchUserRoles(
        userId: userId,
      );
      Get.back();
      showSuccessSnackbar(
        'Success',
        successMessage,
        bgColor: kColorUserRole,
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

  Future<void> addUserRoleDetails({
    required int userId,
  }) async {
    isLoading(true);
    try {
      String successMessage = await UserRoleService.addUserRole(
        userId: userId,
        userType: selectedUserTypeCode.value,
        cid: selectedCompanyCode.value,
        seCode: seCodeController.text.isNotEmpty ? seCodeController.text : '',
        pCode: pCodeController.text.isNotEmpty ? pCodeController.text : '',
        ledgerStartDate: ledgerStartDateController.text.isNotEmpty
            ? DateFormat('yyyy-MM-dd').format(
                DateFormat('dd-MM-yyyy').parse(ledgerStartDateController.text),
              )
            : null,
        ledgerEndDate: ledgerEndDateController.text.isNotEmpty
            ? DateFormat('yyyy-MM-dd').format(
                DateFormat('dd-MM-yyyy').parse(ledgerEndDateController.text),
              )
            : null,
        appAccess: appAccess.value,
      );

      await userRoleController.fetchUserRoles(
        userId: userId,
      );
      Get.back();
      showSuccessSnackbar(
        'Success',
        successMessage,
        bgColor: kColorUserRole,
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
