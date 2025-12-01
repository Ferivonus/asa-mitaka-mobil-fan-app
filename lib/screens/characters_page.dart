import 'package:asa_mitaka_fan_app/data/character_data.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CharacterCard(
              name: 'Denji',
              description: CharacterData.descriptions['Denji']!,
              imagePath: 'lib/assets/images/denji.jpg',
            ),
            CharacterCard(
              name: 'Asa Mitaka',
              description: CharacterData.descriptions['Asa Mitaka']!,
              imagePath: 'lib/assets/images/asa.jpg',
            ),
            CharacterCard(
              name: 'Yoru (War Devil)',
              description: CharacterData.descriptions['Yoru (War Devil)']!,
              imagePath: 'lib/assets/images/yoru.jpg',
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
  final String imagePath;

  const CharacterCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
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
              imagePath: imagePath,
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
  final String imagePath;

  const CharacterDetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final background =
        CharacterData.backgroundInfo[name] ?? 'No background found.';

    return Scaffold(
      appBar: AppBar(title: Text(name)),
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
              'Description:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            Text(
              'Background Info:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(background, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
