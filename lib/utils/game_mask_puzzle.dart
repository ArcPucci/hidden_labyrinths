import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/models.dart';

class GameMaskPuzzle {
  static const _path = 'assets/png/bonus';

  static final List<MaskPuzzle> puzzles = [
    MaskPuzzle(
      size: Size(128.r, 146.r),
      image: '$_path/puzzle1_shadow.png',
      infoImage: '$_path/puzzle1.png',
      pieces: [
        MaskPiece(
          id: 0,
          size: Size(44.r, 44.r),
          asset: '$_path/puzzle1_1.png',
          offset: Offset(2.r, 0.69.r),
        ),
        MaskPiece(
          id: 1,
          size: Size(56.r, 54.r),
          asset: '$_path/puzzle1_2.png',
          offset: Offset(43.r, 4.3.r),
        ),
        MaskPiece(
          id: 2,
          size: Size(42.r, 44.r),
          asset: '$_path/puzzle1_3.png',
          offset: Offset(83.r, 0.r),
        ),
        MaskPiece(
          id: 3,
          size: Size(44.r, 36.r),
          asset: '$_path/puzzle1_4.png',
          offset: Offset(2.r, 40.r),
        ),
        MaskPiece(
          id: 4,
          size: Size(66.r, 37.r),
          asset: '$_path/puzzle1_5.png',
          offset: Offset(41.5.r, 39.r),
        ),
        MaskPiece(
          id: 5,
          size: Size(45.r, 37.r),
          asset: '$_path/puzzle1_6.png',
          offset: Offset(82.r, 39.r),
        ),
        MaskPiece(
          id: 6,
          size: Size(35.r, 54.r),
          asset: '$_path/puzzle1_7.png',
          offset: Offset(7.r, 80.32.r),
        ),
        MaskPiece(
          id: 7,
          size: Size(60.r, 66.r),
          asset: '$_path/puzzle1_8.png',
          offset: Offset(42.r, 86.r),
        ),
        MaskPiece(
          id: 8,
          size: Size(40.r, 55.r),
          asset: '$_path/puzzle1_9.png',
          offset: Offset(79.r, 81.r),
        ),
      ],
    ),
    MaskPuzzle(
      size: Size(114.r, 152.r),
      image: '$_path/puzzle2_shadow.png',
      infoImage: '$_path/puzzle2.png',
      pieces: [
        MaskPiece(
          id: 0,
          size: Size(37.r, 42.r),
          asset: '$_path/puzzle2_1.png',
          offset: Offset(2.r, 0.69.r),
        ),
        MaskPiece(
          id: 1,
          size: Size(58.r, 52.r),
          asset: '$_path/puzzle2_2.png',
          offset: Offset(40.r, 5.r),
        ),
        MaskPiece(
          id: 2,
          size: Size(36.r, 41.r),
          asset: '$_path/puzzle2_3.png',
          offset: Offset(78.r, 0.r),
        ),
        MaskPiece(
          id: 3,
          size: Size(37.r, 36.r),
          asset: '$_path/puzzle2_4.png',
          offset: Offset(4.r, 38.r),
        ),
        MaskPiece(
          id: 4,
          size: Size(64.r, 37.r),
          asset: '$_path/puzzle2_5.png',
          offset: Offset(41.5.r, 38.r),
        ),
        MaskPiece(
          id: 5,
          size: Size(37.r, 37.r),
          asset: '$_path/puzzle2_6.png',
          offset: Offset(78.r, 39.r),
        ),
        MaskPiece(
          id: 6,
          size: Size(25.r, 40.r),
          asset: '$_path/puzzle2_7.png',
          offset: Offset(11.r, 75.r),
        ),
        MaskPiece(
          id: 7,
          size: Size(60.r, 69.r),
          asset: '$_path/puzzle2_8.png',
          offset: Offset(40.r, 86.r),
        ),
        MaskPiece(
          id: 8,
          size: Size(24.r, 40.r),
          asset: '$_path/puzzle2_9.png',
          offset: Offset(70.r, 75.r),
        ),
      ],
    ),
    MaskPuzzle(
      size: Size(148.r, 155.r),
      image: '$_path/puzzle3_shadow.png',
      infoImage: '$_path/puzzle3.png',
      pieces: [
        MaskPiece(
          id: 0,
          size: Size(54.r, 45.r),
          asset: '$_path/puzzle3_1.png',
          offset: Offset(2.r, 0.69.r),
        ),
        MaskPiece(
          id: 1,
          size: Size(56.r, 56.r),
          asset: '$_path/puzzle3_2.png',
          offset: Offset(48.r, 4.3.r),
        ),
        MaskPiece(
          id: 2,
          size: Size(52.r, 45.r),
          asset: '$_path/puzzle3_3.png',
          offset: Offset(93.r, 0.r),
        ),
        MaskPiece(
          id: 3,
          size: Size(47.r, 36.r),
          asset: '$_path/puzzle3_4.png',
          offset: Offset(6.r, 40.r),
        ),
        MaskPiece(
          id: 4,
          size: Size(66.r, 36.r),
          asset: '$_path/puzzle3_5.png',
          offset: Offset(46.r, 40.r),
        ),
        MaskPiece(
          id: 5,
          size: Size(48.r, 37.r),
          asset: '$_path/puzzle3_6.png',
          offset: Offset(89.r, 40.r),
        ),
        MaskPiece(
          id: 6,
          size: Size(41.r, 48.r),
          asset: '$_path/puzzle3_7.png',
          offset: Offset(7.r, 82.r),
        ),
        MaskPiece(
          id: 7,
          size: Size(60.r, 67.r),
          asset: '$_path/puzzle3_8.png',
          offset: Offset(46.r, 89.r),
        ),
        MaskPiece(
          id: 8,
          size: Size(46.r, 54.r),
          asset: '$_path/puzzle3_9.png',
          offset: Offset(88.r, 84.r),
        ),
      ],
    ),
  ];
}
