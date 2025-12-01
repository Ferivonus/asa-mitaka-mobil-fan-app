import 'language.dart';

class HomeTexts {
  final Language language;
  HomeTexts({this.language = Language.en});

  // Ana sayfa metinleri
  static const Map<String, Map<String, String>> _texts = {
    "tr": {
      "welcomeTitle": "Asa Mitaka Fan Uygulamasına Hoşgeldiniz!",
      "mainDescription":
          "Asa Mitaka, utangaç ama kararlı bir lise öğrencisidir. "
          "Yoru, Savaş Şeytanı, onun bedenine yerleşir ve Asa, korkularıyla, arkadaşlıklarıyla ve kişisel gelişimiyle yüzleşir. "
          "Bu yolculuk onu Chainsaw Man’in en sevilen karakterlerinden biri yapar.",
      "charactersButton": "Karakterler",
      "animeInfoButton": "Chainsaw Man & Asa",
      "counterButton": "Asa Mitaka Sayacı",
      "notesButton": "Notlar",
      "settingsButton": "Ayarlar",
      "footerText":
          "Asa Mitaka ve Tatsuki Fujimoto’nun Chainsaw Man dünyasına adanmış fan yapımı bir uygulama.",
      "footerLink":
          "Asa Mitaka ve Savaş Şeytanı hakkında daha fazla bilgi edinin.",
    },
    "en": {
      "welcomeTitle": "Welcome to the Asa Mitaka Fan App!",
      "mainDescription":
          "Asa Mitaka, the awkward yet strong-willed schoolgirl, becomes the host of Yoru, the War Devil. "
          "She navigates fear, friendships, and personal growth, making her one of the most beloved characters in Chainsaw Man.",
      "charactersButton": "Characters",
      "animeInfoButton": "Chainsaw Man & Asa",
      "counterButton": "Asa Mitaka Counter",
      "notesButton": "Notes",
      "settingsButton": "Settings",
      "footerText":
          "Fan-made app dedicated to Asa Mitaka & Tatsuki Fujimoto’s world of Chainsaw Man.",
      "footerLink": "Learn more about Asa Mitaka & the War Devil.",
    },
  };

  String get(String key) {
    return _texts[language.name]?[key] ?? _texts["en"]![key]!;
  }
}

// Dialog için ayrı bir class
class LanguagePromptTexts {
  final Language language;
  LanguagePromptTexts({this.language = Language.en});

  String get title {
    switch (language) {
      case Language.en:
        return "Select Language";
      case Language.tr:
        return "Dil Seçin";
    }
  }

  String get content {
    switch (language) {
      case Language.en:
        return "Please select the language for the app.";
      case Language.tr:
        return "Lütfen uygulama için bir dil seçin.";
    }
  }

  String get optionTr {
    return "Türkçe";
  }

  String get optionEn {
    return "English";
  }
}
