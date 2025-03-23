import 'dart:async';
import 'package:flame/components.dart';
import 'package:hidden_labyrinths/game/game.dart';

class MyWorld extends World with HasGameRef<MyGame> {
  MyWorld(this.player);

  final Player player;
  final StartPoint startPoint = StartPoint();

  final bg = GameBG();
  final bgFrame = GameBGFrame();

  List<SpriteComponent> walls = [];

  @override
  FutureOr<void> onLoad() async {
    add(bg);

    add(startPoint);
    _loadElements();

    add(player);
    add(bgFrame);

    return super.onLoad();
  }

  void reset() {
    for (var item in walls) {
      if (children.contains(item)) item.removeFromParent();
    }

    remove(bgFrame);

    if (bg.isOld) changeSkin();

    onLoad();
  }

  void _loadElements()  {
    final index = gameRef.configProvider.selectedLevel;
    walls = List<SpriteComponent>.from(GameMaps.gameMaps[index]);
    addAll(walls);
  }

  void changeSkin() {
    startPoint.changeSkin();
    bg.changeSkin();
    bgFrame.changeSkin();
    for (var item in children) {
      if (item is Prize) item.changeSkin();
      if (item is DecorationItem) item.changeSkin();
      if (item is Wall) item.changeSkin();
    }
  }
}
