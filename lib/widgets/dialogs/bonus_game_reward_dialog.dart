import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class BonusGameRewardDialog extends StatefulWidget {
  const BonusGameRewardDialog({super.key, this.shopItem, this.golds});

  final ShopItem? shopItem;
  final int? golds;

  @override
  State<BonusGameRewardDialog> createState() => _BonusGameRewardDialogState();
}

class _BonusGameRewardDialogState extends State<BonusGameRewardDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 11.h,
            right: 28.w,
            child: const SafeArea(child: CustomAppBar(canTapSettings: false)),
          ),
          Positioned(
            top: 160.h,
            child: Container(
              width: 515.w,
              height: 494.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/bonus_game_reward_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 15.w),
              child: Column(
                children: [
                  SizedBox(height: 225.h),
                  _buildReward(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReward() {
    if (widget.shopItem != null) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                image: AssetImage('assets/png/rect/rect1.png'),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 5.h,
            ),
            child: Text(
              widget.shopItem!.name,
              textAlign: TextAlign.center,
              style: AppStyles.ts8.copyWith(
                color: AppColors.yellow2,
                shadows: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 3,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: SizedBox(
                  width: 45.w,
                  height: 82.h,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.scale(
                      scale: 1.5,
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withValues(alpha: 0.25),
                            BlendMode.srcATop,
                          ),
                          child: Image.asset(
                            widget.shopItem!.image,
                            width: widget.shopItem!.width,
                            height: widget.shopItem!.height,
                            color: Colors.black.withValues(alpha: 0.25),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 45.w,
                height: 82.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(
                      widget.shopItem!.image,
                      width: widget.shopItem?.width,
                      height: widget.shopItem?.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        SizedBox(height: 20.h),
        Transform.scale(
          scale: 1.4,
          child: Image.asset(
            'assets/png/coin_shadow.png',
            width: 55.w,
            height: 55.h,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 89.w,
          height: 32.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/png/sign.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: TextWidget(text: "${widget.golds}", height: 15.h),
        ),
      ],
    );
  }
}
