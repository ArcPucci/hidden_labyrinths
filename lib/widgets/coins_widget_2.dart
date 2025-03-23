import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';

class CoinsWidget2 extends StatelessWidget {
  const CoinsWidget2({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118.w,
      height: 42.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/png/sign.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: TextWidget(text: number.toString(), height: 23.h),
    );
  }
}
