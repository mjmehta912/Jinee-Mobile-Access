import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';
import 'package:jinee_mobile_access/features/company/controllers/company_controller.dart';
import 'package:jinee_mobile_access/widgets/app_card_text.dart';
import 'package:jinee_mobile_access/features/company/screens/add_edit_company_screen.dart';

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
        Scaffold(
          backgroundColor: kColorWhite,
          appBar: AppBar(
            backgroundColor: kColorWhite,
            title: Text(
              'Companies',
              style: TextStyles.kSemiBoldMontserrat(
                fontSize: FontSize.k24FontSize,
              ),
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kColorBlack,
                size: 20,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(
                    () => const AddEditCompanyScreen(
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
                  color: kColorBlack,
                  size: 25,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: AppPaddings.p16,
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.companies.length,
                itemBuilder: (context, index) {
                  final company = _controller.companies[index];

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
                        transition: Transition.fade,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          color: kColorBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: kColorPrimary,
                            ),
                          ),
                          child: Padding(
                            padding: AppPaddings.p10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppCardText(
                                  title: company.coName,
                                  fontSize: FontSize.k26FontSize,
                                ),
                                AppCardText(
                                  title: 'Company Code : ${company.coCode}',
                                ),
                                AppCardText(
                                  title:
                                      'Database Name : ${company.databaseName}',
                                ),
                                AppCardText(
                                  title: 'Server ID : ${company.serverId}',
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
