import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_word_game/src/assets/assets.dart';
import 'package:slide_word_game/src/utils/container_eatantion.dart';
import 'package:slide_word_game/src/widgets/parallax_widget.dart';
import 'package:slide_word_game/src/widgets/slide_word_game_widget.dart';

class SlideGame extends StatefulWidget {
  const SlideGame({Key? key}) : super(key: key);

  @override
  State<SlideGame> createState() => _SlideGameState();
}

class _SlideGameState extends State<SlideGame> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final myGame = ParallaxWidget();
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: myGame),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              Assets.playButton,
              width: 300,
              height: 50,
            ).onTab(() {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const SlideWordGameWidget();
              }));
            }),
          )
        ],
      ),
    );
  }
}
