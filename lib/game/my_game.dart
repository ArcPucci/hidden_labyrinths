import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/providers/providers.dart';

class MyGame extends Forge2DGame with HasCollisionDetection {
  MyGame(this.configProvider) : super(gravity: Vector2.zero());

  final ConfigProvider configProvider;
  late JoystickComponent joystick;
  late MyWorld myWorld;
  late Player player;
  late CameraComponent cameraComponent;
  late GradientBackground bg;

  late GameManager gameManager;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    _init();
  }

  void _init() async {
    gameManager = GameManager(configProvider);

    add(gameManager);

    overlays.add('gameOverlay');

    joystick = JoystickComponent(
      priority: 100000000000,
      knob: SpriteComponent()
        ..sprite = await Sprite.load('joystick.png')
        ..size = GameConfig.joystickSize,
      background: SpriteComponent()
        ..sprite = await Sprite.load('joystick_frame.png')
        ..size = GameConfig.joystickFrameSize,
      position: Vector2(size.x / 2, size.y - 200),
    )..add(
        CircleComponent(
          radius: 100.r,
          position: Vector2(0, 0),
          paint: Paint()
            ..color = const Color(0xFFFFCC49).withOpacity(0.45)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20),
        ),
      );

    player = Player(joystick);
    myWorld = MyWorld(player);

    cameraComponent = CameraComponent.withFixedResolution(
      width: GameConfig.screenSize.x,
      height: GameConfig.screenSize.y,
      world: myWorld,
    );

    cameraComponent.setBounds(
      Rectangle.fromLTWH(0, 0, GameConfig.mapWidth, GameConfig.mapHeight),
      considerViewport: true,
    );

    add(myWorld);
    add(cameraComponent);

    bg = GradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 0.75, 1],
        colors: [
          const Color(0xFFEDA20E).withOpacity(0),
          const Color(0xFFEE8821).withOpacity(0.71),
          const Color(0xFF7A430A).withOpacity(0.82),
        ],
      ),
      size: Vector2(390.w, 406.h),
    );

    add(bg);
    add(joystick);
    cameraComponent.follow(player);
  }

  void newGame() async {
    overlays.clear();
    overlays.add('gameOverlay');

    player.resetPos();
    gameManager.init();
    myWorld.reset();
  }

  void onCollectItem(String path) async {
    final collectedItemOverlay = CollectedItemOverlay(path: path);
    add(collectedItemOverlay);

    await Future.delayed(const Duration(seconds: 1));
    remove(collectedItemOverlay);

    if (path.contains('bag')) showPrize();
  }

  void gameOver(bool won) {
    gameManager.stopTimer(won);
    overlays.add('gameOverOverlay');
  }

  void watchAd() {
    overlays.remove('gameOverOverlay');
    gameManager.addTime(3);
  }

  void goToExtraGame() {
    overlays.add('extraGameOverlay');
  }

  void closeExtraGameOverlay(int minutes) {
    overlays.remove('extraGameOverlay');
    if (minutes == 0) {
      gameOver(false);
      return;
    }
    gameManager.addTime(minutes);
  }

  void showPrize() {
    overlays.add('prizeOverlay');
  }

  void closePrizeOverlay() {
    overlays.remove('prizeOverlay');
  }

  void usePrize() {
    closePrizeOverlay();
    gameManager.usePrize();
  }

  void usePotion(ShopItem potion) {
    gameManager.usePotion(potion);
  }

  void showChestPrizes() {
    overlays.add('chestPrizesOverlay');
  }

  void closeChestPrizes() {
    overlays.remove('chestPrizesOverlay');
  }

  void changeSkin() {
    myWorld.changeSkin();
  }

  void nextLevel() {
    newGame();
  }
}
