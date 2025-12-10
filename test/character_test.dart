import 'package:flutter_test/flutter_test.dart';
// تأكد أن 'untitled3' يطابق اسم مشروعك في ملف pubspec.yaml
import 'package:untitled3/models/character.dart';

void main() {
  group('Character Model Tests', () {
    test('fromJson converts JSON data to Character object correctly', () {
      // 1. Arrange: تحضير بيانات وهمية
      final Map<String, dynamic> json = {
        "id": 1,
        "name": "Rick Sanchez",
        "image": "https://example.com/rick.jpg",
        "species": "Human",
        "status": "Alive"
      };

      // 2. Act: تنفيذ كود التحويل
      final character = Character.fromJson(json);

      // 3. Assert: التأكد من النتائج
      expect(character.id, 1);
      expect(character.name, "Rick Sanchez");
      expect(character.species, "Human");
      expect(character.status, "Alive");
    });
  });
}