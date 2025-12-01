import 'package:asa_mitaka_fan_app/data/messages.dart';
import 'package:flutter/material.dart';

class CounterAsaPage extends StatefulWidget {
  const CounterAsaPage({super.key});

  @override
  State<CounterAsaPage> createState() => _CounterAsaPageState();
}

class _CounterAsaPageState extends State<CounterAsaPage> {
  int _counter = 0;

  AsaMode _currentMode = AsaMode.funny;

  String get _currentMessage {
    final list = _currentMode == AsaMode.funny
        ? AsaMessages.funnyMessages
        : AsaMessages.romanticMessages;
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

    // Küçük Snackbar efekti
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Mode switched to ${_currentMode == AsaMode.funny ? "Funny" : "Romantic"}!",
        ),
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  String get _modeLabel =>
      _currentMode == AsaMode.funny ? "Funny Mode" : "Romantic Mode";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asa Mitaka Counter'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: _toggleMode,
            tooltip: "Switch Mode",
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
              child: const Text("Switch Mode", style: TextStyle(fontSize: 16)),
            ),
            Text(
              _modeLabel,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Asa Image
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

            // Current Message
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

            const Text(
              'Counter:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 20),

            // Click button
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
              child: const Text('Click!', style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 20),

            // Mode switch button
          ],
        ),
      ),
    );
  }
}
