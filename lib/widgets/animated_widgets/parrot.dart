import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Parrot extends StatefulWidget {
  const Parrot({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  State<Parrot> createState() => _ParrotState();
}

class _ParrotState extends State<Parrot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final states = [
    "assets/png/parrot_state_2.png",
    "assets/png/parrot_state_1.png",
    "assets/png/parrot_state_3.png",
    "assets/png/parrot_state_4.png",
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
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
      builder: (BuildContext context, Widget? child) {
        final index = ((_controller.value * 4) % 4).toInt();
        return Image.asset(
          states[index],
          width: widget.width ?? 28.w,
          height: widget.height ?? 48.h,
        );
      },
    );
  }
}
