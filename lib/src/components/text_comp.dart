import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/rendering.dart';
import 'package:slide_word_game/src/game/slide_word_game.dart';

class TextComp extends TextBoxComponent with HasGameRef<SlideWordGame> {
  TextComp()
      : super(
            anchor: Anchor.bottomCenter,
            align: Anchor.center,
            size: Vector2(170, 50));

  final style = TextStyle(
    color: BasicPalette.white.color,
    fontSize: 16,
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    textRenderer = TextPaint(style: style);
    x = gameRef.size.x / 6;
    y = 50;
  }
}
