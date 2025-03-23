import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';

class PuzzleGameInfoDialog extends StatelessWidget {
  const PuzzleGameInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(13.h),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Image.asset(
                'assets/png/icons/close.png',
                width: 26.w,
                height: 26.h,
              ),
            ),
          ),
        ),
        Gap(18.h),
        Expanded(
          child: SingleChildScrollView(
            child: Material(
              color: Colors.transparent,
              child: DialogBg(
                width: 310.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                  vertical: 36.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("15 PUZZLE", style: AppStyles.ts17),
                    Gap(10.h),
                    Text("Objective of the game:", style: AppStyles.ts11),
                    Gap(3.h),
                    Text(
                      "You need to move the tiles using the empty cell so that all the tiles are in ascending order of numbers, starting with 1 and ending with 15. In the upper left corner there should be a tile with the number 1, and in the lower right corner there should be an empty cell.",
                      style: AppStyles.ts9,
                    ),
                    Gap(20.h),
                    Text("Game progress:", style: AppStyles.ts11),
                    Gap(3.h),
                    Text(
                      """At the beginning, the tiles are placed randomly, and one cell is left empty. The player can move tiles adjacent to the empty cell to its place. A tile can only move one cell up, down, left or right. The player rearranges the tiles in such a way as to collect them in the correct sequence.""",
                      style: AppStyles.ts9,
                    ),
                    Gap(20.h),
                    Text("Time is limited", style: AppStyles.ts11),
                    Gap(3.h),
                    Image.asset(
                      'assets/png/puzzle/time.png',
                      width: 57.w,
                      height: 32.h,
                    ),
                    Gap(21.h),
                    Text(
                      "Final arrangement of tiles:",
                      style: AppStyles.ts11,
                    ),
                    Image.asset(
                      'assets/png/puzzle/screen.png',
                      width: 178.w,
                      height: 185.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
