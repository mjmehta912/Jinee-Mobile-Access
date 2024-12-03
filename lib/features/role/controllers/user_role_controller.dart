import 'package:get/get.dart';
import 'package:jinee_mobile_access/features/role/models/user_role_dm.dart';
import 'package:jinee_mobile_access/features/role/services/user_role_service.dart';

class UserRoleController extends GetxController {
  var isLoading = false.obs;
  var userRoles = <UserRoleDm>[].obs;

  var userTypes = {
    'Admin': 0,
    'Salesman': 1,
    'User': 2,
  }.obs;

  var selectedUserType = ''.obs;
  var selectedUserTypeCode = 0.obs;

  Future<void> fetchUserRoles({
    required int userId,
  }) async {
    try {
      isLoading(true);
      final fetchedUserRoles = await UserRoleService.fetchUserRoles(
        userId: userId,
      );
      userRoles.assignAll(fetchedUserRoles);
    } catch (e) {
      // print('Error');
    } finally {
      isLoading(false);
    }
  }
}
