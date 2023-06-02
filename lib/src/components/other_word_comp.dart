import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:slide_word_game/src/components/text_comp.dart';
import 'package:slide_word_game/src/game/slide_word_game.dart';
import 'package:slide_word_game/src/models/word.dart';

class OtherWordComp extends SpriteComponent
    with HasGameRef<SlideWordGame>, CollisionCallbacks {
  TextComp textComponent = TextComp();
  final String _backBox;
  late ShapeHitbox _hitbox;
  SlideWordGame? myGame;

  Translate _translate;

  double gravity = 2;
  bool stop = false;

  OtherWordComp(this._backBox, this._translate, [this.myGame]);

  Translate get translate => _translate;

  double setY = -100;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(_backBox);

    final defaultPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent;

    _hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(_hitbox);
    size = Vector2(_getCompSize(), 50);
    anchor = Anchor.center;
    add(textComponent..text = _translate.word);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (stop) return;
    y += gravity;

    if (y > gameRef.size.y) {
      y = setY;
      returnComp();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    removeComp();
    super.onCollision(intersectionPoints, other);
  }

  setGravity() {
    gravity += 1;
  }

  double _getCompSize() {
    return gameRef.size.x / 3 - 8;
  }

  set translate(Translate translate) {
    _translate = translate;
    textComponent.text = translate.word;
  }

  backBox(String backBox) async {
    sprite = await gameRef.loadSprite(backBox);
  }

  void removeComp() {
    add(OpacityEffect.to(
      0,
      EffectController(duration: 0.05),
    ));
    textComponent.text = "";
  }

  void returnComp() {
    add(OpacityEffect.to(
      1,
      EffectController(duration: 0.05),
    ));

    if (myGame == null) return;
    myGame!
      ..setRandomWord()
      ..oneSetScore = true;
  }
}
