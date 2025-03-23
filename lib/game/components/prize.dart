import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:hidden_labyrinths/game/game.dart';

abstract class Prize extends SpriteComponent {
  Prize({required this.path, super.position, super.size});

  final String path;

  void changeSkin();
}

class Chest extends Prize {
  Chest({super.path = "chest.png", super.position});

  bool isOpened = false;
  bool isOld = false;

  @override
  FutureOr<void> onLoad() async {
    size = GameConfig.chestSize;

    sprite = await Sprite.load(path);

    add(RectangleHitbox());
    return super.onLoad();
  }

  void open() async {
    if (isOpened || isOld) return;
    isOpened = true;
    sprite = await Sprite.load('gold_chest.png');
  }

  @override
  void changeSkin() async {
    isOld = !isOld;

    if (isOld) {
      sprite = await Sprite.load('empty_chest.png');
    } else {
      final p = isOpened ? 'gold_chest.png' : path;
      sprite = await Sprite.load(p);
    }
  }
}

class GoldKey extends Prize {
  GoldKey({super.path = "key.png", super.position});

  bool isOld = false;
  late final Prize goldKey;

  @override
  FutureOr<void> onLoad() async {
    size = GameConfig.keySize;

    sprite = await Sprite.load(path);

    add(RectangleHitbox());

    goldKey = this;
    return super.onLoad();
  }

  @override
  void changeSkin() {
    isOld = !isOld;
    if (isOld) {
      opacity = 0;
    } else {
      opacity = 1;
    }
  }
}

class Bag extends Prize {
  Bag({super.path = "bag.png", super.position});

  bool isOld = false;
  late final Prize bag;

  @override
  FutureOr<void> onLoad() async {
    size = GameConfig.bagSize;

    sprite = await Sprite.load(path);

    add(RectangleHitbox());

    bag = this;
    return super.onLoad();
  }

  @override
  void changeSkin() {
    isOld = !isOld;

    if (isOld) {
      opacity = 0;
    } else {
      opacity = 1;
    }
  }
}
