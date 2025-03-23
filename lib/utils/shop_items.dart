import 'package:hidden_labyrinths/models/models.dart';

class ShopItems {
  static final List<ShopItem> firstRow = [
    BigTransitionPotion(),
    MiddleTransitionPotion(),
    SmallTransitionPotion(),
  ];

  static final List<ShopItem> secondRow = [
    RecoveryPotion(),
    BigTimePotion(),
    MiddleTimePotion(),
    SmallTimePotion(),
  ];

  static final List<ShopItem> thirdRow = [BigChest(), MiddleChest(), SmallChest()];
}
