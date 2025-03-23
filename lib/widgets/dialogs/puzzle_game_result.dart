import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';

class PuzzleGameResult extends StatelessWidget {
  const PuzzleGameResult({
    super.key,
    this.won = false,
    this.onNewGame,
  });

  final bool won;
  final VoidCallback? onNewGame;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          Positioned(
            top: 13.h,
            right: 0,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Image.asset(
                'assets/png/icons/close.png',
                width: 26.w,
                height: 26.h,
              ),
            ),
          ),
          _buildTitle(),
          Positioned.fill(
            child: Column(
              children: [
                Gap(218.h),
                Transform.scale(
                  scale: 1.2,
                  child: Image.asset(
                    'assets/png/texts/coins.png',
                    width: 100.w,
                    height: 40.h,
                  ),
                ),
                CoinsWidget2(number: won ? 200 : 0),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        context.pop();
                      },
                      child: Image.asset(
                        'assets/png/buttons/menu.png',
                        width: 109.w,
                        height: 32.h,
                      ),
                    ),
                    Gap(22.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        onNewGame?.call();
                      },
                      child: Image.asset(
                        'assets/png/buttons/new_game.png',
                        width: 109.w,
                        height: 32.h,
                      ),
                    ),
                  ],
                ),
                Gap(64.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
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
