import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/v1'));
  final username = 'user';
  final password = 'pass';

  login(String user, String pass) {
    if (user == username && pass == password) {
      return true;
    } else {
      return false;
    }
  }

  signup(String user, String pass, String email) {
    if (user != "" && pass != "" && email != "") {
      return true;
    } else {
      return false;
    }
  }

  Future<Response> getEmployees() async {
    final credentials = base64Encode(utf8.encode('$username:$password'));
    try {
      return await _dio.get(
        '/employees',
        options: Options(
          headers: {
            'Authorization': 'Basic $credentials',
          },
        ),
      );
    } catch (e) {
      throw Exception('Failed to load employees: $e');
    }
  }

  Future<Response> updateEmployee(
      String manpowerId, Map<String, dynamic> data) async {
    final credentials = base64Encode(utf8.encode('$username:$password'));
    try {
      return await _dio.patch(
        '/employees/$manpowerId',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Basic $credentials',
          },
        ),
      );
    } catch (e) {
      throw Exception('Failed to load employees: $e');
    }
  }

  Future<void> downloadEmployeesCsv() async {
    final credentials = base64Encode(utf8.encode('$username:$password'));
    try {
      final response = await _dio.get(
        '/employees/csv',
        options: Options(
          headers: {
            'Authorization': 'Basic $credentials',
          },
          responseType: ResponseType.bytes,
        ),
      );

      // Get the app's document directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/employees.csv';

      // Save the file
      final file = File(filePath);
      await file.writeAsBytes(response.data);

      print('File saved at $filePath');
    } catch (e) {
      throw Exception('Failed to download employees CSV: $e');
    }
  }
}
