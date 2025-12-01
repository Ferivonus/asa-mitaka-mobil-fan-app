import 'language.dart';

enum AsaMode { funny, romantic }

class AsaMessages {
  final Language language;

  AsaMessages({this.language = Language.en});

  // Tüm mesajlar
  static const Map<String, Map<String, List<String>>> _messages = {
    "tr": {
      "funny": [
        "Asa: Ah… gerçekten beni motive etmemi mi bekliyorsun? Utangaçım.",
        "Asa: B-Böyle etkileşimlere alışkın değilim.",
        "Asa: Lütfen tıklarken bana bakmayı bırak.",
        "Asa: Kendimi rezil edersem suç senin.",
        "Asa: Yemin ederim normalim… muhtemelen.",
        "Asa: NEDEN GERİLİYORUM, SADECE BİR BUTON.",
        "Asa: Ah… sosyal becerilerim tıkladıkça düşüyor.",
        "Asa: Bu Denji ile konuşmaktan daha stresli.",
        "Asa: Tamam ama… doğru yapıyor muyum?",
        "Asa: Umarım kimse izlemiyordur. Bu berbat olurdu.",
      ],
      "romantic": [
        "Asa: Bunu senin için yapmıyorum!!! (…belki biraz.)",
        "Asa: Denji burada olsaydı… muhtemelen paniklerdim.",
        "Asa: Kalbim tıklaman kadar hızlı atıyor… aptal.",
        "Asa: Yanlış anlama… ama teşekkürler.",
        "Asa: Bu an için gülmeyi çalıştım…",
        "Asa: Bunu Denji’ye söylersen… öleceğim.",
        "Asa: Sen… aslında biraz iyi bir insansın. Bunu sevmiyorum.",
        "Asa: H-Hala neden tıklıyorsun?! Heyecanlı mısın yoksa?!",
        "Asa: Bu bir randevu olsaydı, her şeyi mahvediyor olurdum.",
        "Asa: Sanırım… böyle birlikte olmak o kadar da kötü değil.",
      ],
    },
    "en": {
      "funny": [
        "Asa: Uh… do you really expect me to motivate you? Awkward.",
        "Asa: I-I’m not used to this kind of interaction.",
        "Asa: Please stop staring at me while clicking.",
        "Asa: If I embarrass myself, it's your fault.",
        "Asa: I swear I’m normal… probably.",
        "Asa: WHY AM I GETTING NERVOUS IT’S JUST A BUTTON.",
        "Asa: Ugh… my social skills are dropping as you click.",
        "Asa: This is more stressful than talking to Denji.",
        "Asa: Okay but like… am I doing this right?",
        "Asa: I hope no one is watching us. That would be horrible.",
      ],
      "romantic": [
        "Asa: I’m not doing this for you!!! (…maybe a little.)",
        "Asa: If Denji were here… I’d probably panic.",
        "Asa: My heart beats faster than you click… idiot.",
        "Asa: Don’t get the wrong idea… but thanks.",
        "Asa: I practiced smiling for this moment…",
        "Asa: If you tell Denji about this, I’ll die.",
        "Asa: You’re… actually kind of nice. I hate it.",
        "Asa: W-Why are you still clicking?! Are you excited or something!?",
        "Asa: If this were a date I’d be ruining everything already.",
        "Asa: I guess… being together like this isn’t so bad.",
      ],
    },
  };

  // UI yazıları ayrı map
  static const Map<String, Map<String, String>> _uiTexts = {
    "tr": {
      "clickButton": "Tıkla!",
      "switchMode": "Mod Değiştir",
      "counterLabel": "Sayaç:",
      "appBarTitle": "Asa Mitaka Sayacı",
      "modeFunny": "Komik Mod",
      "modeRomantic": "Romantik Mod",
      "modeSwitchedSnack": "Mod değiştirildi: ",
    },
    "en": {
      "clickButton": "Click!",
      "switchMode": "Switch Mode",
      "counterLabel": "Counter:",
      "appBarTitle": "Asa Mitaka Counter",
      "modeFunny": "Funny Mode",
      "modeRomantic": "Romantic Mode",
      "modeSwitchedSnack": "Mode switched to ",
    },
  };

  List<String> getMessages(AsaMode mode) {
    return _messages[language.name]?[mode.name] ?? _messages["en"]![mode.name]!;
  }

  String getUI(String key) {
    return _uiTexts[language.name]?[key] ?? _uiTexts["en"]![key]!;
  }
}
