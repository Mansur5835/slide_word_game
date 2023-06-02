import 'package:flutter/material.dart';
import 'package:slide_word_game/src/assets/assets.dart';
import 'package:slide_word_game/src/game/slide_word_game.dart';
import 'package:slide_word_game/src/utils/container_eatantion.dart';

class GameOverWidget extends StatelessWidget {
  static const String id = "game_over_widget";
  final SlideWordGame myGame;

  const GameOverWidget({Key? key, required this.myGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  Assets.dialogImage,
                )),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Game Over",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.orange,
                      fontFamily: "regular-game")),
              const SizedBox(
                height: 20,
              ),
              Text("Score: ${myGame.score.count}",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontFamily: "regular-game")),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                Assets.backButton,
                width: 80,
                height: 80,
              ).onTab(
                () {
                  myGame.removeGameOverView();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
