import 'dart:async';

import 'package:flame/components.dart';
import 'package:hidden_labyrinths/game/game.dart';

class GameBGFrame extends SpriteComponent {
  bool isOld = false;

  @override
  FutureOr<void> onLoad() async {
    priority = 15;
    size = Vector2(GameConfig.mapWidth, GameConfig.mapHeight);
    sprite = await Sprite.load('ancient_bg_frame.png');
    return super.onLoad();
  }

  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      sprite = await Sprite.load('present_bg_frame.png');
    } else {
      sprite = await Sprite.load('ancient_bg_frame.png');
    }
  }
}
