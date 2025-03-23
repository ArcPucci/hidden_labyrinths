import 'dart:async';

import 'package:flame/components.dart';
import 'package:hidden_labyrinths/game/game.dart';

class GameBG extends SpriteComponent {
  bool isOld = false;

  @override
  FutureOr<void> onLoad() async {
    priority = 0;
    size = Vector2(GameConfig.mapWidth, GameConfig.mapHeight);
    sprite = await Sprite.load("ancient_bg.png");
    return super.onLoad();
  }

  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      sprite = await Sprite.load('present_bg.png');
    } else {
      sprite = await Sprite.load('ancient_bg.png');
    }
  }
}
