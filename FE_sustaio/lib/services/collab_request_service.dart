import 'dart:convert';

import 'package:gdsc_2024/services/api_service.dart';
import 'package:gdsc_2024/services/global.dart';
import 'package:http/http.dart' as http;

class CollabRequestService {
  Future<void> postCollabRequest(Map<String, dynamic> requestData) async {
    String? token = await getSavedToken();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/collab-requests'),
        headers: {'Authorization': '$token'},
        body: jsonEncode(requestData),
      );
      if (response.statusCode == 200) {
        // Successful POST request
        print('POST request successful');
        print('Response: ${response.body}');
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception(
            'Failed to make POST request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during POST request: $error');
      // Handle the error as needed
    }
  }
}
