import 'package:get/get.dart';
import 'package:jinee_mobile_access/features/user/models/user_dm.dart';
import 'package:jinee_mobile_access/features/user/services/user_service.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var users = <UserDm>[].obs;
  var searchQuery = ''.obs;

  // Computed property to filter users based on searchQuery
  List<UserDm> get filteredUsers {
    if (searchQuery.value.isEmpty) {
      return users;
    } else {
      return users.where(
        (user) {
          final query = searchQuery.value.toLowerCase();
          return user.fullName.toLowerCase().contains(query) ||
              user.userName.toLowerCase().contains(query) ||
              user.mobileNumber.contains(
                query,
              ); // mobileNumber is numeric but treated as a string
        },
      ).toList();
    }
  }

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
      // Handle error if needed
    } finally {
      isLoading(false);
    }
  }
}
