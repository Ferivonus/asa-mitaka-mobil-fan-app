// lib/data/character_data.dart
import 'language.dart';

class CharacterData {
  final Language language;

  CharacterData({this.language = Language.en});

  // Karakter açıklamaları
  static const Map<String, Map<String, String>> _descriptions = {
    "en": {
      'Denji':
          'A teenage devil hunter driven by simple desires — a normal life, affection, and comfort. Despite his crude personality, Denji has a strong sense of loyalty and an unbreakable will.',
      'Asa Mitaka':
          'A socially awkward high school girl burdened by guilt and trauma. After becoming the host of the War Devil, she struggles between her own identity and the violent impulses forced upon her.',
      'Yoru (War Devil)':
          'The War Devil, a ruthless and manipulative primal entity. Living inside Asa’s body, she aims to reclaim her former power and defeat Chainsaw Man, using Asa as both a host and a weapon.',
    },
    "tr": {
      'Denji':
          'Basit arzularla hareket eden bir genç şeytan avcısı — normal bir hayat, sevgi ve rahatlık. Kaba kişiliğine rağmen Denji, güçlü bir sadakat duygusuna ve kırılmaz bir iradeye sahiptir.',
      'Asa Mitaka':
          'Suçluluk ve travmayla yüklenmiş, sosyal açıdan çekingen bir lise öğrencisi. War Devil’in (Savaş Şeytanı) konukçusu olduktan sonra, kendi kimliği ile zorla empoze edilen şiddet eğilimleri arasında mücadele eder.',
      'Yoru (War Devil)':
          'Savaş Şeytanı, acımasız ve manipülatif bir ilkel varlıktır. Asa’nın bedeninde yaşayan Yoru, eski gücünü geri kazanmayı ve Chainsaw Man’i yenmeyi amaçlar; Asa’yı hem konuk hem de silah olarak kullanır.',
    },
  };

  // Karakter arkaplan bilgileri
  static const Map<String, Map<String, String>> _backgroundInfo = {
    "en": {
      'Denji': '''
Denji is the protagonist of Chainsaw Man. Orphaned at a young age and forced into debt, his only companion was Pochita, the Chainsaw Devil. After merging with Pochita, Denji became Chainsaw Man.

In Part 2, Denji attempts to live as an ordinary high school student while still battling devils. His interactions with Asa Mitaka lead him through both comedic and emotionally challenging situations, revealing his desire for genuine connection despite his chaotic life.
''',
      'Asa Mitaka': '''
Asa Mitaka is introduced in Part 2 of Chainsaw Man. She is quiet, insecure, and socially isolated, often overthinking her actions and fearing judgment. Her life changes drastically when she becomes the unwilling host of Yoru, the War Devil.

Their forced partnership leads Asa into a world of violence, devils, and conflicting identities. Asa’s development is driven by her desire to be understood while resisting Yoru’s manipulative intentions.
''',
      'Yoru (War Devil)': '''
Yoru, also known as the War Devil, is one of the Four Horsemen Devils. After losing much of her power, she seeks revenge on Chainsaw Man for consuming parts of her during previous wars.

She shares Asa’s body, often clashing with her host's emotions and moral hesitations. Yoru is aggressive, confident, and cunning, frequently pushing Asa toward violence to regain her strength.
''',
    },
    "tr": {
      'Denji': '''
Denji, Chainsaw Man’in başkahramanıdır. Genç yaşta yetim kalan ve borca zorlanan Denji’nin tek arkadaşı Pochita, Chainsaw Devil’dir. Pochita ile birleşince Denji, Chainsaw Man olur.

2. Kısımda Denji, şeytanlarla savaşmaya devam ederken sıradan bir lise öğrencisi gibi yaşamaya çalışır. Asa Mitaka ile etkileşimleri, onu hem komik hem de duygusal açıdan zorlayıcı durumlara sürükler ve kaotik hayatına rağmen gerçek bağlantılar kurma arzusunu ortaya çıkarır.
''',
      'Asa Mitaka': '''
Asa Mitaka, Chainsaw Man’in 2. Kısmında tanıtılır. Sessiz, güvensiz ve sosyal olarak izole bir karakterdir; eylemlerini fazla düşünür ve yargılanmaktan korkar. Hayatı, istemeden War Devil Yoru’nun konukçusu olduğunda dramatik bir şekilde değişir.

Zorunlu ortaklık Asa’yı şiddet, şeytanlar ve çelişkili kimliklerle dolu bir dünyaya sürükler. Asa’nın gelişimi, anlaşılma arzusu ve Yoru’nun manipülatif niyetlerine karşı direnme isteği ile şekillenir.
''',
      'Yoru (War Devil)': '''
Yoru, diğer adıyla Savaş Şeytanı, Dört Atlı Şeytan’dan biridir. Gücünün çoğunu kaybettikten sonra, önceki savaşlarda parçalarını tüketen Chainsaw Man’den intikam almak ister.

Asa’nın bedeniyle paylaşır ve genellikle konukçusunun duyguları ve ahlaki çekinceleriyle çatışır. Yoru agresif, kendine güvenen ve kurnazdır; Asa’yı gücünü geri kazanmak için şiddete yönlendirmeye sık sık zorlar.
''',
    },
  };

  String getDescription(String character) {
    return _descriptions[language.name]?[character] ??
        _descriptions["en"]![character]!;
  }

  String getBackgroundInfo(String character) {
    return _backgroundInfo[language.name]?[character] ??
        _backgroundInfo["en"]![character]!;
  }
}

// Sabit metinler için ayrı sınıf
class CharacterTexts {
  final Language language;

  CharacterTexts({this.language = Language.en});

  String get pageTitle {
    switch (language) {
      case Language.en:
        return 'Characters';
      case Language.tr:
        return 'Karakterler';
    }
  }

  String get descriptionLabel {
    switch (language) {
      case Language.en:
        return 'Description:';
      case Language.tr:
        return 'Açıklama:';
    }
  }

  String get backgroundLabel {
    switch (language) {
      case Language.en:
        return 'Background Info:';
      case Language.tr:
        return 'Arkaplan Bilgisi:';
    }
  }
}
