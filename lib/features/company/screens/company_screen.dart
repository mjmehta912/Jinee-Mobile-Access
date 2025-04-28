import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_appbar.dart';
import 'package:jinee_mobile_access/widgets/app_button.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';
import 'package:jinee_mobile_access/features/company/controllers/company_controller.dart';
import 'package:jinee_mobile_access/widgets/app_card_text.dart';
import 'package:jinee_mobile_access/features/company/screens/add_edit_company_screen.dart';
import 'package:jinee_mobile_access/widgets/app_size_extensions.dart';
import 'package:jinee_mobile_access/widgets/app_spacings.dart';
import 'package:jinee_mobile_access/widgets/app_text_form_field.dart';

class CompanyScreen extends StatelessWidget {
  CompanyScreen({
    super.key,
  });

  final CompanyController _controller = Get.put(
    CompanyController(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: kColorBackground,
            appBar: AppAppbar(
              title: 'Companies',
              actions: [
                AppButton(
                  width: 0.30.screenWidth,
                  height: 35,
                  title: 'Add',
                  titleSize: FontSize.k14FontSize,
                  onPressed: () {
                    Get.to(
                      () => const AddEditCompanyScreen(
                        isEdit: false,
                      ),
                      transition: Transition.fadeIn,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                    );
                  },
                ),
              ],
            ),
            body: Padding(
              padding: AppPaddings.p16,
              child: Column(
                children: [
                  AppTextFormField(
                    onChanged: (value) {
                      _controller.searchQuery.value = value;
                    },
                    hintText: 'Search',
                    labelText: 'Search',
                    controller: TextEditingController(),
                    validator: (value) {
                      return null;
                    },
                  ),
                  AppSpaces.v20,
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: _controller.filteredCompanies.length,
                        itemBuilder: (context, index) {
                          final company = _controller.filteredCompanies[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => AddEditCompanyScreen(
                                  isEdit: true,
                                  cid: company.cid,
                                  companyName: company.coName,
                                  companyCode: company.coCode,
                                  databaseName: company.databaseName,
                                  serverId: company.serverId,
                                ),
                                transition: Transition.fadeIn,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Card(
                                  color: kColorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: AppPaddings.p10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppCardText(
                                          title: company.coName,
                                          fontSize: FontSize.k22FontSize,
                                        ),
                                        AppCardText(
                                          title:
                                              'Company Code : ${company.coCode}',
                                          fontSize: FontSize.k18FontSize,
                                        ),
                                        AppCardText(
                                          title:
                                              'Database Name : ${company.databaseName}',
                                          fontSize: FontSize.k18FontSize,
                                        ),
                                        AppCardText(
                                          title:
                                              'Server ID : ${company.serverId}',
                                          fontSize: FontSize.k18FontSize,
                                        ),
                                        const Row(),
                                      ],
                                    ),
                                  ),
                                ),
                                AppSpaces.v10,
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
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
