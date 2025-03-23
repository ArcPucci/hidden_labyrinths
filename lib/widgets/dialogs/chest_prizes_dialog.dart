import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:provider/provider.dart';

class ChestPrizesDialog extends StatefulWidget {
  const ChestPrizesDialog({super.key});

  @override
  State<ChestPrizesDialog> createState() => _ChestPrizesDialogState();
}

class _ChestPrizesDialogState extends State<ChestPrizesDialog> {
  List<ShopItem> list = [];

  int index = -1;

  @override
  void initState() {
    super.initState();
    list = List.from(context.read<ConfigProvider>().prizes);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(index == list.length - 1) {
          Navigator.of(context).pop();
          return;
        }
        index++;
        setState(() {});
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            index == -1
                ? Image.asset(
                    'assets/png/shop/chest.png',
                    width: 191.w,
                    height: 158.h,
                  )
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: const DecorationImage(
                            image: AssetImage('assets/png/rect/rect1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 5.h,
                        ),
                        child: Text(list[index].name, style: AppStyles.ts12),
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
                          list[index].image,
                          width: 66.w,
                          height: 122.h,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
