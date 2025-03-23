import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PuzzleWidget extends StatelessWidget {
  const PuzzleWidget({
    super.key,
    required this.matrix,
    this.onTap,
  });

  final void Function(int)? onTap;
  final List<int> matrix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 279.w,
      height: 295.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: matrix.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          mainAxisExtent: 64.h,
        ),
        itemBuilder: (context, index) {
          if (matrix[index] == 0) return const SizedBox.shrink();
          return GestureDetector(
            onTap: () => onTap?.call(index),
            child: Image.asset('assets/png/puzzle/slot${matrix[index]}.png'),
          );
        },
      ),
    );
  }
}
