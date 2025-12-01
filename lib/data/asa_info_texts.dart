enum Language { en, tr }

class AsaInfoTexts {
  final Language language;

  AsaInfoTexts({this.language = Language.en});

  String get title {
    switch (language) {
      case Language.tr:
        return "Asa Mitaka";
      case Language.en:
      default:
        return "Asa Mitaka";
    }
  }

  String get intro {
    switch (language) {
      case Language.tr:
        return """
Asa Mitaka, Chainsaw Man Part 2’nin merkezinde yer alan, içine kapanık ve sosyal açıdan çekingen bir kızdır. 
Hayatı ilk bakışta sıradan görünse de, yaşadığı büyük bir trajediyle birlikte dünyası değişir. 
Asa, bedenini War Devil (Yoru) ile paylaşmak zorunda kalır ve bu ikili, hem komik hem de duygusal bir yolculuğa çıkar.""";
      case Language.en:
      default:
        return """
Asa Mitaka, at the center of Chainsaw Man Part 2, is an introverted, socially awkward girl. 
Her life seems ordinary at first glance, but a major tragedy changes everything. 
Asa must share her body with the War Devil (Yoru), and together they embark on a journey that is both humorous and deeply emotional.""";
    }
  }

  String get specialWhy {
    switch (language) {
      case Language.tr:
        return """
Asa’nın özel olmasının sebebi, kahramanlık beklentisi olmadan kendi küçük evreninde hayatta kalmaya çalışan bir karakter olmasıdır. 
Yoru’nun agresif ve acımasız doğası ile Asa’nın kırılgan ve empatik kişiliği arasındaki kontrast, onları evrenin en ilginç ikilisi yapar.""";
      case Language.en:
      default:
        return """
What makes Asa special is that she is not driven by heroic ambitions, but tries to survive in her own small world. 
The contrast between Yoru’s aggressive and ruthless nature and Asa’s fragile and empathetic personality makes them one of the most fascinating duos in the universe.""";
    }
  }

  String get yoruSection {
    switch (language) {
      case Language.tr:
        return """
Yoru, yani War Devil, Asa’nın bedeninde güç kazanmak isteyen bir iblistir. 
İkilinin diyalogları çoğu zaman komik, bazen ürkütücü, bazen de hüzünlüdür. 
Asa her ne kadar Yoru’ya karşı koymak istese de, bazı sahnelerde tuhaf bir dayanışma hissi ortaya çıkar.""";
      case Language.en:
      default:
        return """
Yoru, the War Devil, is a demon seeking power through Asa’s body. 
Their dialogues are often humorous, sometimes frightening, and occasionally deeply sad. 
Although Asa tries to resist Yoru, in some scenes a strange sense of solidarity emerges between them.""";
    }
  }

  String get denjiSection {
    switch (language) {
      case Language.tr:
        return """
Asa ile Denji arasındaki ilişki sosyal açıdan felaket ama duygusal açıdan dokunaklıdır. 
Asa, Denji’nin kaotik enerjisine karşı genellikle ne yapacağını bilemez. 
İki karakterin utanç verici ama sıcak anları, serinin en insani sahnelerindendir.""";
      case Language.en:
      default:
        return """
The relationship between Asa and Denji is socially awkward but emotionally touching. 
Asa often doesn’t know how to react to Denji’s chaotic energy. 
Their embarrassing yet heartfelt moments are among the most human scenes in the series.""";
    }
  }

  String get themesSection {
    switch (language) {
      case Language.tr:
        return """
Asa’nın hikayesi, suçluluk, aidiyet arayışı, toplumsal kaygı ve insan ilişkilerinin karmaşıklığı üzerine kuruludur. 
İçsel çatışmalar, karakterin gelişiminde en önemli rolü oynar.""";
      case Language.en:
      default:
        return """
Asa’s story revolves around guilt, the search for belonging, social anxiety, and the complexity of human relationships. 
Internal conflicts play a central role in her character development.""";
    }
  }

  String get creatorSection {
    switch (language) {
      case Language.tr:
        return """
Asa Mitaka'nın yaratıcısı Tatsuki Fujimoto, karakter psikolojisini işleme konusunda modern manganın en güçlü isimlerinden biridir. 
Asa sahnelerindeki duygusal yoğunluk, Fujimoto’nun anlatım tarzının bir yansımasıdır.""";
      case Language.en:
      default:
        return """
Asa Mitaka’s creator, Tatsuki Fujimoto, is one of modern manga’s strongest figures in handling character psychology. 
The emotional intensity in Asa’s scenes reflects Fujimoto’s signature storytelling style.""";
    }
  }

  String get releaseInfo {
    switch (language) {
      case Language.tr:
        return """
Chainsaw Man Part 2, Asa Mitaka arc, 2022 yılında yayınlanmaya başladı ve kısa sürede büyük bir hayran kitlesi kazandı. 
Asa'nın sosyal kaygıları ve Denji ile olan tuhaf yakınlaşmaları, seriyi duygusal olarak benzersiz kılıyor.""";
      case Language.en:
      default:
        return """
Chainsaw Man Part 2, Asa Mitaka arc, began in 2022 and quickly gained a large fanbase. 
Asa’s social anxieties and her awkward interactions with Denji give the series a uniquely emotional tone.""";
    }
  }
}
