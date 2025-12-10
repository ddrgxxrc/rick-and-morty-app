import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/api_service.dart';

class CharactersProvider with ChangeNotifier {
  final ApiService _service = ApiService();

  List<Character> _characters = [];
  bool _isLoading = false;
  int _currentPage = 1;
  String _currentSearchQuery = "";
  bool _hasMoreData = true;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;

  Future<void> getCharacters({bool isRefresh = false}) async {
    if (_isLoading) return;

    if (isRefresh) {
      _currentPage = 1;
      _characters = [];
      _hasMoreData = true;
      _currentSearchQuery = "";
    }

    if (!_hasMoreData) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newCharacters = await _service.getAllCharacters(
        page: _currentPage,
        name: _currentSearchQuery,
      );

      if (newCharacters.isEmpty) {
        _hasMoreData = false;
      } else {
        _characters.addAll(newCharacters);
        _currentPage++;
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    _currentSearchQuery = query;
    _currentPage = 1;
    _characters = [];
    _hasMoreData = true;

    getCharacters();
  }
}