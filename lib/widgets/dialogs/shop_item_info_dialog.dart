import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:hidden_labyrinths/widgets/dialog_bg.dart';
import 'package:hidden_labyrinths/widgets/text_widget.dart';

class ShopItemInfoDialog extends StatefulWidget {
  const ShopItemInfoDialog({
    super.key,
    required this.shopItem,
    this.canBuy = true,
    this.onSubmit,
    this.onClose,
    this.close = true,
  });

  final ShopItem shopItem;
  final bool canBuy;
  final bool close;
  final VoidCallback? onSubmit;
  final VoidCallback? onClose;

  @override
  State<ShopItemInfoDialog> createState() => _ShopItemInfoDialogState();
}

class _ShopItemInfoDialogState extends State<ShopItemInfoDialog> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _visible = false),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/png/info_bg.png',
                  width: 285.w,
                  height: 446.h,
                ),
                Positioned(
                  top: 19.h,
                  right: 2.w,
                  child: GestureDetector(
                    onTap: widget.onClose ?? Navigator.of(context).pop,
                    child: Image.asset(
                      'assets/png/icons/close.png',
                      width: 26.w,
                      height: 26.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 102.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: const DecorationImage(
                          image: AssetImage('assets/png/rect/rect1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                      child: Text(widget.shopItem.name, style: AppStyles.ts12),
                    ),
                  ),
                ),
                Positioned(
                  top: 164.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      widget.shopItem.image,
                      width: 71.w,
                      height: 122.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 153.h,
                  right: 71.w,
                  child: Center(
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 31.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.r,
                              color: AppColors.brown2.withOpacity(0.08),
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage('assets/png/icons/info.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget.canBuy)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 90.h,
                    child: Center(
                      child: Container(
                        width: 96.w,
                        height: 34.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/png/sign.png'),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: TextWidget(text: "${widget.shopItem.price}"),
                      ),
                    ),
                  ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: widget.canBuy ? 38.h : 65.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.close) Navigator.of(context).pop();
                        widget.onSubmit?.call();
                      },
                      child: widget.canBuy
                          ? Image.asset(
                              'assets/png/buttons/buy.png',
                              width: 76.w,
                              height: 37.h,
                            )
                          : Image.asset(
                              'assets/png/buttons/use.png',
                              width: 77.w,
                              height: 42.h,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 31.h,
              left: 0,
              right: 0,
              child: Center(
                child: Visibility(
                  visible: _visible,
                  child: DialogBg(
                    child: Text(
                      widget.shopItem.description,
                      style: AppStyles.ts16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    _visible = !_visible;
    setState(() {});
  }
}
