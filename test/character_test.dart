import 'package:flutter_test/flutter_test.dart';
import 'package:untitled3/models/character.dart';

void main() {
  group('Character Model Tests', () {
    test('fromJson converts JSON data to Character object correctly', () {
      final Map<String, dynamic> json = {
        "id": 1,
        "name": "Rick Sanchez",
        "image": "https://example.com/rick.jpg",
        "species": "Human",
        "status": "Alive"
      };
      final character = Character.fromJson(json);

      expect(character.id, 1);
      expect(character.name, "Rick Sanchez");
      expect(character.species, "Human");
      expect(character.status, "Alive");
    });
  });
}