import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_word_game/src/slide_game.dart';
import 'package:slide_word_game/src/widgets/parallax_widget.dart';
import 'package:slide_word_game/src/widgets/slide_word_game_widget.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: SlideGame(),
    );

  }
}
