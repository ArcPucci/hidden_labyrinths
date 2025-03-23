import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  final JoystickComponent joystick;
  late final SpriteAnimation idleAnimation;
  final double stepTime = 0.15;

  Vector2 velocity = Vector2.zero();

  final hitBox = CircleHitbox(
    radius: GameConfig.playerSize.x * 0.18,
    position: Vector2(70.w, 120.h),
  );

  bool _collidingWithWall = false;

  Player(this.joystick);

  @override
  FutureOr<void> onLoad() async {
    resetPos();

    priority = 12;
    size = GameConfig.playerSize;
    anchor = Anchor.center;

    final walk1 = await Sprite.load('player1.png');
    final walk2 = await Sprite.load('player2.png');

    final idleAnimation = SpriteAnimation.spriteList(
      [walk1],
      stepTime: stepTime,
      loop: false,
    );

    final runningAnimation = SpriteAnimation.spriteList(
      [walk1, walk2],
      stepTime: stepTime,
    );

    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
    };

    current = PlayerState.idle;
    add(hitBox);

    return super.onLoad();
  }

  void resetPos() {
    position = Vector2(
      GameConfig.mapWidth - GameConfig.playerSize.x * 1.5,
      200.h,
    );
    angle = 0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (joystick.isDragged && joystick.direction != JoystickDirection.idle) {
      current = PlayerState.running;
      angle = joystick.delta.screenAngle() - pi;

      if (_collidingWithWall) return;

      velocity = joystick.relativeDelta * 200;
      final newPos = position + velocity * dt;

      if (newPos.x > GameConfig.mapWidth / 2 - 100.w &&
          newPos.x < GameConfig.mapWidth / 2 + 100.w) {
        if (newPos.y < 170.h) return;
        position.y = newPos.y;
      }

      if (newPos.x > 170.w && newPos.x < GameConfig.mapWidth - 170.w) {
        if ((newPos.x < GameConfig.mapWidth / 2 - 100.w ||
                newPos.x > GameConfig.mapWidth / 2 + 100.w) &&
            newPos.y > GameConfig.mapHeight - 150.h) return;

        position.x = newPos.x;
      }

      if ((newPos.y > 170.h && newPos.y < GameConfig.mapHeight - 170.h) ||
          (newPos.y < 170.h && newPos.y > position.y) ||
          (newPos.y > GameConfig.mapHeight - 170.h && newPos.y < position.y)) {
        position.y = newPos.y;
      }

      if (position.y > GameConfig.mapHeight - 120.h) {
        gameRef.gameOver(true);
        return;
      }
    } else {
      current = PlayerState.idle;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Wall || other is DecorationItem) {
      _collidingWithWall = true;
    }

    if (other is Prize) {
      if (other.opacity == 0) return;

      if (other is! Chest) other.removeFromParent();
      final String path;

      if (other is Bag) {
        path = 'collected_bag.png';
        gameRef.gameManager.collectBag();
      } else if (other is Chest) {
        if (other.isOld) return;
        if (other.isOpened) return;
        if (gameRef.gameManager.hasKey) {
          path = 'collected_chest.png';
          other.open();
          gameRef.gameManager.openChest();
        } else {
          return;
        }
      } else {
        path = 'collected_key.png';
        gameRef.gameManager.collectKey();
      }

      gameRef.onCollectItem(path);
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is Wall || other is DecorationItem) _collidingWithWall = false;
  }
}
