import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/screens/onboardings/main_onboarding.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<ConfigProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (time) {
        if (provider.hasBonus && !provider.mainTutor) {
          showBonus(provider.bonus);
          provider.collectedBonus();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: 390.w,
        height: 844.h,
        child: Stack(
          children: [
            Image.asset(
              'assets/png/loading_bg.png',
              alignment: const Alignment(0, 1),
              width: 390.w,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              left: -120.w,
              top: -90.h,
              child: SafeArea(
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(-25.0, -50.0)
                    ..rotateZ(-0.1)
                    ..translate(50.0, 50.0),
                  child: Image.asset(
                    'assets/png/leaves.png',
                    width: 331.w,
                    height: 380.h,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 50.w,
              bottom: isSE ? 470.h : 350.h,
              child: const SafeArea(child: Parrot()),
            ),
            Positioned(
              left: 145.w,
              bottom: isSE ? 380.h : 280.h,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => context.go('/shop'),
                  child: Image.asset(
                    'assets/png/buttons/enter.png',
                    width: 81.w,
                    height: 34.h,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20.w,
              top: 250.h,
              child: const SafeArea(child: Flower()),
            ),
            Positioned(
              top: 11.h,
              right: 28.w,
              child: const SafeArea(child: CustomAppBar()),
            ),
            Positioned(
              left: 30.w,
              bottom: 121.h,
              child: SafeArea(
                child: StartGameSign(onTap: () => showLevelsMenu(context)),
              ),
            ),
            Positioned(
              right: 30.w,
              bottom: 167.h,
              child: SafeArea(
                child: PuzzleSign(
                  onTap: () => context.go('/puzzle'),
                ),
              ),
            ),
            Consumer<ConfigProvider>(
              builder: (context, value, child) {
                if (value.mainTutor) {
                  return Positioned.fill(
                    child: MainOnboarding(
                      onCompleted: () {
                        value.completeMainTutor();
                        if(value.hasBonus) {
                          showBonus(value.bonus);
                          value.collectedBonus();
                        }
                      },
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showLevelsMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: LevelsDialog());
      },
    );
  }

  void showBonus(ShopItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: BonusDialog(shopItem: item));
      },
    );
  }
}
