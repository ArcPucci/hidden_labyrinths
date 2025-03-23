import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:hidden_labyrinths/widgets/dialog_bg.dart';

class HiddenLabyrinthInfoDialog extends StatelessWidget {
  const HiddenLabyrinthInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Gap(70.h),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 30.w),
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
          Gap(20.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Material(
                color: Colors.transparent,
                child: DialogBg(
                  width: 310.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 34.w, vertical: 34.h),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("GAME LABYRINTH", style: AppStyles.ts17),
                      ),
                      Gap(6.h),
                      Text(
                        "The main goal of the game is to pass the labyrinth at the appointed time, as a bonus you can open the chest and earn coins for future purchases. We have a map in two time periods, in each of them the map changes, offering new paths in the form of broken walls. Be careful and think through every step, time and transitions are limited!",
                        style: AppStyles.ts8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/png/crystals.png',
                            width: 72.w,
                            height: 44.h,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 129.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(15.h),
                                Text("TIME SWITCH", style: AppStyles.ts11),
                                Text(
                                  "Use it when you need to switch between time cards, but remember that the number of switches is limited!",
                                  style: AppStyles.ts8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(7.h),
                      SizedBox(
                        width: 180.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("PAST", style: AppStyles.ts11),
                                Image.asset(
                                  'assets/images/crystal_past_active.png',
                                  width: 38.w,
                                  height: 36.h,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("PRESENT", style: AppStyles.ts11),
                                Image.asset(
                                  'assets/images/crystal_future_active.png',
                                  width: 38.w,
                                  height: 36.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/png/screen1.png',
                            width: 105.w,
                            height: 78.h,
                          ),
                          Image.asset(
                            'assets/png/screen2.png',
                            width: 105.w,
                            height: 78.h,
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Text("NUMBER OF TRANSITIONS", style: AppStyles.ts11),
                      Gap(5.h),
                      Image.asset(
                        'assets/images/jump_scale_3.png',
                        width: 115.w,
                        height: 22.h,
                      ),
                      Gap(15.h),
                      Text("TIME IS LIMITED", style: AppStyles.ts11),
                      Gap(5.h),
                      Image.asset(
                        'assets/png/time.png',
                        width: 51.w,
                        height: 30.h,
                      ),
                      Gap(21.h),
                      Text("Passage options", style: AppStyles.ts11),
                      Gap(5.h),
                      Text(
                        "By switching between time periods, you can discover new passages in the labyrinth that will help you get out of a dead end or pave the way to the desired reward.",
                        style: AppStyles.ts8,
                      ),
                      Gap(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/png/screen4.png',
                            width: 106.w,
                            height: 73.h,
                          ),
                          Image.asset(
                            'assets/png/screen3.png',
                            width: 106.w,
                            height: 73.h,
                          ),
                        ],
                      ),
                      Gap(26.h),
                      Text("PRIZES AND COINS", style: AppStyles.ts11),
                      Gap(13.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/chest.png',
                            width: 48.w,
                            height: 50.h,
                          ),
                          Image.asset(
                            'assets/images/bag.png',
                            width: 40.w,
                            height: 44.h,
                          ),
                          Image.asset(
                            'assets/images/key.png',
                            width: 41.w,
                            height: 48.h,
                          ),
                        ],
                      ),
                      Gap(13.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "SURPRISE BAG",
                                  style: AppStyles.ts9.copyWith(
                                    color: AppColors.yellow3,
                                  ),
                                ),
                                Text(
                                  "The bag may contain a bonus in the form of time extension, additional transitions or a coin.",
                                  style: AppStyles.ts8,
                                ),
                              ],
                            ),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "CHEST OF COINS",
                                  style: AppStyles.ts9.copyWith(
                                    color: AppColors.yellow3,
                                  ),
                                ),
                                Text(
                                  "A chest of coins, after opening with a key gives you a large supply of coins that you can spend in the store!",
                                  style: AppStyles.ts8,
                                ),
                              ],
                            ),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KEY",
                                  style: AppStyles.ts9.copyWith(
                                    color: AppColors.yellow3,
                                  ),
                                ),
                                Text(
                                  "The key allows you to open the chest and replenish your supply of coins for future purchases!",
                                  style: AppStyles.ts8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
