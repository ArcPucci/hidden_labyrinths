import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/game/game.dart';
import 'package:hidden_labyrinths/utils/utils.dart';

class ChestPrizesOverlay extends StatelessWidget {
  const ChestPrizesOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: game.gameManager.next,
      child: Material(
        color: Colors.black.withOpacity(0.57),
        child: ValueListenableBuilder(
          valueListenable: game.gameManager.index,
          builder: (context, value, child) {
            final shopItem = game.gameManager.prizes[value];
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: const DecorationImage(
                        image: AssetImage('assets/png/rect/rect1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                    child: Text(shopItem.name, style: AppStyles.ts12),
                  ),
                  Container(
                    width: 311.w,
                    height: 310.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/png/light.png'),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      shopItem.image,
                      width: 66.w,
                      height: 122.h,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
