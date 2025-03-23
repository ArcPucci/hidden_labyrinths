import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';

class StartPoint extends SpriteComponent {
  bool isOld = false;

  @override
  FutureOr<void> onLoad() async {
    position = Vector2(GameConfig.mapWidth - 252.w * 1.5, 100.h);
    size = Vector2(252.w, 185.h);
    sprite = await Sprite.load('start_point.png');
    return super.onLoad();
  }

  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      sprite = await Sprite.load('start_point_2.png');
    } else {
      sprite = await Sprite.load('start_point.png');
    }
  }
}
