import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _currentLanguage = "tr";

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('language') ?? "tr";
    });
  }

  Future<void> _changeLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
    setState(() {
      _currentLanguage = lang;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          lang == "en"
              ? "Language set to English"
              : "Dil Türkçe olarak ayarlandı",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: const Text("Türkçe"),
              leading: Radio<String>(
                value: "tr",
                groupValue: _currentLanguage,
                onChanged: (value) {
                  if (value != null) _changeLanguage(value);
                },
              ),
            ),
            ListTile(
              title: const Text("English"),
              leading: Radio<String>(
                value: "en",
                groupValue: _currentLanguage,
                onChanged: (value) {
                  if (value != null) _changeLanguage(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
