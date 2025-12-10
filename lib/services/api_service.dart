import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  final String baseUrl = "https://rickandmortyapi.com/api/character";

  Future<List<Character>> getAllCharacters({int page = 1, String name = ""}) async {
    final String url = "$baseUrl/?page=$page&name=$name";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List results = data['results'];
        return results.map((e) => Character.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}
