import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/utils/game_mask_puzzle.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:provider/provider.dart';

import '../widgets.dart';

class EnterBonusGame extends StatefulWidget {
  const EnterBonusGame({super.key, required this.onCompleted});

  final void Function(ShopItem?, int?) onCompleted;

  @override
  State<EnterBonusGame> createState() => _EnterBonusGameState();
}

class _EnterBonusGameState extends State<EnterBonusGame> {
  late final ConfigProvider provider;
  late final MaskPuzzle maskPuzzle;
  final int gridSize = 3;
  late List<int> tiles;

  bool completed = false;
  bool _showImage = false;

  final smallPotions = [SmallTimePotion(), SmallTransitionPotion()];
  final middlePotions = [MiddleTimePotion(), MiddleTransitionPotion()];

  int? golds;
  ShopItem? shopItem;

  @override
  void initState() {
    super.initState();
    provider = Provider.of(context, listen: false);
    final rand = Random().nextInt(GameMaskPuzzle.puzzles.length);
    maskPuzzle = GameMaskPuzzle.puzzles[rand];
    _initTiles();
    _generate();
  }

  void _initTiles() {
    tiles = List.generate(gridSize * gridSize, (i) => i);
    tiles.shuffle();
  }

  void _swapTiles(int from, int to) {
    setState(() {
      final temp = tiles[from];
      tiles[from] = tiles[to];
      tiles[to] = temp;
      completed = _isCompleted();
      if (!completed) return;

      if (golds != null) provider.addCoins(golds!);
      if (shopItem != null) provider.addPotion(shopItem!);

      Future.delayed(
        const Duration(milliseconds: 800),
        () => setState(() => _showImage = true),
      );
    });
  }

  void _generate() {
    final middle = List.generate(3, (index) => Random().nextBool());
    final allMiddle = middle.every((element) => element);

    if (allMiddle) {
      shopItem = middlePotions[Random().nextInt(middlePotions.length)];
      return;
    } else {
      final isGold = Random().nextBool();
      if (isGold) {
        golds = (Random().nextInt(3) + 1) * 100;
      } else {
        shopItem = smallPotions[Random().nextInt(smallPotions.length)];
      }
    }
  }

  bool _isCompleted() {
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i] != i) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 11.h,
            right: 28.w,
            child: const SafeArea(child: CustomAppBar()),
          ),
          Positioned(
            top: 134.h,
            child: SizedBox(
              width: 393.w,
              height: 426.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/png/stone_bg_2.png',
                          width: 393.r,
                          height: 393.r,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.r),
                          child: AnimatedOpacity(
                            opacity: _showImage ? 1 : 0,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeOut,
                            child: AnimatedScale(
                              scale: 1.15,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeOutBack,
                              child: Image.asset(
                                maskPuzzle.image,
                                width: maskPuzzle.size.width,
                                height: maskPuzzle.size.height,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        if (!_showImage)
                          Padding(
                            padding: EdgeInsets.only(top: 25.r),
                            child: SizedBox(
                              width: 180.r,
                              height: 180.r,
                              child: Stack(
                                children: List.generate(
                                  tiles.length,
                                  (index) {
                                    int tileIndex = tiles[index];
                                    final tile = maskPuzzle.pieces[tileIndex];

                                    final row = index ~/ gridSize;
                                    final col = index % gridSize;

                                    final tileSize = 180.r / gridSize;

                                    final targetLeft = completed
                                        ? (180.r - maskPuzzle.size.width) / 3 +
                                            tile.offset.dx
                                        : col * tileSize;
                                    final targetTop = completed
                                        ? tile.offset.dy
                                        : row * tileSize;

                                    return AnimatedPositioned(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.easeInOut,
                                      left: targetLeft,
                                      top: targetTop,
                                      width: tileSize,
                                      height: tileSize,
                                      child: completed
                                          ? Center(
                                              child: Image.asset(
                                                tile.asset,
                                                width: tile.size.width,
                                                height: tile.size.height,
                                                fit: BoxFit.contain,
                                              ),
                                            )
                                          : DragTarget<int>(
                                              onAcceptWithDetails: (details) {
                                                final fromIndex = details.data;
                                                _swapTiles(fromIndex, index);
                                              },
                                              builder: (context, candidateData,
                                                  rejectedData) {
                                                return Draggable<int>(
                                                  data: index,
                                                  feedback: Center(
                                                    child: Image.asset(
                                                      tile.asset,
                                                      width: tile.size.width,
                                                      height: tile.size.height,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  childWhenDragging:
                                                      const SizedBox.shrink(),
                                                  child: Center(
                                                    child: Image.asset(
                                                      tile.asset,
                                                      width: tile.size.width,
                                                      height: tile.size.height,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 279.h,
                    child: Image.asset(
                      'assets/png/bonus_game.png',
                      width: 147.w,
                      height: 147.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 2.h,
                    right: 13.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        widget.onCompleted(shopItem, golds);
                      },
                      child: Image.asset(
                        'assets/png/icons/close.png',
                        width: 26.w,
                        height: 26.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 548.h,
            child: Container(
              width: 197.w,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.76),
                border: Border.all(width: 6.sp, color: AppColors.darkOrange2),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              child: Column(
                children: [
                  Text("Puzzle", style: AppStyles.ts17),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Assemble the puzzle as in the example to get a bonus. The bonus can be: Coins and magic potions, the game can be played once a day",
                          style: AppStyles.ts9,
                        ),
                      ),
                      Image.asset(
                        maskPuzzle.infoImage,
                        width: 68.w,
                        height: 78.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
