import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
          width: 328.w,
          height: 441.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/png/settings_bg.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    Gap(120.h),
                    Image.asset(
                      'assets/png/texts/music.png',
                      width: 181.w,
                      height: 54.h,
                    ),
                    Gap(15.h),
                    ScaleWidget(
                      index: value.music,
                      onDecrease: value.setMusic,
                      onIncrease: value.setMusic,
                    ),
                    Gap(37.h),
                    Image.asset(
                      'assets/png/texts/sound.png',
                      width: 181.w,
                      height: 54.h,
                    ),
                    Gap(15.h),
                    ScaleWidget(
                      index: value.sound,
                      onIncrease: value.setSound,
                      onDecrease: value.setSound,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.h,
                right: 0,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Image.asset(
                    'assets/png/icons/close.png',
                    width: 26.w,
                    height: 26.h,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
