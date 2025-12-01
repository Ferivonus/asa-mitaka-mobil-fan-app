import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/characters_page.dart';
import 'screens/counter_asa_mitaka_page.dart';
import 'screens/anime_info_page.dart';
import 'screens/notes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const LookBackApp());
}

class LookBackApp extends StatelessWidget {
  const LookBackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Look Back Fan App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Ensure your app targets Material 3 components
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/characters': (context) => const CharactersPage(),
        '/anime-info': (context) => const AnimeInfoPage(),
        '/counter-asa-mitaka': (context) => const CounterAsaPage(),
        '/notes': (context) => const NotesPage(),
      },
      onUnknownRoute: (settings) {
        // Handle unknown routes gracefully, can navigate to a 404 page or error page
        return MaterialPageRoute(builder: (context) => const HomePage());
      },
    );
  }
}
