import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/providers/config_provider.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:hidden_labyrinths/widgets/animated_widgets/lock.dart';
import 'package:provider/provider.dart';

class LevelsDialog extends StatefulWidget {
  const LevelsDialog({super.key});

  @override
  State<LevelsDialog> createState() => _LevelsDialogState();
}

class _LevelsDialogState extends State<LevelsDialog> {
  int selected = -1;
  bool animationCompleted = true;

  @override
  Widget build(BuildContext context) {
    final level = context.read<ConfigProvider>().level;
    return Stack(
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
          top: 37.h,
          left: 116.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90.w,
                height: 25.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 2),
                      blurRadius: 18.r,
                      color: AppColors.brown2,
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/png/texts/levels.png',
                width: 100.w,
                height: 40.h,
              ),
            ],
          ),
        ),
        Positioned(
          top: 85.h,
          left: 76.w,
          child: SizedBox(
            width: 170.w,
            height: 120.h,
            child: GridView.builder(
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5.h,
                mainAxisExtent: 55.h,
                crossAxisSpacing: 12.w,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (level < index) return;
                    selected = index;
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      if (selected == index)
                        Container(
                          width: 50.w,
                          height: 48.h,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color(0xFFFF0000),
                              ),
                            ],
                          ),
                        ),
                      Image.asset('assets/png/stone_cell.png'),
                      Positioned(
                        top: 14.h,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Image.asset(
                            'assets/png/symbols/${index + 1}.png',
                            height: 24.h,
                          ),
                        ),
                      ),
                      if (level < index ||
                          (!animationCompleted && level == index && index > 0))
                        Positioned(
                          bottom: 0,
                          child: Lock(animate: index == level),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 46.w,
          right: 51.w,
          bottom: 36.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Image.asset(
                  'assets/png/buttons/menu.png',
                  width: 109.w,
                  height: 32.h,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (selected == -1) return;
                  Navigator.of(context).pop();
                  context.read<ConfigProvider>().setLevel(selected);
                },
                child: Image.asset(
                  'assets/png/buttons/start.png',
                  width: 109.w,
                  height: 32.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
