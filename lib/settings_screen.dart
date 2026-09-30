import 'package:flutter/material.dart';

import 'app_language.dart';
import 'language_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppLanguage selectedLanguage = AppLanguage.mixed;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadSelectedLanguage();
  }

  Future<void> loadSelectedLanguage() async {
    final language = await LanguageManager.loadLanguage();

    if (!mounted) {
      return;
    }

    setState(() {
      selectedLanguage = language;
      isLoading = false;
    });
  }

  Future<void> changeLanguage(AppLanguage language) async {
    await LanguageManager.saveLanguage(language);

    if (!mounted) {
      return;
    }

    setState(() {
      selectedLanguage = language;
    });
  }

  String text(String key) {
    return AppLanguageData.text(
      selectedLanguage,
      key,
    );
  }

  String languageTitle(AppLanguage language) {
    switch (language) {
      case AppLanguage.bangla:
        return 'বাংলা';

      case AppLanguage.english:
        return 'English';

      case AppLanguage.mixed:
        return 'বাংলা + English';
    }
  }

  String languageDescription(AppLanguage language) {
    switch (language) {
      case AppLanguage.bangla:
        return text('full_app_bangla');

      case AppLanguage.english:
        return text('full_app_english');

      case AppLanguage.mixed:
        return text('bangla_english_together');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings / সেটিংস',
          ),
          backgroundColor: const Color(0xFF1565C0),
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          text('settings'),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          Text(
            text('language'),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            text('choose_language'),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 16),

          RadioGroup<AppLanguage>(
            groupValue: selectedLanguage,

            onChanged: (value) {
              if (value != null) {
                changeLanguage(value);
              }
            },

            child: Column(
              children: [
                Card(
                  child: RadioListTile<AppLanguage>(
                    value: AppLanguage.bangla,

                    title: Text(
                      languageTitle(
                        AppLanguage.bangla,
                      ),
                    ),

                    subtitle: Text(
                      languageDescription(
                        AppLanguage.bangla,
                      ),
                    ),
                  ),
                ),

                Card(
                  child: RadioListTile<AppLanguage>(
                    value: AppLanguage.english,

                    title: Text(
                      languageTitle(
                        AppLanguage.english,
                      ),
                    ),

                    subtitle: Text(
                      languageDescription(
                        AppLanguage.english,
                      ),
                    ),
                  ),
                ),

                Card(
                  child: RadioListTile<AppLanguage>(
                    value: AppLanguage.mixed,

                    title: Text(
                      languageTitle(
                        AppLanguage.mixed,
                      ),
                    ),

                    subtitle: Text(
                      languageDescription(
                        AppLanguage.mixed,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}