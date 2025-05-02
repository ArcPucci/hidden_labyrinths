import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_labyrinths/models/models.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:just_audio/just_audio.dart';

class ConfigProvider extends ChangeNotifier {
  ConfigProvider(this._preferencesProvider, this._router) {
    init();
  }

  final GoRouter _router;
  final PreferencesProvider _preferencesProvider;

  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _mainTutor = true;

  bool get mainTutor => _mainTutor;

  bool _shopTutor = true;

  bool get shopTutor => _shopTutor;

  int _coins = 0;

  int get coins => _coins;

  int _music = 0;

  int get music => _music;

  int _sound = 0;

  int get sound => _sound;

  Map<String, int> _potions = {};

  Map<String, int> get potions => _potions;

  int _level = 0;

  int get level => _level;

  List<ShopItem> _prizes = [];

  List<ShopItem> get prizes => _prizes;

  int _selectedLevel = 0;

  int get selectedLevel => _selectedLevel;

  DateTime? _date;

  bool _hasBonus = false;

  bool get hasBonus => _hasBonus;

  ShopItem _bonus = SmallTimePotion();

  ShopItem get bonus => _bonus;

  void init() async {
    _mainTutor = _preferencesProvider.getMainTutor();
    _shopTutor = _preferencesProvider.getShopTutor();
    _coins = _preferencesProvider.getCoins();
    _music = _preferencesProvider.getMusic();
    _sound = _preferencesProvider.getSound();
    _potions = _preferencesProvider.getPotions();
    _level = _preferencesProvider.getLevel();
    _date = _preferencesProvider.getLastDate();

    if (_music > 0) {
      await _playBackgroundMusic();
    }

    if (_date == null) {
      _hasBonus = Random().nextBool();
    } else {
      final currentDate = DateTime.now();

      if (currentDate.year != _date?.year ||
          currentDate.month != _date?.month ||
          currentDate.day != _date?.day) {
        _hasBonus = Random().nextBool();
        if (_hasBonus) {
          _hasBonus = Random().nextBool();
        }
      }
    }

    if (_hasBonus) generateBonus();
  }

  void generateBonus() async {
    final list = List.from(ShopItems.firstRow + ShopItems.secondRow);
    list.shuffle();

    _bonus = list.first;

    _potions[_bonus.name] = (_potions[_bonus.name]! + 1);

    await _preferencesProvider.setLastDate();
  }

  void collectedBonus() {
    _hasBonus = false;
  }

  void completeMainTutor() async {
    _mainTutor = false;
    await _preferencesProvider.setMainTutor();

    notifyListeners();
  }

  void completeShopTutor() async {
    _shopTutor = false;
    await _preferencesProvider.setShopTutor();

    notifyListeners();
  }

  void addCoins(int coins) async {
    _coins += coins;
    await _preferencesProvider.setCoins(_coins);

    notifyListeners();
  }

  void setMusic(int level) async {
    if (level == 0) {
      _music = level;
      await _stopBackgroundMusic();
    } else {
      if (_music == 0) {
        _music = level;
        await _playBackgroundMusic();
      } else {
        final volume = level / 8;
        _music = level;
        await _audioPlayer.setVolume(volume);
      }
    }

    await _preferencesProvider.setMusic(level);

    notifyListeners();
  }

  void setSound(int level) async {
    _sound = level;
    await _preferencesProvider.setSound(level);

    notifyListeners();
  }

  void setPotions(Map<String, int> potions) async {
    _potions = Map<String, int>.from(potions);
    await _preferencesProvider.setPotions(_potions);

    notifyListeners();
  }

  void buyItem(ShopItem item) async {
    if (item.price > _coins) return;
    _coins -= item.price;
    _prizes.clear();

    if (item is Chest) {
      final rand1 = Random().nextInt(2) + 2;
      if (item is BigChest) {
        for (int i = 0; i < rand1; i++) {
          final rand2 = Random().nextInt(4);

          if (rand2 == 0) {
            _prizes.add(GoldChest());
            _coins += 100;
          } else if (rand2 == 1) {
            _prizes.add(RecoveryPotion());
            _potions[_prizes.last.name] = _potions[_prizes.last.name]! + 1;
          } else if (rand2 == 2) {
            _prizes.add(BigTransitionPotion());
            _potions[_prizes.last.name] = _potions[_prizes.last.name]! + 1;
          } else {
            _prizes.add(BigTimePotion());
            _potions[_prizes.last.name] = _potions[_prizes.last.name]! + 1;
          }
        }
      } else if (item is MiddleChest) {
        for (int i = 0; i < rand1; i++) {
          final rand2 = Random().nextInt(3);

          if (rand2 == 0) {
            _prizes.add(GoldChest());
            _coins += 75;
          } else if (rand2 == 1) {
            _prizes.add(MiddleTransitionPotion());
            _potions[_prizes.last.name] = _potions[_prizes.last.name]! + 1;
          } else {
            _prizes.add(MiddleTimePotion());
            _potions[_prizes.last.name] = _potions[_prizes.last.name]! + 1;
          }
        }
      } else {
        for (int i = 0; i < rand1; i++) {
          final rand2 = Random().nextInt(3);

          if (rand2 == 0) {
            _prizes.add(GoldChest());
            _coins += 50;
          } else if (rand2 == 1) {
            _prizes.add(SmallTimePotion());
            _potions[_prizes.last.name] = _potions[_prizes.last.name]! + 1;
          } else {
            _prizes.add(SmallTransitionPotion());
            _potions[_prizes.last.name] = _potions[_prizes.last.name]! + 1;
          }
        }
      }
    } else {
      _potions[item.name] = _potions[item.name]! + 1;
    }

    await _preferencesProvider.setPotions(_potions);
    await _preferencesProvider.setCoins(_coins);
    notifyListeners();
  }

  void addPotion(ShopItem item) async {
    _potions[item.name] = _potions[item.name]! + 1;
    await _preferencesProvider.setPotions(_potions);
  }

  void nextLevel() async {
    if (_level == _selectedLevel) {
      if (_level >= 5) return;
      _level++;
      _selectedLevel = _level;
      await _preferencesProvider.setLevel(_level);
    } else {
      _selectedLevel++;
    }
  }

  void setLevel(int index) {
    _selectedLevel = index;
    _router.go('/game');
  }

  Future<void> _playBackgroundMusic() async {
    try {
      await _audioPlayer.setAsset('assets/sounds/music1.mp3');
      _audioPlayer.setVolume(_music / 8);
      _audioPlayer.setLoopMode(LoopMode.one);
      _audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopBackgroundMusic() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
