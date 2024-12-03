import 'package:get/get.dart';
import 'package:jinee_mobile_access/common/helpers/snackbar.dart';
import 'package:jinee_mobile_access/features/right/models/user_rights_dm.dart';
import 'package:jinee_mobile_access/features/right/services/right_service.dart';

class RightController extends GetxController {
  var isLoading = false.obs;

  var menuAccess = <MenuAccess>[].obs;

  Future<void> fetchUserAccess({
    required int userId,
  }) async {
    isLoading(true);
    try {
      final response = await RightService.fetchUserAccess(
        userId: userId,
      );

      menuAccess.assignAll(response.menuAccess);
    } catch (e) {
      showErrorSnackbar(
        'Error',
        e.toString(),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateMenuAccess({
    required int userId,
    required int menuId,
    required bool newAccess,
  }) async {
    try {
      String successMessage = await RightService.setMenuAccess(
        userId: userId,
        menuId: menuId,
        access: newAccess,
      );

      await fetchUserAccess(
        userId: userId,
      );

      showSuccessSnackbar(
        'Success',
        successMessage,
      );
    } catch (e) {
      showErrorSnackbar(
        'Error',
        e.toString(),
      );
    }
  }
}
