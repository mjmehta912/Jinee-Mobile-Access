import 'package:get/get.dart';
import 'package:jinee_mobile_access/features/company/models/company_dm.dart';
import 'package:jinee_mobile_access/features/company/services/company_service.dart';

class CompanyController extends GetxController {
  var isLoading = false.obs;
  var companies = <CompanyDm>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    try {
      isLoading(true);
      final fetchedCompanies = await CompanyService.fetchCompanies();
      companies.assignAll(fetchedCompanies);
    } catch (e) {
      // print('Error');
    } finally {
      isLoading(false);
    }
  }
}
