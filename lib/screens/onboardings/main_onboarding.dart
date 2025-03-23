import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/utils/utils.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key, this.onCompleted});
  
  final VoidCallback? onCompleted;

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  final controller = PageController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (value) => index = value,
      children: [
        _buildPage1(),
        _buildPage2(),
        _buildPage3(),
        _buildPage4(),
      ],
    );
  }

  Widget _buildPage1() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/onboardings/bg1.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                Gap(155.h),
                Text("WELCOME!", style: AppStyles.j48),
                Gap(42.h),
                SizedBox(
                  width: 317.w,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              """You are a Mayan shaman, searching for ancient treasures in the labyrinthine corridors of time. Move between your time and the modern world to solve mysteries and find the path to riches.

Before the adventure begins, let's quickly go over the navigation. It will only take a minute. If you are ready to begin, press the """,
                          style: AppStyles.ink17_400,
                        ),
                        TextSpan(
                          text: "START",
                          style: AppStyles.ink17_400.copyWith(
                            color: AppColors.yellow4,
                          ),
                        ),
                        TextSpan(text: " button!", style: AppStyles.ink17_400),
                      ],
                    ),
                  ),
                ),
                Gap(46.h),
                GestureDetector(
                  onTap: next,
                  child: Image.asset(
                    'assets/png/buttons/start.png',
                    width: 207.w,
                    height: 62.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage2() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/onboardings/bg2.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                Gap(155.h),
                Text("LABYRINTH", style: AppStyles.j48),
                Gap(42.h),
                SizedBox(
                  width: 317.w,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              """An exciting adventure full of mysteries and Mayan treasures! Use logic and make quick decisions to find ancient riches.\n\n""",
                          style: AppStyles.ink17_400,
                        ),
                        TextSpan(
                          text: "Click to start the game!",
                          style: AppStyles.ink17_400.copyWith(
                            color: AppColors.yellow4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 31.w),
                    child: Transform.rotate(
                      angle: pi,
                      child: GestureDetector(
                        onTap: next,
                        child: Image.asset(
                          'assets/png/icons/arrow_left.png',
                          width: 83.w,
                          height: 49.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(125.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage3() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/onboardings/bg3.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                Gap(107.h),
                Text("15 PUZZLE", style: AppStyles.j48),
                Gap(42.h),
                SizedBox(
                  width: 317.w,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              """Solve an ancient puzzle by moving tiles to reveal the secrets and treasures of the Mayan civilization. Logic and patience will help you put together the secret message of the ancients!\n\n""",
                          style: AppStyles.ink17_400,
                        ),
                        TextSpan(
                          text: "Click to start the game!",
                          style: AppStyles.ink17_400.copyWith(
                            color: AppColors.yellow4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 31.w),
                    child: Transform.rotate(
                      angle: pi,
                      child: GestureDetector(
                        onTap: next,
                        child: Image.asset(
                          'assets/png/icons/arrow_left.png',
                          width: 83.w,
                          height: 49.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(125.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage4() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/onboardings/bg4.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                Gap(68.h),
                Text("STORE", style: AppStyles.j48),
                Gap(35.h),
                SizedBox(
                  width: 317.w,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              """Buy potions that will help you overcome the most difficult challenges! Also, look into surprise chests - try your luck and discover unexpected Mayan treasures. Your path to victory will become even more exciting!\n\nIf everything is clear to you and you want to start the game, press the """,
                          style: AppStyles.ink17_700,
                        ),
                        TextSpan(
                          text: "START",
                          style: AppStyles.ink17_700.copyWith(
                            color: AppColors.yellow4,
                          ),
                        ),
                        TextSpan(text: " button", style: AppStyles.ink17_700),
                      ],
                    ),
                  ),
                ),
                Gap(162.h),
                GestureDetector(
                  onTap: next,
                  child: Image.asset(
                    'assets/png/buttons/start.png',
                    width: 207.w,
                    height: 62.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void next() {
    if (index == 3) {
      widget.onCompleted?.call();
      return;
    }

    controller.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
