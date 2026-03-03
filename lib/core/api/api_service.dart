import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService {

  static const String baseUrl = 'https://dummyjson.com/auth';

  Future<Map<String, dynamic>> post(
      String endpoint, {
        required Map<String, String> body,
      }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'), // append endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.headers['content-type']?.contains('application/json') ?? false) {
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          return data;
        } else {
          throw data['error'] ?? 'Something went wrong';
        }
      } else {
        throw 'Non-JSON response received: ${response.body}';
      }
    } catch (e) {
      throw 'API Error: $e';
    }
  }


}