import '../models/word.dart';
import 'assets.dart';

abstract class Source {
  static List<Word> words = [
    Word("Год", [Translate("Йил", true), Translate("Вақт"), Translate("Иш")]),
    Word("проблема",
        [Translate("история"), Translate("Муаммо", true), Translate("Иш")]),
    Word("группа",
        [Translate("Жараён"), Translate("Восита"), Translate("Гурух", true)]),
  ];

  static List<Word> wordsUsed = [];

 static List<String> images = [
    Assets.wordSlideComp1,
    Assets.wordSlideComp2,
    Assets.wordSlideComp3
  ];
}
