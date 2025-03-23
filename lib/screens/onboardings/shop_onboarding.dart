import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/utils/utils.dart';

class ShopOnboarding extends StatefulWidget {
  const ShopOnboarding({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  State<ShopOnboarding> createState() => _ShopOnboardingState();
}

class _ShopOnboardingState extends State<ShopOnboarding> {
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
                Gap(190.h),
                Text("STORE", style: AppStyles.j48),
                Gap(35.h),
                SizedBox(
                  width: 317.w,
                  child: Text(
                    """Buy potions that will help you overcome the most difficult challenges! Also, look into surprise chests - try your luck and discover unexpected Mayan treasures. Your path to victory will become even more exciting!""",
                    style: AppStyles.ink17_700,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: next,
                  child: Image.asset(
                    'assets/png/buttons/start.png',
                    width: 207.w,
                    height: 62.h,
                  ),
                ),
                Gap(120.h),
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
            'assets/png/onboardings/bg5.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                Gap(75.h),
                Text("MAGIC POTIONS", style: AppStyles.j48),
                Gap(35.h),
                SizedBox(
                  width: 317.w,
                  child: Text(
                    "Potions grant valuable bonuses: more time to complete, additional time jumps, or even all at once! The larger the potion, the more benefits it brings. Use them wisely to get closer to the Mayan treasures!",
                    style: AppStyles.ink17_700,
                    textAlign: TextAlign.center,
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
            'assets/png/onboardings/bg6.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                Gap(15.h),
                Text(
                  "SURPRISE\nCHESTS",
                  style: AppStyles.j48,
                  textAlign: TextAlign.center,
                ),
                Gap(28.h),
                SizedBox(
                  width: 317.w,
                  child: Text(
                    "These chests hide secret treasures, but no one knows what exactly they contain! They can be potions of different sizes or other valuable items. Open the chest and try your luck - you might just hit the jackpot!",
                    style: AppStyles.ink17_700,
                    textAlign: TextAlign.center,
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
            'assets/png/onboardings/bg7.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                Gap(60.h),
                Text("INFO", style: AppStyles.j48),
                Gap(14.h),
                SizedBox(
                  width: 317.w,
                  child: Text(
                    "By clicking on the I icon, you can find out detailed information about the properties of each potion. ",
                    style: AppStyles.ink17_700,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(215.h),
                SizedBox(
                  width: 317.w,
                  child: Text(
                    "Carefully study their effects to use them wisely in the game and get the most benefit in the most difficult situations!",
                    style: AppStyles.ink17_700,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: next,
                  child: Image.asset(
                    'assets/png/buttons/start.png',
                    width: 207.w,
                    height: 62.h,
                  ),
                ),
                Gap(120.h),
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
