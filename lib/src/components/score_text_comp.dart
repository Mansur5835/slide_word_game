import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/rendering.dart';

class ScoreTextComp extends TextComponent {
  ScoreTextComp() : super(anchor: Anchor.topLeft);

  int count = 0;

  String score = "Score:";

  final style = TextStyle(
      color: BasicPalette.lightOrange.color,
      fontSize: 20,
      fontFamily: "regular-game");

  @override
  Future<void> onLoad() async {
    super.onLoad();
    textRenderer = TextPaint(style: style);
    position = Vector2(10, 10);
    text = score + count.toString();
  }

  setScore() {
    count++;
    text = score + count.toString();
  }
}
