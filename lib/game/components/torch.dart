import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';

class Torch extends PositionComponent {
  Torch({super.position}) : super(priority: 5);

  bool isOld = false;

  late final SpriteAnimationComponent fire;
  late final SpriteComponent base;

  @override
  FutureOr<void> onLoad() async {
    isOld = false;
    size = GameConfig.torchSize;
    final fireFrames = [
      await Sprite.load('fire1.png'),
      await Sprite.load('fire2.png'),
      await Sprite.load('fire3.png'),
      await Sprite.load('fire4.png'),
    ];

    final fireAnimation = SpriteAnimation.spriteList(
      fireFrames,
      stepTime: 0.2,
    );

    fire = SpriteAnimationComponent()
      ..animation = fireAnimation
      ..size = GameConfig.torchFireSize;

    base = SpriteComponent()
      ..position = Vector2(7.w, 60.h)
      ..sprite = await Sprite.load('torch.png')
      ..size = GameConfig.torchBaseSize;

    add(base);
    add(fire);
    return super.onLoad();
  }

  void changeSkin() async {
    isOld = !isOld;
    if(isOld) {
      fire.removeFromParent();
      base.sprite = await Sprite.load('torch_base_2.png');
    } else {
      base.sprite = await Sprite.load('torch.png');
      add(fire);
    }
  }
}
