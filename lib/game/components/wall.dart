import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:hidden_labyrinths/game/game.dart';

abstract class Wall extends SpriteComponent {
  Wall({super.position, this.isLong = true, this.torches})
      : super(priority: 1);

  final bool isLong;
  final List<Torch>? torches;

  void changeSkin();
}

class VerticalWall extends Wall {
  VerticalWall({
    super.isLong,
    this.isMiddle = false,
    this.isDestroyed = false,
    super.position,
    super.torches,
  });

  final bool isMiddle;
  final bool isDestroyed;
  final hitBox = RectangleHitbox();

  late final String path;

  bool isOld = false;

  @override
  FutureOr<void> onLoad() async {
    final Vector2 wallSize;

    isOld = false;

    if (isLong) {
      if (isMiddle) {
        path = GameConfig.verticaMiddleLongWallAsset;
      } else {
        path = GameConfig.verticalLongWallAsset;
      }

      wallSize = GameConfig.longVerticalWallSize;
    } else {
      if (isMiddle) {
        path = GameConfig.verticalMiddleShortWallAsset;
      } else {
        path = GameConfig.verticalShortWallAsset;
      }

      wallSize = GameConfig.shortVerticalWallSize;
    }

    size = wallSize;
    sprite = await Sprite.load(path);

    add(hitBox);

    if (torches != null) addAll(torches!);
    return super.onLoad();
  }

  @override
  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      final path = isDestroyed
          ? (isMiddle ? 'destroyed_wall_v_4.png' : 'destroyed_wall_v_3.png')
          : isLong
              ? 'destroyed_wall_v_1.png'
              : 'destroyed_wall_v_2.png';

      if (isDestroyed) hitBox.removeFromParent();
      sprite = await Sprite.load(path);
    } else {
      sprite = await Sprite.load(path);
    }

    if (torches != null) {
      for (var item in torches!) {
        item.changeSkin();
      }
    }
  }
}

class HorizontalWall extends Wall {
  HorizontalWall({super.isLong, super.position, super.torches});

  final hitBox = RectangleHitbox();

  late final String path;
  bool isOld = false;

  @override
  FutureOr<void> onLoad() async {
    final Vector2 wallSize;

    isOld = false;

    if (isLong) {
      path = GameConfig.horizontalLongWallAsset;
      wallSize = GameConfig.longHorizontalWallSize;
    } else {
      path = GameConfig.horizontalShortWallAsset;
      wallSize = GameConfig.shortHorizontalWallSize;
    }

    size = wallSize;
    sprite = await Sprite.load(path);

    add(hitBox);

    if (torches != null) addAll(torches!);
    return super.onLoad();
  }

  @override
  void changeSkin() async {
    isOld = !isOld;
    if (isOld) {
      final path = isLong ? 'destroyed_wall_h_1.png' : 'destroyed_wall_h_2.png';
      sprite = await Sprite.load(path);
    } else {
      sprite = await Sprite.load(path);
    }
    if (torches != null) {
      for (var item in torches!) {
        item.changeSkin();
      }
    }
  }
}
