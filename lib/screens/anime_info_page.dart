import 'package:flutter/material.dart';
import '../data/asa_info_texts.dart';

class AnimeInfoPage extends StatelessWidget {
  final Language language;
  const AnimeInfoPage({super.key, this.language = Language.en});

  @override
  Widget build(BuildContext context) {
    final texts = AsaInfoTexts(language: language);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          language == Language.en ? 'About Asa Mitaka' : 'Asa Mitaka Hakkında',
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texts.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              Text(texts.intro, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/asa_intro.jpg'),
              const SizedBox(height: 20),
              Text(texts.specialWhy, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/yoru.jpg'),
              const SizedBox(height: 20),
              Text(texts.yoruSection, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/asa_denji.jpg'),
              const SizedBox(height: 20),
              Text(texts.denjiSection, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(texts.themesSection, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/asa_panel.jpg'),
              const SizedBox(height: 20),
              Text(texts.creatorSection, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(texts.releaseInfo, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Image.asset('lib/assets/images/fujimoto_style.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
