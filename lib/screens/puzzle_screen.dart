import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return PuzzleGameProvider(
          showResult: (won, newGame) => showResult(context, won, newGame),
          configProvider: Provider.of(context, listen: false),
        );
      },
      child: Consumer<PuzzleGameProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Material(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/png/puzzle_bg.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 100.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SafeArea(
                      child: Image.asset(
                        'assets/png/stone_face_1.png',
                        width: 166.w,
                        height: 159.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25.h,
                  left: 45.w,
                  child: SafeArea(
                    child: Image.asset(
                      'assets/png/leaves/palm_leaf.png',
                      width: 183.w,
                      height: 108.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 78.h,
                  right: 75.w,
                  child: SafeArea(
                    child: Image.asset(
                      'assets/png/leaves/palm_leaf_2.png',
                      width: 116.w,
                      height: 102.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 41.h,
                  left: -15.w,
                  child: const SafeArea(child: AnimatedLeaf4()),
                ),
                Positioned(
                  top: 188.h,
                  left: 0.w,
                  child: const SafeArea(child: AnimatedLeaf5()),
                ),
                Positioned(
                  top: 157.h,
                  right: 0.w,
                  child: const SafeArea(child: AnimatedLeaf6()),
                ),
                Positioned(
                  top: isSE ? 325.h : 305.h,
                  left: 58.w,
                  child: SafeArea(
                    child: PuzzleWidget(
                      matrix: value.matrix,
                      onTap: value.onTap,
                    ),
                  ),
                ),
                Positioned(
                  top: 213.h,
                  child: SafeArea(
                    child: Image.asset(
                      'assets/png/parrots.png',
                      width: 77.w,
                      height: 103.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 3.h,
                  left: 15.w,
                  right: 15.w,
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Gap(72.w),
                        Container(
                          width: 80.w,
                          height: 37.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/png/rect/rect2.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: TextWidget(text: value.time),
                        ),
                        GestureDetector(
                          onTap: () {
                            value.pauseGame();
                            showMenu(context, value.newGame, value.resumeGame);
                          },
                          child: Image.asset(
                            'assets/png/buttons/menu2.png',
                            width: 72.w,
                            height: 37.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showInfo(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return const PuzzleGameInfoDialog();
      },
    );
  }

  void showMenu(
    BuildContext context,
    VoidCallback? onTapNewGame,
    VoidCallback? onClose,
  ) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: MenuDialog(
            onTapRules: () => showInfo(context),
            onTapNewGame: onTapNewGame,
            onClose: onClose,
          ),
        );
      },
    );
  }

  void showResult(BuildContext context, bool won, VoidCallback? onNewGame) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: PuzzleGameResult(
            won: won,
            onNewGame: onNewGame,
          ),
        );
      },
    );
  }
}
