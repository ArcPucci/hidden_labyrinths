import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/game/game.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';

class GameOverlay extends StatefulWidget {
  const GameOverlay(this.game, {super.key});

  final MyGame game;

  @override
  State<GameOverlay> createState() => _GameOverlayState();
}

class _GameOverlayState extends State<GameOverlay> {
  final bigBottles = [RecoveryPotion(), BigTransitionPotion(), BigTimePotion()];
  final midBottles = [MiddleTransitionPotion(), MiddleTimePotion()];
  final smallBottles = [SmallTransitionPotion(), SmallTimePotion()];

  @override
  Widget build(BuildContext context) {
    final ancientTime = widget.game.gameManager.ancientTime;
    final seconds = widget.game.gameManager.seconds;
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Gap(9.w),
                  const CoinsWidget(),
                  Gap(20.w),
                  Container(
                    width: 104.w,
                    height: 64.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/png/rect/rect3.png'),
                      ),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: ancientTime,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            value
                                ? Image.asset(
                                    'assets/images/crystal_past_active.png',
                                    width: 57.w,
                                    height: 54.h,
                                  )
                                : GestureDetector(
                                    onTap: widget.game.gameManager.changeTime,
                                    child: Image.asset(
                                      'assets/images/crystal_past.png',
                                      width: 43.w,
                                      height: 43.h,
                                    ),
                                  ),
                            value
                                ? GestureDetector(
                                    onTap: widget.game.gameManager.changeTime,
                                    child: Image.asset(
                                      'assets/images/crystal_future.png',
                                      width: 43.w,
                                      height: 43.h,
                                    ),
                                  )
                                : Image.asset(
                                    'assets/images/crystal_future_active.png',
                                    width: 57.w,
                                    height: 54.h,
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      widget.game.gameManager.pause();
                      showMenu();
                    },
                    child: Image.asset(
                      'assets/png/buttons/menu2.png',
                      width: 78.w,
                      height: 40.h,
                    ),
                  ),
                  Gap(26.w),
                ],
              ),
              Gap(4.h),
              Container(
                width: 80.w,
                height: 50.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/rect/rect2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ValueListenableBuilder(
                  valueListenable: seconds,
                  builder: (context, value, child) {
                    final minutes = (value ~/ 60);
                    final sec = (value % 60).toString().padLeft(2, '0');
                    return TextWidget(text: '$minutes:$sec');
                  },
                ),
              )
            ],
          ),
          Positioned(
            top: 57.h,
            left: 9.w,
            child: ValueListenableBuilder(
              valueListenable: widget.game.gameManager.jumps,
              builder: (BuildContext context, int value, Widget? child) {
                return Image.asset(
                  'assets/images/jump_scale_$value.png',
                  width: 118.w,
                  height: 24.h,
                );
              },
            ),
          ),
          Positioned(
            top: 88.h,
            left: 9.w,
            child: SafeArea(
              child: ValueListenableBuilder(
                valueListenable: widget.game.gameManager.potions,
                builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                          bigBottles.length,
                          (index) {
                            final number = value[bigBottles[index].name] ?? 0;

                            if (number == 0) return const SizedBox();

                            return Padding(
                              padding: EdgeInsets.only(right: 6.w),
                              child: _buildBottle(
                                item: bigBottles[index],
                                number: number,
                                onTap: () => widget.game.usePotion(
                                  bigBottles[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Gap(13.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...List.generate(
                            midBottles.length,
                            (index) {
                              final number = value[midBottles[index].name] ?? 0;

                              if (number == 0) return const SizedBox();
                              return Padding(
                                padding: EdgeInsets.only(right: 6.w),
                                child: _buildBottle(
                                  item: midBottles[index],
                                  width: 31.w,
                                  height: 56.h,
                                  number: number,
                                  onTap: () => widget.game.usePotion(
                                    midBottles[index],
                                  ),
                                ),
                              );
                            },
                          ),
                          ...List.generate(
                            smallBottles.length,
                            (index) {
                              final number =
                                  value[smallBottles[index].name] ?? 0;

                              if (number == 0) return const SizedBox();
                              return Padding(
                                padding: EdgeInsets.only(right: 6.w),
                                child: _buildBottle(
                                  item: smallBottles[index],
                                  width: 25.w,
                                  height: 42.h,
                                  number: number,
                                  onTap: () => widget.game.usePotion(
                                    smallBottles[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottle({
    required ShopItem item,
    double? width,
    double? height,
    required int number,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        if (widget.game.gameManager.gameOver) return;
        showItemInfo(item, onTap);
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: width ?? 36.w,
          height: height ?? 64.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(item.image)),
          ),
          alignment: const Alignment(0, 0.5),
          child: CustomStrokeText(
            text: "$number",
            textStyle: AppStyles.ts17.copyWith(color: Colors.white),
            strokeColor: const Color(0xFFFF0000),
            strokeWidth: 1.sp,
          ),
        ),
      ),
    );
  }

  void showMenu() {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: MenuDialog(
            onTapRules: showRules,
            onTapNewGame: widget.game.newGame,
            onClose: widget.game.gameManager.resume,
          ),
        );
      },
    );
  }

  void showRules() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      useSafeArea: false,
      builder: (context) {
        return const HiddenLabyrinthInfoDialog();
      },
    );
  }

  void showItemInfo(ShopItem item, VoidCallback? onTap) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return ShopItemInfoDialog(
          shopItem: item,
          canBuy: false,
          onSubmit: onTap,
        );
      },
    );
  }
}
