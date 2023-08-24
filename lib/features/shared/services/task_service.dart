import 'dart:convert';

import 'package:http/http.dart' as http;

class TaskService {
  const TaskService._();
  static const _baseUrl = "http://127.0.0.1:8082/";
  static Future<List<Map<String, dynamic>>> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(Uri.parse(endpoint), headers: headers);
    final responseBody = response.body;
    final List<Map<String, dynamic>> data = jsonDecode(responseBody);
    return data;
  }
}

enum EndPoints { gettasks, gettask, create, update, delete }
