class Language {
  final String code;
  final String name;
  final String flag;

  Language({
    required this.code,
    required this.name,
    required this.flag,
  });

  static List<Language> getLanguages() {
    return [
      Language(code: 'en', name: 'English', flag: '🇺🇸'),
      Language(code: 'hi', name: 'हिंदी', flag: '🇮🇳'),
      Language(code: 'ta', name: 'தமிழ்', flag: '🇮🇳'),
      Language(code: 'te', name: 'తెలుగు', flag: '🇮🇳'),
      Language(code: 'ml', name: 'മലയാളം', flag: '🇮🇳'),
      Language(code: 'kn', name: 'ಕನ್ನಡ', flag: '🇮🇳'),
      Language(code: 'bn', name: 'বাংলা', flag: '🇮🇳'),
      Language(code: 'gu', name: 'ગુજરાતી', flag: '🇮🇳'),
      Language(code: 'or', name: 'ଓଡ଼ିଆ', flag: '🇮🇳'),
      Language(code: 'pa', name: 'ਪੰਜਾਬੀ', flag: '🇮🇳'),
      Language(code: 'mr', name: 'मराठी', flag: '🇮🇳'),
      Language(code: 'ur', name: 'اردو', flag: '🇮🇳'),
    ];
  }
}