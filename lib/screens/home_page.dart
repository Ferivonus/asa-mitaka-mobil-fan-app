import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/home_texts.dart';
import '../data/language.dart';
import '../main.dart'; // routeObserver için

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  Language _currentLanguage = Language.en; // default dil

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // HomePage'i routeObserver ile kaydet
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // RouteAware: başka sayfadan geri dönüldüğünde tetiklenir
  @override
  void didPopNext() {
    _loadLanguage(); // dili yeniden yükle
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language');

    if (savedLang == null) {
      _showLanguagePrompt();
    } else {
      setState(() {
        _currentLanguage = Language.values.firstWhere(
          (lang) => lang.name == savedLang,
          orElse: () => Language.en,
        );
      });
    }
  }

  Future<void> _showLanguagePrompt() async {
    final selected = await showDialog<Language>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Select Language / Dil Seçin'),
        content: const Text(
          'Please select the language for the app.\nLütfen uygulama için bir dil seçin.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, Language.tr),
            child: const Text('Türkçe'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, Language.en),
            child: const Text('English'),
          ),
        ],
      ),
    );

    if (selected != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', selected.name);

      setState(() {
        _currentLanguage = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final texts = HomeTexts(language: _currentLanguage);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Asa Mitaka Fan App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              texts.get("welcomeTitle"),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
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
                  texts.get("mainDescription"),
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 40),
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
                  label: Text(texts.get("charactersButton")),
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
                  label: Text(texts.get("animeInfoButton")),
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
                  label: Text(texts.get("counterButton")),
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
                  label: Text(texts.get("notesButton")),
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
                    Navigator.pushNamed(context, '/settings');
                  },
                  icon: const Icon(Icons.settings, size: 20),
                  label: const Text("Settings"),
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Text(
                    texts.get("footerText"),
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      texts.get("footerLink"),
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
          ],
        ),
      ),
    );
  }
}
