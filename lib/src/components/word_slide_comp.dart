import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:slide_word_game/src/assets/assets.dart';
import 'package:slide_word_game/src/components/other_word_comp.dart';
import 'package:slide_word_game/src/components/text_comp.dart';
import 'package:slide_word_game/src/game/slide_word_game.dart';

class WordSlideComp extends SpriteComponent
    with
        HasGameRef<SlideWordGame>,
        DragCallbacks,
        CollisionCallbacks,
        GestureHitboxes {
  TextComp textComponent = TextComp();
  late ShapeHitbox hitbox;
  SlideWordGame myGame;

  WordSlideComp(this.myGame);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(Assets.wordSlideComp1);
    size = Vector2(_getCompSize(), 50);
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 150);
    anchor = Anchor.center;

    final defaultPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
    add(textComponent);

    super.onLoad();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (_stopXLeft(event) || _stopXRight(event)) return;
    x = event.canvasPosition.x;
    super.onDragUpdate(event);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is OtherWordComp) {
      if (!other.translate.isTrue) {
        gameRef.pauseEngine();
        myGame.showGameOverView();
      }

      setScore();
    }

    super.onCollision(intersectionPoints, other);
  }

  double _getCompSize() {
    return gameRef.size.x / 3 - 8;
  }

  bool _stopXLeft(DragUpdateEvent event) {
    return (event.canvasPosition.x - gameRef.size.x / 6 + 8) < 0;
  }

  bool _stopXRight(DragUpdateEvent event) {
    return (event.canvasPosition.x + gameRef.size.x / 6) - 8 > gameRef.size.x;
  }

  setScore() {
    if (myGame.oneSetScore) {
      myGame.score.setScore();
      myGame.oneSetScore = false;
    }
  }
}
