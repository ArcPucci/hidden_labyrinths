import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:hidden_labyrinths/game/game.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/providers/providers.dart';

class GameManager extends Component with HasGameRef<MyGame> {
  GameManager(this.configProvider);

  final ConfigProvider configProvider;

  ValueNotifier<bool> ancientTime = ValueNotifier(true);

  late TimerComponent timerComponent;

  bool hasKey = false;
  bool collectedBag = false;
  bool openedChest = false;

  bool gameOver = false;
  bool won = true;

  ValueNotifier<int> seconds = ValueNotifier(180);
  ValueNotifier<int> jumps = ValueNotifier(5);

  ValueNotifier<Map<String, int>> potions = ValueNotifier({});

  ShopItem _randShopItem = SmallTimePotion();

  ShopItem get randShopItem => _randShopItem;

  int get stars =>
      won ? (1 + (collectedBag ? 1 : 0) + (openedChest ? 1 : 0)) : 0;

  int _coins = 0;

  int get coins => _coins;

  final List<ShopItem> _prizes = [];

  List<ShopItem> get prizes => _prizes;

  ValueNotifier<int> index = ValueNotifier(0);

  void changeTime() {
    if (ancientTime.value) {
      if (jumps.value == 0) return;
      jumps.value--;
    }
    ancientTime.value = !ancientTime.value;
    gameRef.changeSkin();
  }

  void collectKey() => hasKey = true;

  void collectBag() {
    collectedBag = true;

    final rand1 = Random().nextInt(100);
    final rand2 = Random().nextBool();

    if (rand1 > 95) {
      _randShopItem = rand2 ? RecoveryPotion() : SmallChest();
      _prizes.clear();

      if (!rand2) {
        final rand3 = Random().nextInt(1) + 2;

        for (int i = 0; i < rand3; i++) {
          final temp = Random().nextInt(3);

          if (temp == 0) {
            _prizes.add(SmallTimePotion());
          } else if (temp == 1) {
            _prizes.add(SmallTransitionPotion());
          } else {
            _prizes.add(GoldChest());
          }
        }

        return;
      }
    } else if (rand1 > 80) {
      _randShopItem = rand2 ? BigTransitionPotion() : BigTimePotion();
    } else if (rand1 > 70) {
      _randShopItem = rand2 ? MiddleTimePotion() : MiddleTransitionPotion();
    } else {
      _randShopItem = rand2 ? SmallTimePotion() : SmallTransitionPotion();
    }

    final updatedPotions = Map<String, int>.from(potions.value);
    updatedPotions[_randShopItem.name] =
        (updatedPotions[_randShopItem.name] ?? 0) + 1;
    potions.value = updatedPotions;
  }

  void openChest() {
    _coins += 300;
    openedChest = true;
  }

  @override
  FutureOr<void> onLoad() {
    timerComponent = TimerComponent(
      period: 1,
      repeat: true,
      onTick: () {
        seconds.value--;

        if (seconds.value <= 0) {
          won = false;
          timerComponent.removeFromParent();
          gameRef.gameOver(false);
          _coins = 0;
        }
      },
    );

    add(timerComponent);
    return super.onLoad();
  }

  void stopTimer(bool won) {
    if (gameOver) return;
    gameOver = true;
    if (children.contains(timerComponent)) timerComponent.removeFromParent();
    if (won) _coins += 200;

    configProvider.addCoins(_coins);
    if (won) configProvider.nextLevel();
  }

  void pause() {
    if (children.contains(timerComponent)) timerComponent.removeFromParent();
  }

  void resume() {
    if (!children.contains(timerComponent)) add(timerComponent);
  }

  void next() {
    if (_prizes[index.value] is GoldChest) {
      _coins += 50;
    } else {
      final updatedPotions = Map<String, int>.from(potions.value);
      updatedPotions[_prizes[index.value].name] =
          (updatedPotions[_prizes[index.value].name] ?? 0) + 1;
      potions.value = updatedPotions;
      configProvider.setPotions(updatedPotions);
    }

    if (index.value == _prizes.length - 1) {
      gameRef.closeChestPrizes();
      return;
    }

    index.value++;
  }

  void usePrize() {
    if (_randShopItem is SmallChest) {
      gameRef.showChestPrizes();
    } else {
      if (gameOver) return;
      usePotion(_randShopItem);
    }
  }

  void usePotion(ShopItem potion) {
    if (potion is RecoveryPotion) {
      init();
    } else if (potion is TimePotion) {
      seconds.value += potion.seconds;
    } else if (potion is TransitionPotion) {
      jumps.value += potion.transitions;
      if (jumps.value > 5) jumps.value = 5;
    }

    final updatedPotions = Map<String, int>.from(potions.value);
    updatedPotions[potion.name] = (updatedPotions[potion.name] ?? 0) - 1;
    potions.value = updatedPotions;
    configProvider.setPotions(updatedPotions);
  }

  void init() async {
    seconds.value = 180;
    jumps.value = 5;
    ancientTime.value = true;
    potions.value = configProvider.potions;
    if (children.contains(timerComponent)) timerComponent.removeFromParent();
    add(timerComponent);
  }
}
