import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://bakend';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> _saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }

  Future<http.Response> signIn(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signin'),
      // headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      await _saveToken(token);
    }
    return response;
  }

  Future<http.Response> loadData() async {
    final token = await getToken();
    return await http.get(
      Uri.parse('$baseUrl/data'),
      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
