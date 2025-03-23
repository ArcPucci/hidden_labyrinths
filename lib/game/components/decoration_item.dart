import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';

abstract class DecorationItem extends SpriteComponent {
  DecorationItem({required this.path, super.size, super.position})
      : super(priority: 1);

  final String path;

  void changeSkin();
}

class Bush1 extends DecorationItem {
  Bush1({super.path = 'bush.png', super.position});

  bool isOld = false;

  final hitBox = CircleHitbox(
    radius: GameConfig.bush1Size.y * 0.3,
    position: Vector2(30.r, 25.r),
  );

  @override
  FutureOr<void> onLoad() async {
    isOld = false;
    size = GameConfig.bush1Size;
    sprite = await Sprite.load(path);
    add(hitBox);
    return super.onLoad();
  }

  @override
  void changeSkin() async {
    isOld = !isOld;

    if (isOld) {
      sprite = await Sprite.load('bush2.png');
    } else {
      sprite = await Sprite.load(path);
    }
  }
}

class Bush2 extends DecorationItem {
  Bush2({super.path = "bush1.png", super.position});

  bool isOld = false;

  final hitBox = CircleHitbox(
    radius: GameConfig.bush1Size.x * 0.3,
    position: Vector2(25.r, 40.r),
  );

  @override
  FutureOr<void> onLoad() async {
    size = GameConfig.bush2Size;
    sprite = await Sprite.load(path);

    add(hitBox);
    return super.onLoad();
  }

  @override
  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      sprite = await Sprite.load('bush3.png');
    } else {
      sprite = await Sprite.load(path);
    }
  }
}

class Vase1 extends DecorationItem {
  Vase1({super.path = "vase1.png", super.position});

  bool isOld = false;
  final hitBox = RectangleHitbox();

  @override
  FutureOr<void> onLoad() async {
    size = GameConfig.vase1Size;
    sprite = await Sprite.load(path);

    add(hitBox);
    return super.onLoad();
  }

  @override
  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      sprite = await Sprite.load('broken_vase1.png');
    } else {
      sprite = await Sprite.load(path);
    }
  }
}

class Vase2 extends DecorationItem {
  Vase2({super.path = "vase2.png", super.position});

  bool isOld = false;
  final hitBox = RectangleHitbox();

  @override
  FutureOr<void> onLoad() async {
    size = GameConfig.vase2Size;
    sprite = await Sprite.load(path);

    add(hitBox);
    return super.onLoad();
  }

  @override
  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      sprite = await Sprite.load('broken_vase2.png');
    } else {
      sprite = await Sprite.load(path);
    }
  }
}
