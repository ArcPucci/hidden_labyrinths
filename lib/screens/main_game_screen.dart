import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hidden_labyrinths/game/game.dart';
import 'package:provider/provider.dart';

class MainGameScreen extends StatefulWidget {
  const MainGameScreen({super.key});

  @override
  State<MainGameScreen> createState() => _MainGameScreenState();
}

class _MainGameScreenState extends State<MainGameScreen> {
  late final MyGame game;

  @override
  void initState() {
    super.initState();
    game = MyGame(Provider.of(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // canPop: false,
      child: GameWidget(
        game: game,
        overlayBuilderMap: {
          "gameOverlay": (context, MyGame game) => GameOverlay(game),
          "prizeOverlay": (context, MyGame game) => PrizeOverlay(game),
          "chestPrizesOverlay": (context, MyGame game) => ChestPrizesOverlay(game),
          "gameOverOverlay": (context, MyGame game) => GameOverOverlay(game),
        },
      ),
    );
  }
}
