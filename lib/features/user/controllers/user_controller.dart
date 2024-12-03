import 'package:get/get.dart';
import 'package:jinee_mobile_access/features/user/models/user_dm.dart';
import 'package:jinee_mobile_access/features/user/services/user_service.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var users = <UserDm>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      final fetchedUsers = await UserService.fetcUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      // print('Error');
    } finally {
      isLoading(false);
    }
  }
}
