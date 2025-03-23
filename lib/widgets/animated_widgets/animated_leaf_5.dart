import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLeaf5 extends StatefulWidget {
  const AnimatedLeaf5({super.key});

  @override
  State<AnimatedLeaf5> createState() => _AnimatedLeaf5State();
}

class _AnimatedLeaf5State extends State<AnimatedLeaf5>
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
          alignment: Alignment.topLeft,
          transform: Matrix4.identity()..rotateZ(angle),
          child: Image.asset(
            'assets/png/leaves/leaf5.png',
            width: 146.w,
            height: 83.h,
          ),
        );
      },
    );
  }
}
