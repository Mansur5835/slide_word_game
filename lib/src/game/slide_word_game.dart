import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:slide_word_game/src/components/parallax_comp.dart';
import 'package:slide_word_game/src/utils/random_maneger.dart';
import 'package:slide_word_game/src/widgets/game_over_widget.dart';
import '../components/other_word_comp.dart';
import '../components/score_text_comp.dart';
import '../components/word_slide_comp.dart';

class SlideWordGame extends FlameGame with HasCollisionDetection {
  final _parallax = ParallaxComp();
  late final WordSlideComp _wordSlideComp;
  late final OtherWordComp _otherWordComp1;
  late final OtherWordComp _otherWordComp2;
  late final OtherWordComp _otherWordComp3;

  late final Timer timer;

  final score = ScoreTextComp();

  bool oneSetScore = true;

  SlideWordGame() {
    init();
  }

  init() {
    final word = RandomManager.getRandomWord();
    final images = RandomManager.getRandomImages();
    _otherWordComp1 = OtherWordComp(images[0], word.translates[0], this);
    _otherWordComp2 = OtherWordComp(images[1], word.translates[1]);
    _otherWordComp3 = OtherWordComp(images[2], word.translates[2]);
    _wordSlideComp = WordSlideComp(this)..textComponent.text = word.word;

    timer = Timer(10, repeat: true, onTick: () {
      _parallax.setSpeet();
      _otherWordComp1.setGravity();
      _otherWordComp2.setGravity();
      _otherWordComp3.setGravity();
    });

    timer.start();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    timer.update(dt);
  }

  @override
  Future<void> onLoad() async {
    Flame.device.fullScreen();

    setFirstRandomPosition();
    add(_parallax);
    add(_otherWordComp1);
    add(_otherWordComp2);
    add(_otherWordComp3);
    add(_wordSlideComp);
    add(score);
  }

  _getCompSize() {
    return size.x / 6 - 8;
  }

  setRandomWord() {
    final word = RandomManager.getRandomWord();
    final images = RandomManager.getRandomImages();

    _otherWordComp1
      ..backBox(images[0])
      ..translate = word.translates[0];
    _otherWordComp2
      ..backBox(images[1])
      ..translate = word.translates[1];
    _otherWordComp3
      ..backBox(images[2])
      ..translate = word.translates[2];
    _wordSlideComp.textComponent.text = word.word;
  }

  setFirstRandomPosition() {
    _otherWordComp1.position = Vector2(_getCompSize(), -100);
    _otherWordComp2.position = Vector2(size.x / 2, -100);
    _otherWordComp3.position = Vector2(size.x - _getCompSize(), -100);
  }

  showGameOverView() {
    overlays.add(GameOverWidget.id);
  }

  removeGameOverView() {
    overlays.remove(GameOverWidget.id);
  }
}
