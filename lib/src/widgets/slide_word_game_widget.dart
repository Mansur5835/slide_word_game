import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/slide_word_game.dart';

class SlideWordGameWidget extends StatelessWidget {
  const SlideWordGameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: SlideWordGame(),
    );
  }
}
