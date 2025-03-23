import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLeaf1 extends StatefulWidget {
  const AnimatedLeaf1({super.key});

  @override
  State<AnimatedLeaf1> createState() => _AnimatedLeaf1State();
}

class _AnimatedLeaf1State extends State<AnimatedLeaf1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
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
            'assets/png/leaves/leaf1.png',
            width: 160.w,
            height: 128.h,
          ),
        );
      },
    );
  }
}
