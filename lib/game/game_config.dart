import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameConfig {
  static final double mapWidth = 1187.w;
  static final double mapHeight = 2401.h;
  static final Vector2 screenSize = Vector2(390.w, 844.h);
  static final Vector2 playerSize = Vector2(183.r, 247.r);
  static final Vector2 joystickFrameSize = Vector2(240.r, 250.r);
  static final Vector2 joystickSize = Vector2(98.r, 98.r);
  static final Vector2 longHorizontalWallSize = Vector2(244.w, 112.h);
  static final Vector2 shortHorizontalWallSize = Vector2(120.w, 112.h);
  static final Vector2 shortVerticalWallSize = Vector2(60.w, 122.h);
  static final Vector2 longVerticalWallSize = Vector2(60.w, 244.h);
  static final Vector2 bush1Size = Vector2(152.w, 129.h);
  static final Vector2 bush2Size = Vector2(157.w, 174.h);
  static final Vector2 vase1Size = Vector2(89.w, 142.h);
  static final Vector2 vase2Size = Vector2(114.w, 180.h);
  static final Vector2 torchBaseSize = Vector2(48.r, 48.r);
  static final Vector2 torchFireSize = Vector2(51.w, 74.h);
  static final Vector2 torchSize = Vector2(53.w, 106.h);
  static final Vector2 chestSize = Vector2(172.w, 130.h);
  static final Vector2 keySize = Vector2(107.w, 123.h);
  static final Vector2 bagSize = Vector2(97.w, 107.h);

  static const String verticalLongWallAsset = "vertical_wall_long.png";
  static const String verticalShortWallAsset = "vertical_wall_short.png";
  static const String verticaMiddleLongWallAsset =
      "vertical_wall_middle_long.png";
  static const String verticalMiddleShortWallAsset =
      "vertical_wall_middle_long.png";
  static const String horizontalShortWallAsset = "horizontal_wall_short.png";
  static const String horizontalLongWallAsset = "horizontal_wall_long.png";

  static const List<List<SpriteComponent>> maps = [

  ];
}
