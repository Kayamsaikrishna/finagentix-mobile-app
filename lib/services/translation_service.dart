import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationService {
  static final TranslationService _instance = TranslationService._internal();
  factory TranslationService() => _instance;
  TranslationService._internal();

  Map<String, dynamic> _translations = {};
  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;

  Future<void> init() async {
    // Load saved language from preferences
    final prefs = await SharedPreferences.getInstance();
    _currentLanguage = prefs.getString('selected_language') ?? 'en';

    // Load translations for the current language
    await loadTranslations(_currentLanguage);
  }

  Future<void> loadTranslations(String languageCode) async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/translations/$languageCode.json',
      );
      _translations = json.decode(jsonString);
      _currentLanguage = languageCode;

      // Save the selected language
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_language', languageCode);
    } catch (e) {
      // In a production app, you might want to use a proper logging solution
      // For now, we'll just silently fail and fall back to English
      // print('Error loading translations for $languageCode: $e');
      // Fallback to English
      if (languageCode != 'en') {
        await loadTranslations('en');
      }
    }
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }

  Future<void> changeLanguage(String languageCode) async {
    await loadTranslations(languageCode);
  }
}
