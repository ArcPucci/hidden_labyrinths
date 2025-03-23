import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartGameSign extends StatefulWidget {
  const StartGameSign({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<StartGameSign> createState() => _StartGameSignState();
}

class _StartGameSignState extends State<StartGameSign>
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
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 137.w,
        height: 171.h,
        child: Stack(
          children: [
            Positioned(
              right: 50.w,
              bottom: 0,
              child: Image.asset(
                'assets/png/stick1.png',
                width: 18.w,
                height: 163.h,
              ),
            ),
            Positioned(
              top: 20.h,
              right: 0.w,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animation.value,
                    child: Image.asset(
                      'assets/png/start_sign.png',
                      width: 121.w,
                      height: 80.h,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
