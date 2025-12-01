import 'package:asa_mitaka_fan_app/data/language.dart';
import 'package:asa_mitaka_fan_app/data/settings_texts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  final Language language;

  const SettingsPage({super.key, this.language = Language.tr});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Language _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.language;
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language');
    if (savedLang != null) {
      setState(() {
        _currentLanguage = Language.values.firstWhere(
          (e) => e.name == savedLang,
          orElse: () => Language.en,
        );
      });
    }
  }

  Future<void> _changeLanguage(Language lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang.name);
    setState(() {
      _currentLanguage = lang;
    });

    final texts = SettingsTexts(language: _currentLanguage);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(texts.snackBarLanguageSet)));
  }

  @override
  Widget build(BuildContext context) {
    final texts = SettingsTexts(language: _currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.pageTitle),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(texts.languageTurkish),
              leading: Radio<Language>(
                value: Language.tr,
                groupValue: _currentLanguage,
                onChanged: (value) {
                  if (value != null) _changeLanguage(value);
                },
              ),
            ),
            ListTile(
              title: Text(texts.languageEnglish),
              leading: Radio<Language>(
                value: Language.en,
                groupValue: _currentLanguage,
                onChanged: (value) {
                  if (value != null) _changeLanguage(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
