// lib/data/asa_info_texts.dart
import 'language.dart';

class AsaInfoTexts {
  final Language language;
  AsaInfoTexts({this.language = Language.en});

  // Map of supported languages for AnimeInfoPage
  static const Map<String, Map<String, String>> _texts = {
    "tr": {
      "appBarTitle": "Asa Mitaka Hakkında",
      "title": "Asa Mitaka",
      "intro":
          "Asa Mitaka, sıradışı ve kararlı kişiliğiyle dikkat çeken bir lise öğrencisidir. "
          "Yoru, War Devil, onun bedenine yerleşir ve Asa, korkularıyla, arkadaşlıklarıyla ve kişisel gelişimiyle yüzleşir.",
      "specialWhy": "Asa Mitaka neden özel?",
      "yoruSection":
          "Yoru ile olan bağı, onun gücünü ve sorumluluklarını nasıl şekillendirdiğini gösteriyor.",
      "denjiSection":
          "Denji ile olan ilişkisi, karakter gelişimi ve etkileşimleri hikayenin duygusal derinliğini artırıyor.",
      "themesSection":
          "Manga, kişisel gelişim, yalnızlık, duygusal ifade ve arkadaşlık temalarını işliyor. Sanat stili karakterlerin duygularını yansıtıyor.",
      "creatorSection":
          "Yaratıcı: Tatsuki Fujimoto, Chainsaw Man'in de yaratıcısıdır. Asa Mitaka ile duygusal derinlik ve estetik bir hikaye sunuyor.",
      "releaseInfo":
          "Yayın tarihi: Temmuz 2021. Shonen Jump+ platformunda bir one-shot olarak yayımlandı.",
    },
    "en": {
      "appBarTitle": "About Asa Mitaka",
      "title": "Asa Mitaka",
      "intro":
          "Asa Mitaka is a socially awkward yet determined schoolgirl. She becomes the host of Yoru, the War Devil, "
          "and faces her fears, friendships, and personal growth throughout her journey.",
      "specialWhy": "Why Asa Mitaka is special",
      "yoruSection":
          "Her bond with Yoru demonstrates how her powers and responsibilities evolve.",
      "denjiSection":
          "Her relationship with Denji and interactions enrich the emotional depth of the story.",
      "themesSection":
          "The manga explores personal growth, loneliness, emotional expression, and friendship. "
          "Its art style reflects the characters' emotions vividly.",
      "creatorSection":
          "Creator: Tatsuki Fujimoto, also known for Chainsaw Man. Asa Mitaka showcases emotional depth and artistic storytelling.",
      "releaseInfo":
          "Release date: July 2021. Published as a one-shot on Shonen Jump+ platform.",
    },
  };

  String get(String key) {
    return _texts[language.name]?[key] ?? _texts["en"]![key]!;
  }
}
