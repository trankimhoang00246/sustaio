import 'dart:convert';
import 'package:gdsc_2024/model/collab_form.dart';
import 'package:gdsc_2024/model/user.dart';
import 'package:gdsc_2024/services/api_service.dart';
import 'package:gdsc_2024/services/global.dart';
import 'package:http/http.dart' as http;

class CollabService {
  Future<List<Collab>> getAllCollab() async {
    String? token =
        await getSavedToken(); // Replace with your actual authentication token

    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/collab'),
      headers: {'Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Collab.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Collab> getCollabById(int collabId) async {
    String? token =
        await getSavedToken(); // Replace with your actual authentication token

    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/collab/$collabId'),
      headers: {'Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return Collab.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user with ID: $collabId');
    }
  }
}


