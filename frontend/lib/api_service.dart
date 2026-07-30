import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://marketing-efficiency-lab-production.up.railway.app";

  static Future<Map<String, dynamic>> analyze(
      Map<String, dynamic> data) async {

    final response = await http.post(
      Uri.parse("$baseUrl/analyze"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception(response.body);
  }
}