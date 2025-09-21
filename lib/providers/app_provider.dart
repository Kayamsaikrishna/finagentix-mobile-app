import 'package:flutter/material.dart';
import '../services/translation_service.dart';
import '../services/tts_service.dart';

class AppProvider with ChangeNotifier {
  bool _isUserApp = true;
  bool _isTutorialEnabled = true;
  bool _isLoading = false;

  bool get isUserApp => _isUserApp;
  bool get isTutorialEnabled => _isTutorialEnabled;
  bool get isLoading => _isLoading;

  void toggleAppType() {
    _isUserApp = !_isUserApp;
    notifyListeners();
  }

  void setUserApp(bool value) {
    _isUserApp = value;
    notifyListeners();
  }

  void toggleTutorial() {
    _isTutorialEnabled = !_isTutorialEnabled;
    notifyListeners();
  }

  void setTutorialEnabled(bool value) {
    _isTutorialEnabled = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> speakWelcomeMessage() async {
    final translationService = TranslationService();
    final ttsService = TTSService();
    
    final welcomeMessage = translationService.translate('welcome_voice');
    await ttsService.speak(welcomeMessage, translationService.currentLanguage);
  }
}