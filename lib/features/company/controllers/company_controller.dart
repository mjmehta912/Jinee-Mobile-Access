import 'package:get/get.dart';
import 'package:jinee_mobile_access/features/company/models/company_dm.dart';
import 'package:jinee_mobile_access/features/company/services/company_service.dart';

class CompanyController extends GetxController {
  var isLoading = false.obs;
  var companies = <CompanyDm>[].obs;
  var searchQuery = ''.obs;

  List<CompanyDm> get filteredCompanies {
    if (searchQuery.value.isEmpty) {
      return companies;
    } else {
      return companies.where(
        (company) {
          return company.coName.toLowerCase().contains(
                    searchQuery.value.toLowerCase(),
                  ) ||
              company.databaseName.toLowerCase().contains(
                    searchQuery.value.toLowerCase(),
                  );
        },
      ).toList();
    }
  }

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
