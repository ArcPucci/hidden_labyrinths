import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/main.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _textAnimController;
  late Animation<double> _textAnimation;

  late AnimationController _leavesAnimController;
  late Animation<double> _leavesAnimation;

  late AnimationController _jawAnimController;
  late Animation<double> _jawAnimation;

  int pulseCounter = 0;

  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _jawAnimController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addStatusListener(
        (status) {
          if (status.isCompleted) _scrollToEnd();
        },
      );

    _jawAnimation = Tween<double>(begin: 0, end: 45).animate(
      CurvedAnimation(
        parent: _jawAnimController,
        curve: Curves.easeInOut,
      ),
    );

    _leavesAnimController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _leavesAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(
        parent: _leavesAnimController,
        curve: Curves.easeInOut,
      ),
    );

    _textAnimController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..repeat(reverse: true)
      ..addStatusListener(
        (status) {
          if (status.isForwardOrCompleted) pulseCounter++;
          if (pulseCounter == 4) {
            setState(() {});
            _leavesAnimController.dispose();
            _textAnimController.dispose();
            _jawAnimController.forward();
          }
        },
      );

    _textAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _textAnimController, curve: Curves.easeInOut),
    );
  }

  void _scrollToEnd() async {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );

    await Future.delayed(
      const Duration(milliseconds: 1800),
      () => context.go('/'),
    );
  }

  @override
  void dispose() {
    _jawAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Image.asset(
              'assets/png/loading_bg.png',
              alignment: Alignment.topCenter,
              width: 390.w,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              left: -120.w,
              top: 459.h,
              child: SafeArea(
                child: AnimatedBuilder(
                  animation: _leavesAnimation,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..translate(-25.0, -50.0)
                        ..rotateZ(_leavesAnimation.value)
                        ..translate(50.0, 50.0),
                      child: Image.asset(
                        'assets/png/leaves.png',
                        width: 331.w,
                        height: 380.h,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (pulseCounter < 4)
              Positioned(
                left: 0,
                right: 0,
                top: 525.h,
                child: SafeArea(
                  child: AnimatedBuilder(
                    animation: _textAnimation,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.scale(
                        scale: _textAnimation.value,
                        child: Image.asset(
                          'assets/png/texts/loading.png',
                          width: 183.w,
                          height: 55.h,
                        ),
                      );
                    },
                  ),
                ),
              ),
            AnimatedBuilder(
              animation: _jawAnimation,
              builder: (BuildContext context, Widget? child) {
                return Positioned(
                  left: 0,
                  right: 0,
                  top: (isSE ? 350.r : 260.r) + _jawAnimation.value,
                  child: SafeArea(
                    child: Image.asset(
                      'assets/png/mask_jaw.png',
                      width: 190.r,
                      height: isSE ? 160.r : 140.r,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
