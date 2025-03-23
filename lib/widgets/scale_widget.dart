import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ScaleWidget extends StatelessWidget {
  const ScaleWidget({
    super.key,
    this.index = 1,
    this.onIncrease,
    this.onDecrease,
  });

  final int index;
  final void Function(int)? onIncrease;
  final void Function(int)? onDecrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: pi,
          child: GestureDetector(
            onTap: decrease,
            child: Image.asset(
              'assets/png/icons/arrow_right.png',
              width: 20.w,
              height: 22.h,
            ),
          ),
        ),
        Gap(11.w),
        Image.asset(
          'assets/png/scale/scale${index}.png',
          width: 190.w,
          height: 35.h,
        ),
        Gap(11.w),
        GestureDetector(
          onTap: increase,
          child: Image.asset(
            'assets/png/icons/arrow_right.png',
            width: 20.w,
            height: 22.h,
          ),
        ),
      ],
    );
  }

  void decrease() {
    if (index == 0) return;
    onDecrease?.call(index - 1);
  }

  void increase() {
    if (index == 7) return;
    onIncrease?.call(index + 1);
  }
}
