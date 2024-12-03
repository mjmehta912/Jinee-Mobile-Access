import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jinee_mobile_access/features/company/models/company_dm.dart';

class CompanyService {
  static Future<List<CompanyDm>> fetchCompanies() async {
    final url = Uri.parse(
      'http://jineeapp.jineecs.in/api/access/company',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> companyList = json.decode(response.body)['company'];
      return companyList
          .map(
            (data) => CompanyDm.fromJson(data),
          )
          .toList();
    } else {
      throw 'Failed to load companies : ${response.statusCode}';
    }
  }

  static Future<String> updateCompany({
    required int cid,
    required String coName,
    required int coCode,
    required String databaseName,
    required int serverId,
  }) async {
    final Map<String, dynamic> requestBody = {
      "CID": cid,
      "CONAME": coName,
      "COCODE": coCode,
      "DatabaseName": databaseName,
      "ServerId": serverId,
    };

    final url = Uri.parse(
      'http://jineeapp.jineecs.in/api/access/updatecompany',
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
      if (responseData.containsKey('user')) {
        return responseData['user'][0]['message'] ?? 'No message available';
      } else {
        throw 'Message not found in response';
      }
    } else {
      throw 'Failed to update company: ${response.body}';
    }
  }

  static Future<String> addCompany({
    required int cid,
    required String coName,
    required int coCode,
    required String databaseName,
    required int serverId,
  }) async {
    final Map<String, dynamic> requestBody = {
      "CID": cid,
      "CONAME": coName,
      "COCODE": coCode,
      "DatabaseName": databaseName,
      "ServerId": serverId,
    };

    final url = Uri.parse(
      'http://jineeapp.jineecs.in/api/access/addcompany',
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
      if (responseData.containsKey('user')) {
        return responseData['user'][0]['message'] ?? 'No message available';
      } else {
        throw 'Message not found in response';
      }
    } else {
      throw 'Failed to add company: ${response.body}';
    }
  }
}
