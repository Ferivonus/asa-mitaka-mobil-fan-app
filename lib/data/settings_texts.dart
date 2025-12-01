import 'language.dart';

class SettingsTexts {
  final Language language;

  SettingsTexts({required this.language});

  String get pageTitle {
    switch (language) {
      case Language.en:
        return "Settings";
      case Language.tr:
        return "Ayarlar";
    }
  }

  String get languageTurkish {
    switch (language) {
      case Language.en:
        return "Turkish";
      case Language.tr:
        return "Türkçe";
    }
  }

  String get languageEnglish {
    switch (language) {
      case Language.en:
        return "English";
      case Language.tr:
        return "İngilizce";
    }
  }

  String get snackBarLanguageSet {
    switch (language) {
      case Language.en:
        return "Language set to English";
      case Language.tr:
        return "Dil Türkçe olarak ayarlandı";
    }
  }
}
