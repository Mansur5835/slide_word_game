import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:slide_word_game/src/camponents/parallax_comp.dart';

class SlideWordGame extends FlameGame {
  final parallax = ParallaxComp();

  @override
  Future<void> onLoad() async {
    add(parallax);
  }



  @override
  void update(double dt) {

      parallax.speet=200;
    super.update(dt);
  }
}

class Image extends SpriteComponent with HasAncestor, HasGameRef {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
