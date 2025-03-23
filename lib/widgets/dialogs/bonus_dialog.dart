import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/utils/utils.dart';

class BonusDialog extends StatelessWidget {
  const BonusDialog({super.key, required this.shopItem});

  final ShopItem shopItem;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Image.asset(
            'assets/png/stone_bg.png',
            width: 345.w,
            height: 274.h,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Image.asset(
                'assets/png/icons/close.png',
                width: 17.w,
                height: 17.h,
              ),
            ),
          ),
          Positioned(
            top: 13.h,
            left: 0,
            right: 0,
            child: Center(
              child: Transform.scale(
                scale: 1.5,
                child: Image.asset(
                  'assets/png/bonus_day.png',
                  width: 95.w,
                  height: 52.h,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 29.h,
            child: Center(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/png/light.png',
                    width: 155.w,
                    height: 155.h,
                  ),
                  Positioned(
                    bottom: 11.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: const DecorationImage(
                            image: AssetImage('assets/png/rect/rect1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                        child: Text(shopItem.name, style: AppStyles.ts12),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 26.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        shopItem.image,
                        width: 48.w,
                        height: 83.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
