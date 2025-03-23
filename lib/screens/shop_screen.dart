import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/screens/screens.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:hidden_labyrinths/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/shop_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 65.h,
            left: 0,
            right: 0,
            child: const Center(child: SafeArea(child: AnimatedSoldSign())),
          ),
          Positioned(
            left: -60.w,
            top: 212.h,
            child: const SafeArea(child: AnimatedLeaf1()),
          ),
          Positioned(
            left: -15.w,
            top: 116.h,
            child: const SafeArea(child: AnimatedLeaf2()),
          ),
          Positioned(
            right: -0.w,
            top: 177.h,
            child: const SafeArea(child: AnimatedLeaf3()),
          ),
          Positioned(
            left: 7.w,
            top: 99.h,
            child: SafeArea(
              child: GestureDetector(
                onTap: context.pop,
                child: Image.asset(
                  'assets/png/icons/arrow_left.png',
                  width: 61.w,
                  height: 36.h,
                ),
              ),
            ),
          ),
          Positioned(
            top: 11.h,
            right: 28.w,
            child: const SafeArea(child: CustomAppBar()),
          ),
          Positioned(
            top: 480.h,
            right: -37.w,
            child: SafeArea(
              child: Image.asset(
                'assets/png/stick3.png',
                width: 134.w,
                height: 26.h,
              ),
            ),
          ),
          Positioned(
            top: 437.h,
            right: 20.w,
            child: SafeArea(
              child: Parrot(
                width: 39.w,
                height: 67.h,
              ),
            ),
          ),
          Positioned(
            left: 84.w,
            top: isSE ? 430.h : 410.h,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  ShopItems.firstRow.length,
                  (index) {
                    final shopItem = ShopItems.firstRow[index];
                    return Padding(
                      padding: EdgeInsets.only(left: index != 0 ? 28.w : 0),
                      child: Column(
                        children: [
                          Transform.scale(
                            scale: 1.05,
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              shopItem.image,
                              width: shopItem.width,
                              height: shopItem.height,
                            ),
                          ),
                          _buildBuyButton(
                            context,
                            shopItem,
                            () => context
                                .read<ConfigProvider>()
                                .buyItem(shopItem),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: 27.w,
            top: isSE ? 498.h : 468.h,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  ShopItems.secondRow.length,
                  (index) {
                    final shopItem = ShopItems.secondRow[index];
                    return Padding(
                      padding: EdgeInsets.only(left: index != 0 ? 30.w : 0),
                      child: Column(
                        children: [
                          Transform.scale(
                            scale: 1.05,
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              shopItem.image,
                              width: shopItem.width,
                              height: shopItem.height,
                            ),
                          ),
                          Gap(6.h),
                          _buildBuyButton(
                            context,
                            shopItem,
                            () => context
                                .read<ConfigProvider>()
                                .buyItem(shopItem),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: 27.w,
            bottom: 24.h,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  ShopItems.thirdRow.length,
                  (index) {
                    final shopItem = ShopItems.thirdRow[index];
                    return Padding(
                      padding: EdgeInsets.only(left: index != 0 ? 10.w : 0),
                      child: Column(
                        children: [
                          Image.asset(
                            shopItem.image,
                            width: shopItem.width,
                            height: shopItem.height,
                          ),
                          _buildBuyButton(
                            context,
                            shopItem,
                            () {
                              context.read<ConfigProvider>().buyItem(shopItem);
                              showChest(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Consumer<ConfigProvider>(
            builder: (context, value, child) {
              if (value.shopTutor) {
                return Positioned.fill(
                  child: ShopOnboarding(onCompleted: value.completeShopTutor),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBuyButton(
    BuildContext context,
    ShopItem item,
    VoidCallback? onSubmit,
  ) {
    return GestureDetector(
      onTap: () => showItemInfo(context, item, onSubmit),
      child: Image.asset(
        'assets/png/buttons/buy.png',
        width: 52.w,
        height: 25.h,
      ),
    );
  }

  void showItemInfo(
    BuildContext context,
    ShopItem item,
    VoidCallback? onSubmit,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return ShopItemInfoDialog(shopItem: item, onSubmit: onSubmit);
      },
    );
  }

  void showChest(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const ChestPrizesDialog();
      },
    );
  }
}
