import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:asa_mitaka_fan_app/data/language.dart';
import 'package:asa_mitaka_fan_app/data/messages.dart';

class CounterAsaPage extends StatefulWidget {
  const CounterAsaPage({super.key});

  @override
  State<CounterAsaPage> createState() => _CounterAsaPageState();
}

class _CounterAsaPageState extends State<CounterAsaPage> {
  int _counter = 0;
  AsaMode _currentMode = AsaMode.funny;
  late AsaMessages _messages;
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
      _messages = AsaMessages(language: _currentLanguage);
    });
  }

  String get _currentMessage {
    final list = _messages.getMessages(_currentMode);
    return list[_counter % list.length];
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleMode() {
    setState(() {
      _currentMode = _currentMode == AsaMode.funny
          ? AsaMode.romantic
          : AsaMode.funny;
      _counter = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${_messages.getUI("modeSwitchedSnack")}${_currentMode == AsaMode.funny ? _messages.getUI("modeFunny") : _messages.getUI("modeRomantic")}",
        ),
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  String get _modeLabel => _currentMode == AsaMode.funny
      ? _messages.getUI("modeFunny")
      : _messages.getUI("modeRomantic");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_messages.getUI("appBarTitle")),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: _toggleMode,
            tooltip: _messages.getUI("switchMode"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _toggleMode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: Text(
                _messages.getUI("switchMode"),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _modeLabel,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/asa-mitaka-cute-1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _currentMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _messages.getUI("counterLabel"),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: Text(
                _messages.getUI("clickButton"),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
