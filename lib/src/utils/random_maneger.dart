import 'dart:math';
import 'package:slide_word_game/src/assets/source.dart';
import 'package:slide_word_game/src/models/word.dart';

abstract class RandomManager {
  static Word getRandomWord() {
    List<Word> list = Source.words;
    List<Word> listUsed = Source.wordsUsed;
    if (list.isEmpty) {
      return listUsed[getRandomInt(listUsed.length)];
    }
    int index = getRandomInt(list.length);
    Word word = list.removeAt(index);
    listUsed.add(word);
    return word;
  }

  static int getRandomInt(int max) {
    return Random().nextInt(max);
  }

  static List<Word> getRandomWords(int max) {
    List<Word> list = Source.words;
    list.shuffle();
    return list;
  }

  static List<String> getRandomImages() {
    List<String> images = Source.images;
    images.add(images.removeAt(0));
    return images;
  }
}
