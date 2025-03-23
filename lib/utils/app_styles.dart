import 'package:flutter/material.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static const _eras = "ERAS";
  static const _j = "JotiOne";
  static const _ink = "InknutAntiqua";

  static final TextStyle ts12 = TextStyle(
    fontFamily: _eras,
    fontSize: 12.r,
    height: 22 / 12,
    letterSpacing: -0.41,
    color: AppColors.yellow2,
    shadows: [
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 4.r,
        color: Colors.black.withOpacity(0.02),
      ),
    ],
  );

  static final TextStyle ts16 = TextStyle(
    fontFamily: _eras,
    fontSize: 16.r,
    height: 24 / 16,
    letterSpacing: -0.41,
    color: AppColors.brown,
  );

  static final TextStyle ts17 = TextStyle(
    fontFamily: _eras,
    fontSize: 17.r,
    height: 22 / 17,
    letterSpacing: -0.41,
    color: AppColors.yellow3,
  );

  static final TextStyle ts11 = TextStyle(
    fontFamily: _eras,
    fontSize: 11.r,
    height: 22 / 11,
    letterSpacing: -0.41,
    color: AppColors.yellow3,
  );

  static final TextStyle ts9 = TextStyle(
    fontFamily: _eras,
    fontSize: 9.r,
    height: 17 / 9,
    letterSpacing: -0.41,
    color: AppColors.brown,
  );

  static final TextStyle ts8 = TextStyle(
    fontFamily: _eras,
    fontSize: 8.r,
    height: 13 / 8,
    letterSpacing: -0.41,
    color: AppColors.brown,
  );

  static final TextStyle j48 = TextStyle(
    fontFamily: _j,
    fontSize: 48.r,
    height: 1,
    letterSpacing: -0.41,
    color: AppColors.yellow4,
  );

  static final TextStyle ink17_400 = TextStyle(
    fontFamily: _ink,
    fontWeight: FontWeight.w400,
    fontSize: 17.r,
    height: 26 / 17,
    letterSpacing: -0.41,
    color: Colors.white,
  );

  static final TextStyle ink17_700 = TextStyle(
    fontFamily: _ink,
    fontWeight: FontWeight.w700,
    fontSize: 17.r,
    height: 1.45,
    letterSpacing: -0.41,
    color: Colors.white,
  );
}
