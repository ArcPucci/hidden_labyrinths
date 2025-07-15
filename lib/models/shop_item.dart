import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class ShopItem {
  final int price;
  final String name;
  final String image;
  final double width;
  final double height;
  final String description;

  ShopItem({
    required this.price,
    required this.name,
    required this.image,
    required this.width,
    required this.height,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopItem &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          name == other.name &&
          image == other.image &&
          width == other.width &&
          height == other.height &&
          description == other.description;

  @override
  int get hashCode =>
      price.hashCode ^
      name.hashCode ^
      image.hashCode ^
      width.hashCode ^
      height.hashCode ^
      description.hashCode;
}

abstract class TransitionPotion extends ShopItem {
  final int transitions;

  TransitionPotion({
    required super.price,
    required super.name,
    required super.width,
    required super.height,
    required this.transitions,
    required super.description,
  }) : super(image: "assets/png/shop/transition_potion.png");
}

class RecoveryPotion extends ShopItem {
  RecoveryPotion()
      : super(
          name: "BOG BOTTLE OF RECOVERY",
          price: 700,
          width: 52.w,
          height: 93.h,
          image: "assets/png/shop/recovery_potion.png",
          description: "Restores full time and transition reserves.",
        );
}

abstract class TimePotion extends ShopItem {
  final int seconds;

  TimePotion({
    required super.price,
    required super.name,
    required super.width,
    required super.height,
    required this.seconds,
    required super.description,
  }) : super(image: "assets/png/shop/time_potion.png");
}

abstract class Chest extends ShopItem {
  Chest({
    required super.price,
    required super.name,
    required super.width,
    required super.height,
    required super.description,
  }) : super(image: 'assets/png/shop/chest.png');
}

class SmallTimePotion extends TimePotion {
  SmallTimePotion()
      : super(
          price: 150,
          name: "SMALL BOTTLE OF TIME",
          description:
              "When using this bottle during the game, you increase the game time by 30 seconds.",
          seconds: 30,
          width: 22.w,
          height: 42.h,
        );
}

class MiddleTimePotion extends TimePotion {
  MiddleTimePotion()
      : super(
          price: 250,
          name: "MIDDLE BOTTLE OF TIME",
          description:
              "When using this bottle during the game, you increase the game time by 1 minutes.",
          seconds: 60,
          width: 33.w,
          height: 61.h,
        );
}

class BigTimePotion extends TimePotion {
  BigTimePotion()
      : super(
          price: 350,
          name: "BIG BOTTLE OF TIME",
          description:
              "When using this bottle during the game, you increase the game time by 2 minutes.",
          seconds: 120,
          width: 37.w,
          height: 68.h,
        );
}

class BigTransitionPotion extends TransitionPotion {
  BigTransitionPotion()
      : super(
          price: 350,
          name: "BIG BOTTLE OF TRANSITION",
          description:
              "Allows you to increase the number of transitions between worlds by 3 cells.",
          transitions: 3,
          width: 39.w,
          height: 66.h,
        );
}

class MiddleTransitionPotion extends TransitionPotion {
  MiddleTransitionPotion()
      : super(
          price: 250,
          name: "MIDDLE BOTTLE OF TRANSITION",
          description:
              "Allows you to increase the number of transitions between worlds by 2 cells.",
          transitions: 2,
          width: 33.w,
          height: 61.h,
        );
}

class SmallTransitionPotion extends TransitionPotion {
  SmallTransitionPotion()
      : super(
          price: 150,
          name: "SMALL BOTTLE OF TRANSITION",
          description:
              "Allows you to increase the number of transitions between worlds by 1 cells.",
          transitions: 1,
          width: 24.w,
          height: 40.h,
        );
}

class SmallChest extends Chest {
  SmallChest()
      : super(
          name: "SMALL SURPRISE CHEST",
          price: 200,
          width: 74.w,
          height: 56.h,
          description:
              "When you open the chest you win two or three random small bottles, there may also be coins, good luck!",
        );
}

class MiddleChest extends Chest {
  MiddleChest()
      : super(
          name: "MIDDLE SURPRISE CHEST",
          price: 350,
          width: 103.w,
          height: 78.h,
          description:
              "When you open the chest you win two or three random medium-sized bottles, there may also be coins, good luck!",
        );
}

class BigChest extends Chest {
  BigChest()
      : super(
          name: "BIG SURPRISE CHEST",
          price: 500,
          width: 125.w,
          height: 103.h,
          description:
              "When you open the chest you win two or three random large bottles, there may also be coins, good luck!",
        );
}

class GoldChest extends ShopItem {
  GoldChest({
    super.price = 0,
    super.name = "Gold",
    super.image = 'assets/images/gold_chest.png',
    super.description = "",
  }) : super(width: 235.w, height: 245.h);
}
