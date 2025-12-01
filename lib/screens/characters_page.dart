import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:asa_mitaka_fan_app/data/language.dart';
import 'package:asa_mitaka_fan_app/data/character_data.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
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
    final characterData = CharacterData(language: _currentLanguage);
    final texts = CharacterTexts(language: _currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.pageTitle),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CharacterCard(
              name: 'Denji',
              description: characterData.getDescription('Denji'),
              backgroundInfo: characterData.getBackgroundInfo('Denji'),
              imagePath: 'lib/assets/images/denji.jpg',
              texts: texts,
            ),
            CharacterCard(
              name: 'Asa Mitaka',
              description: characterData.getDescription('Asa Mitaka'),
              backgroundInfo: characterData.getBackgroundInfo('Asa Mitaka'),
              imagePath: 'lib/assets/images/asa.png',
              texts: texts,
            ),
            CharacterCard(
              name: 'Yoru (War Devil)',
              description: characterData.getDescription('Yoru (War Devil)'),
              backgroundInfo: characterData.getBackgroundInfo(
                'Yoru (War Devil)',
              ),
              imagePath: 'lib/assets/images/yoru.png',
              texts: texts,
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final String name;
  final String description;
  final String backgroundInfo;
  final String imagePath;
  final CharacterTexts texts;

  const CharacterCard({
    super.key,
    required this.name,
    required this.description,
    required this.backgroundInfo,
    required this.imagePath,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailPage(
              name: name,
              description: description,
              backgroundInfo: backgroundInfo,
              imagePath: imagePath,
              texts: texts,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterDetailPage extends StatelessWidget {
  final String name;
  final String description;
  final String backgroundInfo;
  final String imagePath;
  final CharacterTexts texts;

  const CharacterDetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.backgroundInfo,
    required this.imagePath,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), backgroundColor: Colors.deepPurple),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              texts.descriptionLabel,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            Text(
              texts.backgroundLabel,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(backgroundInfo, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
