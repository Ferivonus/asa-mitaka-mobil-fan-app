import 'language.dart';

class NotesTexts {
  final Language language;

  NotesTexts({this.language = Language.en});

  final Map<String, Map<String, String>> _texts = {
    'en': {
      'pageTitle': 'Notes',
      'instructionTitle': 'Write down what’s on your mind.',
      'instructionSubtitle':
          'Thoughts, memories, things you don’t want to forget… everything stays on your device only.',
      'labelNote': 'Your note',
      'saveButton': 'Save',
      'viewNotesButton': 'View Notes',
      'emptyNotes': 'You haven’t written anything yet about Asa.',
      'snackbarSaved': 'Your note has been saved.',
    },
    'tr': {
      'pageTitle': 'Notlar',
      'instructionTitle': 'Aklındakileri yaz.',
      'instructionSubtitle':
          'Düşünceler, anılar, unutmak istemediklerin… her şey sadece cihazında kalır.',
      'labelNote': 'Notun',
      'saveButton': 'Kaydet',
      'viewNotesButton': 'Notları Görüntüle',
      'emptyNotes': 'Asa hakkında henüz bir şey yazmadınız.',
      'snackbarSaved': 'Notunuz kaydedildi.',
    },
  };

  String get pageTitle => _texts[language.name]!['pageTitle']!;
  String get instructionTitle => _texts[language.name]!['instructionTitle']!;
  String get instructionSubtitle =>
      _texts[language.name]!['instructionSubtitle']!;
  String get labelNote => _texts[language.name]!['labelNote']!;
  String get saveButton => _texts[language.name]!['saveButton']!;
  String get viewNotesButton => _texts[language.name]!['viewNotesButton']!;
  String get emptyNotes => _texts[language.name]!['emptyNotes']!;
  String get snackbarSaved => _texts[language.name]!['snackbarSaved']!;
}
