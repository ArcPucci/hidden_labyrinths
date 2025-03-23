import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text, this.height});

  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        text.length,
        (index) {
          return Image.asset(
            _getAsset(text[index]),
            height: height ?? 15.h,
          );
        },
      ),
    );
  }

  String _getAsset(String symbol) => switch (symbol) {
        "0" => "assets/png/symbols/0.png",
        "1" => "assets/png/symbols/1.png",
        "2" => "assets/png/symbols/2.png",
        "3" => "assets/png/symbols/3.png",
        "4" => "assets/png/symbols/4.png",
        "5" => "assets/png/symbols/5.png",
        "6" => "assets/png/symbols/6.png",
        "7" => "assets/png/symbols/7.png",
        "8" => "assets/png/symbols/8.png",
        "9" => "assets/png/symbols/9.png",
        ":" => "assets/png/symbols/colon.png",
        _ => "assets/png/symbols/9.png",
      };
}
