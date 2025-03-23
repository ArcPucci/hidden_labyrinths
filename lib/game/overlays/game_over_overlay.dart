import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_labyrinths/game/game.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    final won = game.gameManager.won;
    final stars = game.gameManager.stars;
    final coins = game.gameManager.coins;
    final hasBag = game.gameManager.collectedBag;
    final hasChest = game.gameManager.openedChest;
    return Material(
      color: Colors.black.withOpacity(0.57),
      child: Center(
        child: SizedBox(
          width: 328.w,
          height: 513.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/png/settings_bg.png',
                  fit: BoxFit.fill,
                ),
              ),
              _buildTitle(won),
              Positioned(
                top: 146.h,
                bottom: 61.h,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    won
                        ? Image.asset(
                            'assets/png/star$stars.png',
                            width: 147.w,
                            height: 65.h,
                          )
                        : Image.asset(
                            'assets/png/stars0.png',
                            width: 148.w,
                            height: 59.h,
                          ),
                    Transform.scale(
                      scale: 1.2,
                      child: Image.asset(
                        'assets/png/texts/coins.png',
                        width: 100.w,
                        height: 40.h,
                      ),
                    ),
                    CoinsWidget2(number: coins),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (hasChest) ...[
                            Container(
                              width: 74.w,
                              height: 78.h,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/gold_chest.png',
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 4),
                                    blurRadius: 4,
                                    color: const Color(0xFFFAFF00)
                                        .withOpacity(0.36),
                                  ),
                                ],
                              ),
                            ),
                            Gap(49.w),
                          ],
                          if (hasBag)
                            Container(
                              width: 62.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/bag.png',
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 4),
                                    blurRadius: 4,
                                    color: const Color(0xFFFAFF00)
                                        .withOpacity(0.36),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 232.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: context.pop,
                            child: Image.asset(
                              'assets/png/buttons/menu.png',
                              width: 109.w,
                              height: 32.h,
                            ),
                          ),
                          won &&
                                  !(game.configProvider.selectedLevel ==
                                      GameMaps.gameMaps.length - 1)
                              ? GestureDetector(
                                  onTap: game.nextLevel,
                                  child: Image.asset(
                                    'assets/png/buttons/next_level.png',
                                    width: 109.w,
                                    height: 32.h,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: game.newGame,
                                  child: Image.asset(
                                    'assets/png/buttons/new_game.png',
                                    width: 109.w,
                                    height: 32.h,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(bool won) {
    if (won) {
      return Positioned(
        top: 38.h,
        left: 106.w,
        child: Image.asset(
          'assets/png/won.png',
          width: 125.w,
          height: 113.h,
        ),
      );
    }
    return Positioned(
      top: 13.h,
      left: 0,
      right: 0,
      child: Center(
        child: Image.asset(
          'assets/png/lost.png',
          width: 132.w,
          height: 132.h,
        ),
      ),
    );
  }
}
