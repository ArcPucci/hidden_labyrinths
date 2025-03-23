import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLeaf6 extends StatefulWidget {
  const AnimatedLeaf6({super.key});

  @override
  State<AnimatedLeaf6> createState() => _AnimatedLeaf6State();
}

class _AnimatedLeaf6State extends State<AnimatedLeaf6>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
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
        double angle = cos(_controller.value * 2 * pi) * 0.2;
        return Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.identity()..rotateZ(angle),
          child: Image.asset(
            'assets/png/leaves/leaf6.png',
            width: 158.w,
            height: 73.h,
          ),
        );
      },
    );
  }
}
