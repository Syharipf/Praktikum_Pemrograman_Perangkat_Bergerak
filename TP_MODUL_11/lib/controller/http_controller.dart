import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpController {
  final String baseUrl = "https://69230ad609df4a49232418f7.mockapi.io/users";

  Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  Future<bool> createUsers(String title, String desc) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {"title": title, "description": desc},
    );

    return response.statusCode == 201;
  }
}