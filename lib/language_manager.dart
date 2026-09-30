import 'package:shared_preferences/shared_preferences.dart';
import 'app_language.dart';

class LanguageManager {
  static const String _languageKey = 'app_language';

  static Future<void> saveLanguage(AppLanguage language) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _languageKey,
      language.name,
    );
  }

  static Future<AppLanguage> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString(_languageKey);

    switch (savedLanguage) {
      case 'bangla':
        return AppLanguage.bangla;

      case 'english':
        return AppLanguage.english;

      case 'mixed':
        return AppLanguage.mixed;

      default:
        return AppLanguage.mixed;
    }
  }
}