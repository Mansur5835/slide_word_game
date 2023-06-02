import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:slide_word_game/src/slide_game.dart';

import '../assets/assets.dart';

class ParallaxWidget extends FlameGame with HasGameRef {

  @override
  Future<void> onLoad() async {
    final dd = await gameRef.loadParallaxComponent([
      ParallaxImageData(Assets.parallaxBack),
      ParallaxImageData(Assets.parallaxStars),
    ],
        repeat: ImageRepeat.repeat,
        baseVelocity: Vector2(0, -100),
        velocityMultiplierDelta: Vector2(0, 1.5));


    add(dd);
  }
}
