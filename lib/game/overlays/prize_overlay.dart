import 'package:flutter/material.dart';
import 'package:hidden_labyrinths/game/game.dart';
import 'package:hidden_labyrinths/widgets/dialogs/shop_item_info_dialog.dart';

class PrizeOverlay extends StatelessWidget {
  const PrizeOverlay(this.game, {super.key});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.57),
      child: Center(
        child: ShopItemInfoDialog(
          shopItem: game.gameManager.randShopItem,
          canBuy: false,
          close: false,
          onClose: game.closePrizeOverlay,
          onSubmit: game.usePrize,
        ),
      ),
    );
  }
}
