import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';

class GameMaps {
  static final horizontalLongWallSize = GameConfig.longHorizontalWallSize;
  static final verticalLongWallSize = GameConfig.longVerticalWallSize;
  static final shortVerticalWallSize = GameConfig.shortVerticalWallSize;
  static final shortHorizontalWallSize = GameConfig.shortHorizontalWallSize;
  static final double horizontalPadding = 85.w;
  static final double verticalPadding = 85.h;

  static List<List<SpriteComponent>> get gameMaps => [
        [
          Chest(position: Vector2(162.w - horizontalPadding / 2, 141.h)),
          Bag(position: Vector2(949.w, 1361.h)),
          GoldKey(position: Vector2(150.w, 1300.h)),
          Bush2(position: Vector2(250.w, 1020.h)),
          VerticalWall(
            position: Vector2(720.w, verticalPadding),
            torches: [Torch(position: Vector2(0, 75.h))],
          ),
          VerticalWall(
            position: Vector2(480.w, verticalPadding),
            torches: [Torch(position: Vector2(0, 75.h))],
          ),
          HorizontalWall(
            position: Vector2(
              horizontalPadding,
              verticalLongWallSize.y + verticalPadding + 20.h,
            ),
            torches: [Torch(position: Vector2(90.w, -75.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x -
                  horizontalPadding,
              verticalLongWallSize.y + verticalPadding + 250.h,
            ),
            torches: [Torch(position: Vector2(148.w, -67.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2 -
                  verticalPadding,
              verticalLongWallSize.y + verticalPadding + 250.h,
            ),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2 -
                  horizontalPadding,
              verticalLongWallSize.y + verticalPadding + 250.h,
            ),
            torches: [Torch(position: Vector2(0, -63.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2 -
                  horizontalPadding,
              verticalLongWallSize.y * 3 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y / 2,
            ),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2 -
                  horizontalPadding,
              verticalLongWallSize.y * 2 + verticalPadding + 250.h,
            ),
            torches: [Torch(position: Vector2(0, 124.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x -
                  horizontalPadding -
                  verticalLongWallSize.x,
              verticalLongWallSize.y * 2 + verticalPadding + 250.h,
            ),
            torches: [
              Torch(position: Vector2(0, -63.h)),
              Torch(position: Vector2(0, 124.h)),
            ],
          ),
          HorizontalWall(
              isLong: false,
              position: Vector2(
                GameConfig.mapWidth -
                    shortHorizontalWallSize.x -
                    horizontalPadding,
                verticalLongWallSize.y * 3 +
                    verticalPadding +
                    250.h -
                    horizontalLongWallSize.y / 2,
              ),
              torches: [Torch(position: Vector2(0, -59.h))]),
          HorizontalWall(
            position: Vector2(
              -horizontalPadding / 3,
              verticalLongWallSize.y * 2 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              horizontalLongWallSize.x * 1.8 - verticalLongWallSize.x,
              verticalLongWallSize.y * 2 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
            torches: [Torch(position: Vector2(0, -66.h))],
          ),
          HorizontalWall(
            position: Vector2(
              0,
              verticalLongWallSize.y * 3.6 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y * 0.6,
            ),
          ),
          HorizontalWall(
            position: Vector2(
              horizontalLongWallSize.x - verticalLongWallSize.x + 5.w,
              verticalLongWallSize.y * 3.6 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y * 0.6,
            ),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              horizontalLongWallSize.x * 1.8 - verticalLongWallSize.x,
              verticalLongWallSize.y * 3 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
            torches: [Torch(position: Vector2(0, -66.h))],
          ),
          VerticalWall(
            isMiddle: true,
            isDestroyed: true,
            position: Vector2(
              horizontalLongWallSize.x * 1.8 - verticalLongWallSize.x,
              verticalLongWallSize.y * 4 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
          ),
          HorizontalWall(
            position: Vector2(
              0,
              verticalLongWallSize.y * 4.8 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y * 0.7,
            ),
          ),
          HorizontalWall(
            position: Vector2(
              horizontalLongWallSize.x - verticalLongWallSize.x + 10.w,
              verticalLongWallSize.y * 4.8 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y * 0.7,
            ),
            torches: [Torch(position: Vector2(190.w, -61.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2 -
                  horizontalPadding,
              verticalLongWallSize.y * 4 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y / 2,
            ),
            torches: [Torch(position: Vector2(0, -61.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x -
                  horizontalPadding,
              verticalLongWallSize.y * 4 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y / 2,
            ),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x -
                  horizontalPadding,
              verticalLongWallSize.y * 4 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y / 2,
            ),
            torches: [Torch(position: Vector2(0, -61.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x -
                  horizontalPadding,
              verticalLongWallSize.y * 6 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2 -
                  horizontalPadding,
              verticalLongWallSize.y * 6 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 3 +
                  verticalLongWallSize.x -
                  horizontalPadding,
              verticalLongWallSize.y * 6 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2 -
                  horizontalPadding,
              verticalLongWallSize.y * 5 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y / 2,
            ),
            torches: [Torch(position: Vector2(0, -61.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 3 +
                  verticalLongWallSize.x -
                  horizontalPadding,
              verticalLongWallSize.y * 7 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y * 1.2,
            ),
            torches: [Torch(position: Vector2(190.w, -61.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 3 +
                  verticalLongWallSize.x -
                  horizontalPadding,
              verticalLongWallSize.y * 6 +
                  verticalPadding +
                  250.h -
                  horizontalLongWallSize.y,
            ),
            torches: [Torch(position: Vector2(0, -61.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalPadding -
                  horizontalLongWallSize.x,
              GameConfig.mapHeight - verticalLongWallSize.y,
            ),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalPadding -
                  horizontalLongWallSize.x,
              GameConfig.mapHeight -
                  verticalLongWallSize.y * 2 +
                  horizontalLongWallSize.y / 2,
            ),
            torches: [Torch(position: Vector2(0, -61.h))],
          ),
          Bush1(position: Vector2(650.w, 1065.h)),
          Bush1(position: Vector2(700.w, 1310.h)),
          Bush1(position: Vector2(180.w, 1470.h)),
          Vase1(position: Vector2(330.w, 1450.h)),
          Vase2(position: Vector2(680.w, 560.h)),
          Bush2(position: Vector2(horizontalPadding - 50.w, 760.h)),
        ],
        [
          Bush1(position: Vector2(75.w, 1720.h)),
          Bush2(position: Vector2(575.w, 100.h)),
          HorizontalWall(
            position: Vector2(
              530.w - horizontalLongWallSize.x,
              verticalPadding +
                  verticalLongWallSize.y -
                  horizontalLongWallSize.y / 2,
            ),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(
              530.w,
              verticalPadding +
                  verticalLongWallSize.y -
                  horizontalLongWallSize.y / 2,
            ),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(720.w, verticalPadding),
            torches: [Torch(position: Vector2(0, 75.h))],
          ),
          HorizontalWall(
            position: Vector2(0, verticalPadding + 500.h),
            torches: [Torch(position: Vector2(120.w, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 1.6 -
                  horizontalPadding,
              verticalPadding + 500.h,
            ),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(800.w, verticalPadding + 500.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 1.6 -
                  horizontalPadding,
              verticalPadding + 1030.h,
            ),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2.6 -
                  horizontalPadding,
              verticalPadding + 1030.h,
            ),
            torches: [],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 3 -
                  horizontalPadding,
              verticalPadding + 1030.h,
            ),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              800.w,
              verticalPadding + verticalLongWallSize.y + 500.h,
            ),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              800.w,
              verticalPadding + verticalLongWallSize.y + 600.h,
            ),
            torches: [],
          ),
          HorizontalWall(
            position: Vector2(
              370.w,
              verticalPadding + verticalLongWallSize.y + 540.h,
            ),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              370.w,
              verticalPadding + verticalLongWallSize.y + 600.h,
            ),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(
              370.w,
              verticalPadding + verticalLongWallSize.y + 540.h,
            ),
            torches: [
              Torch(position: Vector2(0, -65.h)),
              Torch(position: Vector2(0, 190.h)),
            ],
          ),
          VerticalWall(
            position: Vector2(700.w, 1175.h),
            torches: [],
          ),
          HorizontalWall(
            position: Vector2(456.w, 1440.h),
            torches: [],
          ),
          HorizontalWall(
            position: Vector2(700.w, 1440.h),
            torches: [],
          ),
          HorizontalWall(
            position: Vector2(944.w, 1440.h),
            torches: [],
          ),
          HorizontalWall(
            position: Vector2(horizontalPadding / 2, 1840.h),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(185.w + horizontalPadding / 2, 1650.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(185.w + horizontalPadding / 2, 1406.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(700.w, 1250.h),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(850.w, 1450.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            isLong: false,
            position: Vector2(1080.w, 1880.h),
            torches: [],
          ),
          HorizontalWall(
            position: Vector2(850.w, 1880.h),
            torches: [],
          ),
          VerticalWall(
            isMiddle: true,
            isDestroyed: true,
            position: Vector2(850.w, 1694.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            position: Vector2(455.w, 1450.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(
              GameConfig.mapWidth -
                  horizontalLongWallSize.x * 2.25 -
                  horizontalPadding,
              verticalPadding + 500.h,
            ),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          Bush1(position: Vector2(650.w, 650.h)),
          Bush2(position: Vector2(550.w, 1180.h)),
          Vase1(position: Vector2(860.w, 600.h)),
          Vase2(position: Vector2(520.w, 1450.h)),
          Vase2(position: Vector2(760.w, 1120.h)),
          Bush2(position: Vector2(700.w, 1500.h)),
          Chest(position: Vector2(450.w, 980.h)),
          GoldKey(position: Vector2(950.w, 1550.h)),
          Bag(position: Vector2(450.w, 150.h)),
        ],
        [
          HorizontalWall(
            position: Vector2(600.w, 350.h),
            torches: [Torch(position: Vector2(180.w, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 350.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 594.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(position: Vector2(600.w, 844.h)),
          HorizontalWall(
            position: Vector2(844.w, 844.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(position: Vector2(900.w, 844.h)),
          HorizontalWall(
            position: Vector2(860.w, 600.h),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 650.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 894.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 894.h + 244.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 894.h + 244.h * 2),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(600.w, 1820.h),
            torches: [Torch(position: Vector2(180.w, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(356.w, 1820.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(horizontalPadding, 1500.h),
            torches: [Torch(position: Vector2(100.w, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(660.w, 1400.h),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(845.w, 1144.h),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(845.w, 1210.h),
            torches: [
              Torch(position: Vector2(0, 130.h)),
              Torch(position: Vector2(0, -65.h)),
            ],
          ),
          VerticalWall(
            isMiddle: true,
            isDestroyed: true,
            position: Vector2(845.w, 900.h),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 894.h + 244.h * 3),
          ),
          HorizontalWall(
            position: Vector2(355.w, 350.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(position: Vector2(355.w, 1200.h)),
          HorizontalWall(position: Vector2(255.w, 1200.h)),
          VerticalWall(
            isMiddle: true,
            position: Vector2(380.w, 1010.h),
            torches: [Torch(position: Vector2(0, 130.h))],
          ),
          HorizontalWall(
            position: Vector2(horizontalPadding, 650.h),
            torches: [Torch(position: Vector2(120.w, -65.h))],
          ),
          Bush1(position: Vector2(450.w, 400.h)),
          Bush1(position: Vector2(660.w, 400.h)),
          Bush2(position: Vector2(85.w, 700.h)),
          Bush2(position: Vector2(85.w, 1550.h)),
          Vase1(position: Vector2(660.w, 1430.h)),
          Vase2(position: Vector2(490.w, 1200.h)),
          Bush1(position: Vector2(750.w, 1450.h)),
          GoldKey(position: Vector2(700.w, 1250.h)),
          Chest(position: Vector2(900.w, 710.h)),
          Bag(position: Vector2(480.w, 1080.h)),
        ],
        [
          GoldKey(position: Vector2(750.w, 1170.h)),
          Bush2(position: Vector2(600.w, 620.h)),
          Bush2(position: Vector2(920.w, 1250.h)),
          VerticalWall(
            isMiddle: true,
            position: Vector2(750.w, verticalPadding),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(750.w, verticalPadding + 244.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(564.w, verticalPadding + 244.h * 3 - 50.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(750.w, verticalPadding + 244.h * 2),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(position: Vector2(860.w, 1400.h)),
          HorizontalWall(position: Vector2(632.w, 1294.h)),
          VerticalWall(isMiddle: true, position: Vector2(860.w, 1206.h)),
          VerticalWall(
            isMiddle: true,
            position: Vector2(860.w, 1050.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(616.w, 1050.h),
            torches: [Torch(position: Vector2(15.w, -65.h))],
          ),
          HorizontalWall(position: Vector2(372.w, 1050.h)),
          HorizontalWall(position: Vector2(332.w, 1050.h)),
          VerticalWall(
            isMiddle: true,
            position: Vector2(332.w, 856.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(332.w, 612.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(position: Vector2(332.w, 368.h)),
          VerticalWall(
            isMiddle: true,
            position: Vector2(332.w, 368.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(position: Vector2(332.w, 1100.h)),
          VerticalWall(
            isMiddle: true,
            position: Vector2(332.w, 1588.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(332.w, 1832.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(332.w, 2076.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isDestroyed: true,
            isMiddle: true,
            position: Vector2(632.w, 1100.h),
          ),
          HorizontalWall(
            position: Vector2(860.w, 1700.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(616.w, 1700.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            isLong: false,
            position: Vector2(horizontalPadding - 20.w, 1800.h),
            torches: [Torch(position: Vector2(30.w, -65.h))],
          ),
          VerticalWall(
            position: Vector2(820.w, 1750.h),
            torches: [Torch(position: Vector2(0, 60.h))],
          ),
          Vase1(position: Vector2(390.w, 380.h)),
          Vase2(position: Vector2(400.w, 1050.h)),
          Vase2(position: Vector2(710.w, 1680.h)),
          Bush1(position: Vector2(710.w, 1350.h)),
          Bush2(position: Vector2(40.w, 1880.h)),
          Chest(position: Vector2(60.w, 2100.h)),
          Bag(position: Vector2(920.w, 1800.h)),
        ],
        [
          Bush2(position: Vector2(970.w, 750.h)),
          HorizontalWall(position: Vector2(horizontalPadding, 850.h)),
          HorizontalWall(position: Vector2(horizontalPadding + 45.w, 850.h)),
          VerticalWall(
            isMiddle: true,
            position: Vector2(750.w, verticalPadding),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(566.w, verticalPadding + 244.h * 2 - 50.h),
          ),
          HorizontalWall(
            position: Vector2(540.w, verticalPadding + 244.h * 2 - 50.h),
          ),
          HorizontalWall(
            position: Vector2(340.w, verticalPadding + 244.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(540.w, verticalPadding + 244.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(750.w, verticalPadding + 244.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(860.w, 900.h),
            torches: [Torch(position: Vector2(85.w, -65.h))],
          ),
          VerticalWall(position: Vector2(810.w, 820.h)),
          VerticalWall(position: Vector2(560.w, 820.h)),
          HorizontalWall(
            position: Vector2(316.w, 900.h),
            torches: [Torch(position: Vector2(120.w, -65.h))],
          ),
          HorizontalWall(position: Vector2(horizontalPadding, 600.h)),
          HorizontalWall(
            position: Vector2(horizontalPadding + 40.w, 600.h),
            torches: [Torch(position: Vector2(180.w, -65.h))],
          ),
          VerticalWall(
            position: Vector2(316.w, 900.h),
          ),
          HorizontalWall(
            position: Vector2(650.w, 1300.h),
            torches: [Torch(position: Vector2(100.w, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(750.w, 1350.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(position: Vector2(750.w, 1782.h)),
          HorizontalWall(
            position: Vector2(900.w, 1782.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(750.w, 1594.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(318.w, 1544.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(506.w, 1782.h),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(506.w, 1594.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            isDestroyed: true,
            position: Vector2(315.w, 656.h),
          ),
          Vase2(position: Vector2(420.w, 320.h)),
          Vase1(position: Vector2(380.w, 920.h)),
          Vase2(position: Vector2(390.w, 1520.h)),
          Bush2(position: Vector2(950.w, 950.h)),
          Bush1(position: Vector2(970.w, 1660.h)),
          Bag(position: Vector2(620.w, 400.h)),
          GoldKey(position: Vector2(100.w, 700.h)),
          Chest(position: Vector2(570.w, 1650.h)),
        ],
        [
          GoldKey(position: Vector2(960.w, 950.h)),
          Chest(position: Vector2(700.w, 1600.h)),
          Bag(position: Vector2(950.w, 700.h)),
          Bush2(position: Vector2(450.w, 950.h)),
          HorizontalWall(
            position: Vector2(600.w, 350.h),
            torches: [Torch(position: Vector2(185.w, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(356.w, 350.h),
            torches: [Torch(position: Vector2(185.w, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(280.w, 350.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(horizontalPadding, 620.h),
            torches: [Torch(position: Vector2(100.w, -65.h))],
          ),
          HorizontalWall(position: Vector2(600.w, 838.h)),
          HorizontalWall(
            position: Vector2(844.w, 838.h),
            torches: [Torch(position: Vector2(20.w, -65.h))],
          ),
          HorizontalWall(
            isLong: false,
            position: Vector2(1000.w, 838.h),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 400.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 644.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(410.w, 1082.h),
            torches: [Torch(position: Vector2(120.w, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(250.w, 1082.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 888.h),
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(350.w, 888.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 1082.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 1326.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(625.w, 1764.h),
            torches: [Torch(position: Vector2(185.w, -65.h))],
          ),
          HorizontalWall(
            position: Vector2(381.w, 1764.h),
            torches: [Torch(position: Vector2(0, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            position: Vector2(600.w, 1570.h),
            torches: [Torch(position: Vector2(0, 120.h))],
          ),
          HorizontalWall(
            position: Vector2(860.w, 584.h),
            torches: [Torch(position: Vector2(100.w, -65.h))],
          ),
          HorizontalWall(position: Vector2(horizontalPadding, 1450.h)),
          HorizontalWall(position: Vector2(860.w, 1080.h)),
          HorizontalWall(
            position: Vector2(660.w, 1440.h),
            torches: [Torch(position: Vector2(185.w, -65.h))],
          ),
          VerticalWall(
            isMiddle: true,
            isDestroyed: true,
            position: Vector2(860.w, 890.h),
          ),
          Vase1(position: Vector2(670.w, 850.h)),
          Vase1(position: Vector2(500.w, 350.h)),
          Vase2(position: Vector2(480.w, 1075.h)),
          Vase2(position: Vector2(horizontalPadding, 600.h)),
          Bush1(position: Vector2(horizontalPadding, 1500.h)),
          Bush2(position: Vector2(950.w, 1150.h)),
          Bush1(position: Vector2(320.w, 1150.h)),
        ],
      ];
}
