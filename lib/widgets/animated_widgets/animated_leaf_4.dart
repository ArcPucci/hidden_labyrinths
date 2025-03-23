import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLeaf4 extends StatefulWidget {
  const AnimatedLeaf4({super.key});

  @override
  State<AnimatedLeaf4> createState() => _AnimatedLeaf4State();
}

class _AnimatedLeaf4State extends State<AnimatedLeaf4>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6500),
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
          alignment: Alignment.bottomLeft,
          transform: Matrix4.identity()..rotateZ(angle),
          child: Image.asset(
            'assets/png/leaves/leaf4.png',
            width: 204.w,
            height: 131.h,
          ),
        );
      },
    );
  }
}
