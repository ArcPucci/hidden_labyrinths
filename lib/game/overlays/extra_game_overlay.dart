import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../widgets/widgets.dart';
import '../game.dart';

class ExtraGameOverlay extends StatefulWidget {
  const ExtraGameOverlay(this.game, {super.key});

  final MyGame game;

  @override
  State<ExtraGameOverlay> createState() => _ExtraGameOverlayState();
}

class _ExtraGameOverlayState extends State<ExtraGameOverlay> {
  int _selected = -1;
  bool _opened = false;
  bool _showReward = false;
  final int _rand = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    final seconds = widget.game.gameManager.seconds;
    return Material(
      color: Colors.black.withValues(alpha: 0.57),
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Gap(9.w),
                        const CoinsWidget(),
                        Gap(20.w),
                        Container(
                          width: 104.w,
                          height: 64.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/png/rect/rect3.png'),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/crystal_past_active.png',
                                width: 57.w,
                                height: 54.h,
                              ),
                              Image.asset(
                                'assets/images/crystal_future.png',
                                width: 43.w,
                                height: 43.h,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/png/buttons/menu2.png',
                          width: 78.w,
                          height: 40.h,
                        ),
                        Gap(26.w),
                      ],
                    ),
                    Gap(4.h),
                    Container(
                      width: 80.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/png/rect/rect2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: seconds,
                        builder: (context, value, child) {
                          final minutes = (value ~/ 60);
                          final sec = (value % 60).toString().padLeft(2, '0');
                          return TextWidget(text: '$minutes:$sec');
                        },
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 57.h,
                  left: 9.w,
                  child: ValueListenableBuilder(
                    valueListenable: widget.game.gameManager.jumps,
                    builder: (BuildContext context, int value, Widget? child) {
                      return Image.asset(
                        'assets/images/jump_scale_$value.png',
                        width: 118.w,
                        height: 24.h,
                      );
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: !_showReward,
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 13.h),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/extra_game_bg.png',
                              width: 310.w,
                              height: 463.h,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 40.w,
                              child: SizedBox(
                                width: 220.w,
                                height: 220.w,
                                child: GridView.builder(
                                  itemCount: 4,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 105.r,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Align(
                                      alignment: Alignment.bottomCenter,
                                      child: _buildChest(index),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () => widget.game.closeExtraGameOverlay(0),
                          child: Image.asset(
                            'assets/png/icons/close.png',
                            width: 26.w,
                            height: 26.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  if (!_opened)
                    GestureDetector(
                      onTap: () async {
                        setState(() => _opened = true);
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() => _showReward = true);
                        await Future.delayed(const Duration(seconds: 2));
                        widget.game.closeExtraGameOverlay(_rand);
                      },
                      child: Image.asset(
                        _selected == -1
                            ? 'assets/images/open_disabled.png'
                            : 'assets/images/open.png',
                        width: 158.w,
                        height: 47.h,
                      ),
                    ),
                ],
              ),
            ),
            Visibility(
              visible: _showReward,
              child: Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (_rand > 0)
                      Image.asset(
                        'assets/png/light.png',
                        width: 423.w,
                        height: 406.h,
                      ),
                    _buildBigReward(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBigReward() {
    if (_rand == 2) {
      return Image.asset(
        'assets/images/chest_2.png',
        width: 201.w,
        height: 235.h,
      );
    }

    if (_rand == 1) {
      return Image.asset(
        'assets/images/chest_1.png',
        width: 201.w,
        height: 235.h,
      );
    }

    return Image.asset(
      'assets/images/empty_chest_2.png',
      width: 197.w,
      height: 230.h,
    );
  }

  Widget _buildChest(int index) {
    if (_opened && index == _selected) {
      if (_rand == 0) {
        return Transform.scale(
          scale: 1.6,
          child: Image.asset(
            'assets/images/selected_empty_chest.png',
            width: 90.r,
            height: 105.r,
          ),
        );
      }

      if (_rand == 2) {
        return Transform.scale(
          scale: 1.6,
          child: Image.asset(
            'assets/images/selected_chest_2.png',
            width: 90.r,
            height: 105.r,
          ),
        );
      }

      return Transform.scale(
        scale: 1.6,
        child: Image.asset(
          'assets/images/selected_chest_1.png',
          width: 90.r,
          height: 105.r,
        ),
      );
    }

    if (index == _selected) {
      return Transform.scale(
        scale: 1.6,
        child: GestureDetector(
          onTap: () => setState(() => _selected = -1),
          child: Image.asset(
            'assets/images/selected_chest.png',
            width: 85.r,
            height: 75.r,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _onSelect(index),
      child: Image.asset(
        'assets/images/simple_chest.png',
        width: 85.r,
        height: 75.r,
      ),
    );
  }

  void _onSelect(int index) {
    if (_opened) return;
    setState(() => _selected = index);
  }
}
