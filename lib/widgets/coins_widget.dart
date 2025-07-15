import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CoinsWidget extends StatelessWidget {
  const CoinsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigProvider>(
      builder: (context, value, child) {
        return Container(
          width: 118.w,
          height: 42.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/png/sign.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Gap(13.w),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: TextWidget(
                    text: value.coins.toString(),
                    height: 23.h,
                  ),
                ),
              ),
              Gap(7.w),
              Image.asset(
                'assets/png/icons/coin.png',
                width: 22.w,
                height: 20.h,
              ),
              Gap(13.w),
            ],
          ),
        );
      },
    );
  }
}
