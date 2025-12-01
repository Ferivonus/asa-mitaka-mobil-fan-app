import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/language.dart';
import '../data/asa_info_texts.dart';

class AnimeInfoPage extends StatefulWidget {
  const AnimeInfoPage({super.key});

  @override
  State<AnimeInfoPage> createState() => _AnimeInfoPageState();
}

class _AnimeInfoPageState extends State<AnimeInfoPage> {
  Language _currentLanguage = Language.en; // default dil

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language');

    setState(() {
      _currentLanguage = Language.values.firstWhere(
        (lang) => lang.name == savedLang,
        orElse: () => Language.en,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final texts = AsaInfoTexts(language: _currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.get("appBarTitle")),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texts.get("title"),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              Text(texts.get("intro"), style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/asa_intro.jpg'),
              const SizedBox(height: 20),
              Text(
                texts.get("specialWhy"),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/yoru.jpg'),
              const SizedBox(height: 20),
              Text(
                texts.get("yoruSection"),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/asa_denji.jpg'),
              const SizedBox(height: 20),
              Text(
                texts.get("denjiSection"),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                texts.get("themesSection"),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/asa_panel.jpg'),
              const SizedBox(height: 20),
              Text(
                texts.get("creatorSection"),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                texts.get("releaseInfo"),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/fujimoto_style.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
