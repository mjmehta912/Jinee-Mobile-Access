import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jinee_mobile_access/features/role/models/user_role_dm.dart';

class UserRoleService {
  static Future<List<UserRoleDm>> fetchUserRoles({
    required int userId,
  }) async {
    final url = Uri.parse(
      'https://jineeapp.jineecs.in/api/access/userRole?userId=$userId',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userList = json.decode(response.body)['user'];
      return userList
          .map(
            (data) => UserRoleDm.fromJson(data),
          )
          .toList();
    } else {
      throw 'Failed to load users: ${response.statusCode}';
    }
  }

  static Future<String> updateUserRole({
    required int userId,
    required int userType,
    required int cid,
    required String seCode,
    required String pCode,
    String? ledgerStartDate,
    String? ledgerEndDate,
    required bool appAccess,
  }) async {
    final Map<String, dynamic> requestBody = {
      "USERID": userId,
      "USERTYPE": userType,
      "CID": cid,
      "SECODEs": seCode,
      "PCODEs": pCode,
      "LedgerStart": ledgerStartDate,
      "LedgerEnd": ledgerEndDate,
      "AppAccess": appAccess,
    };

    final url = Uri.parse(
      'https://jineeapp.jineecs.in/api/access/updateUserRole',
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('result')) {
        return responseData['result'][0]['message'] ?? 'No message available';
      } else {
        throw 'Message not found in response';
      }
    } else {
      throw 'Failed to update user: ${response.body}';
    }
  }

  static Future<String> addUserRole({
    required int userId,
    required int userType,
    required int cid,
    required String seCode,
    required String pCode,
    String? ledgerStartDate,
    String? ledgerEndDate,
    required bool appAccess,
  }) async {
    final Map<String, dynamic> requestBody = {
      "USERID": userId,
      "USERTYPE": userType,
      "CID": cid,
      "SECODEs": seCode,
      "PCODEs": pCode,
      "LedgerStart": ledgerStartDate,
      "LedgerEnd": ledgerEndDate,
      "AppAccess": appAccess,
    };

    final url = Uri.parse(
      'https://jineeapp.jineecs.in/api/access/addUserRole',
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('result')) {
        return responseData['result'][0]['message'] ?? 'No message available';
      } else {
        throw 'Message not found in response';
      }
    } else {
      throw 'Failed to update user: ${response.body}';
    }
  }
}
