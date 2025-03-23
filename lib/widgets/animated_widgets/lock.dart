import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lock extends StatefulWidget {
  const Lock({super.key, this.onCompleted, this.animate = false});

  final bool animate;
  final VoidCallback? onCompleted;

  @override
  State<Lock> createState() => _LockState();
}

class _LockState extends State<Lock> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) widget.onCompleted?.call();
      },
    );

    if (widget.animate) controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 49.w,
      height: 43.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/chain.png'),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) {
                  final index = ((controller.value * 2) % 3).toInt() + 1;
                  return Image.asset(
                    'assets/png/lock${index}.png',
                    width: 20.w,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
