import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/common/widgets/custom_text.dart';
import 'package:jinee_mobile_access/features/company/controllers/company_controller.dart';
import 'package:jinee_mobile_access/common/widgets/custom_card_text.dart';
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
          appBar: AppBar(
            title: const CustomText(
              title: 'Companies',
              fontSize: 40,
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
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
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
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF00FFFF),
                                Color(0xFF00BFFF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00FFFF).withOpacity(0.6),
                                offset: const Offset(4, 4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCardText(
                                  title: company.coName,
                                  fontSize: 30,
                                ),
                                CustomCardText(
                                  title: 'Company Code : ${company.coCode}',
                                ),
                                CustomCardText(
                                  title:
                                      'Database Name : ${company.databaseName}',
                                ),
                                CustomCardText(
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
