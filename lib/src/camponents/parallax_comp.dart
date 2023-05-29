import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:slide_word_game/src/assets/assets.dart';

import '../game/slide_word_game.dart';

class ParallaxComp extends ParallaxComponent<SlideWordGame> {
  double speet = 100;

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax([
      ParallaxImageData(Assets.parallaxBack),
      ParallaxImageData(Assets.parallaxStars),
    ],
        repeat: ImageRepeat.repeat,
        baseVelocity: Vector2(0, -speet),
        velocityMultiplierDelta: Vector2(0, 1.5));
  }

  @override
  void update(double dt) {


    super.update(dt);
  }
}
