import 'dart:convert';

import 'package:jinee_mobile_access/features/right/models/user_rights_dm.dart';
import 'package:http/http.dart' as http;

class RightService {
  static Future<UserAccessResponse> fetchUserAccess({
    required int userId,
  }) async {
    final url = Uri.parse(
      'https://jineeapp.jineecs.in/api/User/userAccess?userId=$userId',
    );

    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkFkbWluIiwidXNlcklkIjoiMSIsInVzZXJUeXBlIjoiMCIsIkRhdGFiYXNlIjoiU1RBUlRSRUsiLCJDb21wYW55Q29kZSI6IjEiLCJjSWQiOiIyIiwic2VydmVySWQiOiIxIiwiU0VDT0RFIjoiIiwiUENPREUiOiIiLCJuYmYiOjE3MzMyMjA5MjksImV4cCI6MTczMzIyNDUyOSwiaWF0IjoxNzMzMjIwOTI5LCJpc3MiOiJKSU5FRSFORk9URUNIIiwiYXVkIjoiSklORUVBVSFFTkNFIn0.nG5ahQiCVYNt-qeUrGN8eh-Am55PyyVjz9AxoayR490';

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return UserAccessResponse.fromJson(responseData);
    } else {
      throw 'Failed to load user access data';
    }
  }

  static Future<String> setMenuAccess({
    required int userId,
    required int menuId,
    required bool access,
  }) async {
    final Map<String, dynamic> requestBody = {
      "UserId": userId,
      "MENUID": menuId,
      "Access": access,
    };

    final url = Uri.parse(
      'https://jineeapp.jineecs.in/api/User/setAccess',
    );

    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkFkbWluIiwidXNlcklkIjoiMSIsInVzZXJUeXBlIjoiMCIsIkRhdGFiYXNlIjoiU1RBUlRSRUsiLCJDb21wYW55Q29kZSI6IjEiLCJjSWQiOiIyIiwic2VydmVySWQiOiIxIiwiU0VDT0RFIjoiIiwiUENPREUiOiIiLCJuYmYiOjE3MzMyMjA5MjksImV4cCI6MTczMzIyNDUyOSwiaWF0IjoxNzMzMjIwOTI5LCJpc3MiOiJKSU5FRSFORk9URUNIIiwiYXVkIjoiSklORUVBVSFFTkNFIn0.nG5ahQiCVYNt-qeUrGN8eh-Am55PyyVjz9AxoayR490';

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('message')) {
        return responseData['message'];
      } else {
        throw 'Unexpected response format';
      }
    } else {
      throw 'Failed to update access: ${response.body}';
    }
  }
}
