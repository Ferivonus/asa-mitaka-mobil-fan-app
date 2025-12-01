enum Language { en, tr }

class HomeTexts {
  final Language language;

  HomeTexts({this.language = Language.en});

  String get welcomeTitle {
    switch (language) {
      case Language.tr:
        return "Asa Mitaka Fan Uygulamasına Hoş Geldiniz!";
      case Language.en:
      default:
        return "Welcome to the Asa Mitaka Fan App!";
    }
  }

  String get mainDescription {
    switch (language) {
      case Language.tr:
        return """
Asa Mitaka, sosyal açıdan çekingen ama kararlı bir okul kızıdır. 
Yoru, War Devil, onun bedenine yerleşir ve Asa, korkularıyla, arkadaşlıklarıyla, kişisel gelişimiyle ve tüm kaotik anlarıyla başa çıkar. 
Bu yolculuk, onu Chainsaw Man evreninin en sevilen karakterlerinden biri yapar.""";
      case Language.en:
      default:
        return """
Asa Mitaka, the socially awkward yet strong-willed schoolgirl, becomes the host of Yoru, the War Devil. 
She navigates fear, friendships, personal growth, and all the chaotic moments, making her one of the most beloved characters in Chainsaw Man.""";
    }
  }

  String get charactersButton {
    switch (language) {
      case Language.tr:
        return "Karakterler";
      case Language.en:
      default:
        return "Characters";
    }
  }

  String get animeInfoButton {
    switch (language) {
      case Language.tr:
        return "Chainsaw Man & Asa";
      case Language.en:
      default:
        return "Chainsaw Man & Asa";
    }
  }

  String get counterButton {
    switch (language) {
      case Language.tr:
        return "Asa Mitaka Sayacı";
      case Language.en:
      default:
        return "Asa Mitaka Counter";
    }
  }

  String get notesButton {
    switch (language) {
      case Language.tr:
        return "Notlar";
      case Language.en:
      default:
        return "Notes";
    }
  }

  String get footerText {
    switch (language) {
      case Language.tr:
        return "Asa Mitaka ve Tatsuki Fujimoto’nun Chainsaw Man dünyasına adanmış hayran yapımı bir uygulama.";
      case Language.en:
      default:
        return "Fan-made app dedicated to Asa Mitaka & Tatsuki Fujimoto’s world of Chainsaw Man.";
    }
  }

  String get footerLink {
    switch (language) {
      case Language.tr:
        return "Asa Mitaka ve War Devil hakkında daha fazla bilgi edinin.";
      case Language.en:
      default:
        return "Learn more about Asa Mitaka & the War Devil.";
    }
  }
}
