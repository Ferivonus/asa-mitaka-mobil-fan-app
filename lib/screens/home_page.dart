import 'package:flutter/material.dart';
import '../data/home_texts.dart';

class HomePage extends StatelessWidget {
  final Language language;
  const HomePage({super.key, this.language = Language.en});

  @override
  Widget build(BuildContext context) {
    final texts = HomeTexts(language: language);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Asa Mitaka Fan App',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Section
            Text(
              texts.welcomeTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Asa Mitaka main section
            Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'lib/assets/images/asa-mitaka-cute-1.png',
                  ),
                  radius: 60,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Asa Mitaka',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  texts.mainDescription,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Navigation Buttons
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/characters');
                  },
                  icon: const Icon(Icons.people, size: 20),
                  label: Text(texts.charactersButton),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/anime-info');
                  },
                  icon: const Icon(Icons.info, size: 20),
                  label: Text(texts.animeInfoButton),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/counter-asa-mitaka');
                  },
                  icon: const Icon(Icons.countertops, size: 20),
                  label: Text(texts.counterButton),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notes');
                  },
                  icon: const Icon(Icons.note_add, size: 20),
                  label: Text(texts.notesButton),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Footer Section
            const Divider(),
            Text(
              texts.footerText,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Add link action
              },
              child: Text(
                texts.footerLink,
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
