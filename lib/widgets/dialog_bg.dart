import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/utils/utils.dart';

class DialogBg extends StatelessWidget {
  const DialogBg({
    super.key,
    this.width,
    this.padding,
    required this.child,
  });

  final double? width;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 207.w,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        border: Border.all(width: 8.sp, color: AppColors.yellow),
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 26.w,
          ),
      child: child,
    );
  }
}
