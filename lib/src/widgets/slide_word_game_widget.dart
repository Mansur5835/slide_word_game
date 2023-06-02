import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slide_word_game/src/widgets/game_over_widget.dart';

import '../game/slide_word_game.dart';

class SlideWordGameWidget extends StatelessWidget {
  const SlideWordGameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myGame = SlideWordGame();
    return GameWidget(game: myGame, overlayBuilderMap: {
      GameOverWidget.id: (context, _) {
        return GameOverWidget(myGame: myGame);
      }
    });
  }
}
