import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBackground extends PositionComponent {
  final Gradient gradient;

  GradientBackground({
    required this.gradient,
    required Vector2 size,
  }) {
    this.size = size;
    super.priority = 10000000000;
    super.position = Vector2(0, 844.h - 406.h);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..shader = gradient.createShader(Offset.zero & size.toSize());
    canvas.drawRect(size.toRect(), paint);
  }
}