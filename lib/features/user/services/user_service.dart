import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jinee_mobile_access/features/user/models/user_dm.dart';

class UserService {
  static Future<List<UserDm>> fetcUsers() async {
    final url = Uri.parse(
      'http://jineeapp.jineecs.in/api/access/user',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userList = json.decode(response.body)['user'];
      return userList
          .map(
            (data) => UserDm.fromJson(data),
          )
          .toList();
    } else {
      throw 'Failed to load users : ${response.statusCode}';
    }
  }

  static Future<String> updateUser({
    required int userId,
    required String fullName,
    required String userName,
    required String mobile,
    required String password,
    required int userType,
  }) async {
    final Map<String, dynamic> requestBody = {
      "USERID": userId,
      "FULLNAME": fullName,
      "USERNAME": userName,
      "MOBILENO": mobile,
      "PASSWORD": password,
      "USERTYPE": userType
    };

    final url = Uri.parse(
      'http://jineeapp.jineecs.in/api/access/updateuser',
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

  static Future<String> addUser({
    required int userId,
    required String fullName,
    required String userName,
    required String mobile,
    required String password,
    required int userType,
  }) async {
    final Map<String, dynamic> requestBody = {
      "USERID": userId,
      "FULLNAME": fullName,
      "USERNAME": userName,
      "MOBILENO": mobile,
      "PASSWORD": password,
      "USERTYPE": userType
    };

    final url = Uri.parse(
      'http://jineeapp.jineecs.in/api/access/adduser',
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
      throw 'Failed to add user ${response.body}';
    }
  }
}
