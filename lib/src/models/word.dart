class Word {
  String word;
  List<Translate> translates;

  Word(this.word, this.translates);

  bool operator ==(Object other) {
    return (other is Word) && (word == other.word);
  }

  @override
  String toString() {
    // TODO: implement toString
    return '''
    word $word
    translate1 ${translates[0]}
    translate2 ${translates[1]}
    translate3 ${translates[2]}
    ''';
  }
}

class Translate {
  String word;
  bool isTrue;

  Translate(this.word, [this.isTrue = false]);

  @override
  String toString() {
    // TODO: implement toString
    return "word $word";
  }
}
