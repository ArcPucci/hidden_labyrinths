import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';

class MenuDialog extends StatelessWidget {
  const MenuDialog({
    super.key,
    this.onTapNewGame,
    this.onTapRules,
    this.onClose,
  });

  final VoidCallback? onTapRules;
  final VoidCallback? onTapNewGame;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      height: 441.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/settings_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 93.h,
            bottom: 72.h,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    onTapNewGame?.call();
                  },
                  child: Image.asset(
                    'assets/png/buttons/new_game_2.png',
                    width: 181.w,
                    height: 53.h,
                  ),
                ),
                GestureDetector(
                  onTap: () => showSettings(context),
                  child: Image.asset(
                    'assets/png/texts/sound.png',
                    width: 181.w,
                    height: 53.h,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pop();
                  },
                  child: Image.asset(
                    'assets/png/buttons/menu.png',
                    width: 181.w,
                    height: 53.h,
                  ),
                ),
                GestureDetector(
                  onTap: onTapRules,
                  child: Image.asset(
                    'assets/png/buttons/rules.png',
                    width: 181.w,
                    height: 53.h,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20.h,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                onClose?.call();
              },
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
  }

  void showSettings(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      useSafeArea: false,
      builder: (context) {
        return const Center(child: SettingsDialog());
      },
    );
  }
}
