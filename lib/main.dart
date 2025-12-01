import 'package:asa_mitaka_fan_app/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/characters_page.dart';
import 'screens/counter_asa_mitaka_page.dart';
import 'screens/anime_info_page.dart';
import 'screens/notes_page.dart';

// RouteObserver, sayfa geri dönüldüğünde güncelleme için global
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

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
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/characters': (context) => const CharactersPage(),
        '/anime-info': (context) => const AnimeInfoPage(),
        '/counter-asa-mitaka': (context) => const CounterAsaPage(),
        '/notes': (context) => const NotesPage(),
        '/settings': (context) => const SettingsPage(),
      },
      navigatorObservers: [routeObserver], // RouteObserver ekleniyor
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const HomePage());
      },
    );
  }
}
