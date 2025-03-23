import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSoldSign extends StatefulWidget {
  const AnimatedSoldSign({super.key});

  @override
  State<AnimatedSoldSign> createState() => _AnimatedSoldSignState();
}

class _AnimatedSoldSignState extends State<AnimatedSoldSign>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double angle = cos(_controller.value * 2 * pi) * 0.25;
        return Transform(
          alignment: Alignment.topCenter,
          transform: Matrix4.identity()..rotateZ(angle),
          child: Image.asset(
            'assets/png/sold_sign.png',
            width: 160.w,
            height: 172.h,
          ),
        );
      },
    );
  }
}
