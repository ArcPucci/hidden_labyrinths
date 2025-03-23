import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CoinsWidget(),
          Gap(11.w),
          GestureDetector(
            onTap: () => showSettings(context),
            child: Image.asset(
              'assets/png/buttons/settings.png',
              width: 41.w,
              height: 40.h,
            ),
          ),
        ],
      ),
    );
  }

  void showSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: SettingsDialog());
      },
    );
  }
}
