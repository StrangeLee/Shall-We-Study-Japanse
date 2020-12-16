
class WordNote {
  final int id;
  final String originalWord;
  final String translationWord;
  final String memo;


  WordNote({this.id, this.originalWord, this.translationWord, this.memo});


  factory WordNote.fromJson(Map<String, dynamic> json) => WordNote(
    id: json['id'],
    memo: json['memo'],
    originalWord: json['original_word'],
    translationWord: json['translation_word']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "memo": memo,
    "original_word": originalWord,
    "translation_word": translationWord,
  };
}