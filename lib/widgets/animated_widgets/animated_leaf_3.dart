import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLeaf3 extends StatefulWidget {
  const AnimatedLeaf3({super.key});

  @override
  State<AnimatedLeaf3> createState() => _AnimatedLeaf3State();
}

class _AnimatedLeaf3State extends State<AnimatedLeaf3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
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
          alignment: Alignment.bottomRight,
          transform: Matrix4.identity()..rotateZ(angle),
          child: Image.asset(
            'assets/png/leaves/leaf3.png',
            width: 196.w,
            height: 96.h,
          ),
        );
      },
    );
  }
}
