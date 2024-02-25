import 'dart:convert';
import 'package:gdsc_2024/services/global.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<bool> loginUser(String username, String password) async {
    final Map<String, dynamic> requestBody = {
      "username": username,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/v1/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        await saveToken(response.body);
        return true;
      } else {
        print("Error: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }
}

Future<void> saveToken(String responseBody) async {
  try {
    final Map<String, dynamic> responseData = jsonDecode(responseBody);

    if (responseData.containsKey('token')) {
      final String accessToken = responseData['token'];
      print("Access Token: $accessToken");

      // Save to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', accessToken);
      print('Save token completed');
    }
  } catch (e) {
    print("Exception while saving token: $e");
  }
}

Future<String?> getSavedToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token');
}
