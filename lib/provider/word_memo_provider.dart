import 'package:flutter/foundation.dart';
import 'package:shall_we_study_japanese/database/database.dart';
import 'package:shall_we_study_japanese/model/word_note.dart';

class WordMemoProvider with ChangeNotifier {

  static bool isFirst = true;

  List<WordNote> _words = [];

  int get getListSize => _words.length;

  Future<List<WordNote>> get getFutureWords {
    _fetchWordList();
    return DB().getAllWords();
  }

  List<WordNote> get getWords {
    _words.shuffle();
    return _words;
  }

  bool checkNullWords({
    @required String original,
    @required String meaning,
    String memo
  }) {
    if (original == '' || meaning == '') {
      return true;
    } else {
      WordNote wordNote = WordNote(
        originalWord: original,
        translationWord: meaning,
        memo: memo,
      );

      DB().insertWord(wordNote);
      notifyListeners();
      return false;
    }
  }

  deleteWord(int id) {
    DB().deleteWord(id);
    notifyListeners();
  }

  _fetchWordList() async {
    _words = await DB().getAllWords();
    notifyListeners();
  }

  List<WordNote> reloadingWordList({WordNote item}) {
    _words.remove(item);
    notifyListeners();
    return _words;
  }
}