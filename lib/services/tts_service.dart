import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final TTSService _instance = TTSService._internal();
  factory TTSService() => _instance;
  TTSService._internal();

  late FlutterTts flutterTts;

  Future<void> init() async {
    flutterTts = FlutterTts();

    // Set default settings
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text, String languageCode) async {
    try {
      // Set language based on the language code
      switch (languageCode) {
        case 'en':
          await flutterTts.setLanguage("en-US");
          break;
        case 'hi':
          await flutterTts.setLanguage("hi-IN");
          break;
        case 'ta':
          await flutterTts.setLanguage("ta-IN");
          break;
        case 'te':
          await flutterTts.setLanguage("te-IN");
          break;
        case 'ml':
          await flutterTts.setLanguage("ml-IN");
          break;
        case 'kn':
          await flutterTts.setLanguage("kn-IN");
          break;
        case 'bn':
          await flutterTts.setLanguage("bn-IN");
          break;
        case 'gu':
          await flutterTts.setLanguage("gu-IN");
          break;
        case 'or':
          await flutterTts.setLanguage("or-IN");
          break;
        case 'pa':
          await flutterTts.setLanguage("pa-IN");
          break;
        case 'mr':
          await flutterTts.setLanguage("mr-IN");
          break;
        case 'ur':
          await flutterTts.setLanguage("ur-IN");
          break;
        default:
          await flutterTts.setLanguage("en-US");
      }

      await flutterTts.speak(text);
    } catch (e) {
      // In a production app, you might want to use a proper logging solution
      // For now, we'll just silently fail
      // print("Error speaking text: $e");
    }
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }
}
