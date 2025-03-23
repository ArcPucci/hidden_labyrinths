import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PuzzleSign extends StatefulWidget {
  const PuzzleSign({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<PuzzleSign> createState() => _PuzzleSignState();
}

class _PuzzleSignState extends State<PuzzleSign>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -(pi / 180) * 5,
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          width: 106.w,
          height: 144.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/png/stick2.png',
                  width: 16.w,
                  height: 141.h,
                ),
              ),
              Positioned(
                top: 10.h,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _animation.value,
                      child: Image.asset(
                        'assets/png/puzzle_sign.png',
                        width: 98.w,
                        height: 52.h,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
