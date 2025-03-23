import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';

class CollectedItemOverlay extends PositionComponent {
  CollectedItemOverlay({
    super.priority = 100000000000000000,
    required this.path,
  });

  final String path;

  @override
  FutureOr<void> onLoad() async {
    size = GameConfig.screenSize;

    final sprite = SpriteComponent()
      ..sprite = await Sprite.load(path)
      ..size = Vector2(266.w, 265.h)
      ..position = GameConfig.screenSize / 2 - Vector2(266.w, 265.h) / 2;

    add(sprite);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.black.withOpacity(0.57);
    canvas.drawRect(size.toRect(), paint);
  }
}
