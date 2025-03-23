import 'dart:convert';

import 'package:hidden_labyrinths/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  final SharedPreferences _preferences;

  PreferencesProvider(this._preferences);

  static const musicKey = "MUSIC";
  static const soundKey = "KEY";
  static const mainTutorKey = "MAIN_TUTOR";
  static const shopTutorKey = "SHOP_TUTOR";
  static const coinsKey = "COINS_KEY";
  static const potionsKey = "POTIONS";
  static const levelKey = "LEVEL";
  static const lastActiveKet = "LAST_ACTIVE";

  Future<void> setSound(int level) async {
    await _preferences.setInt(soundKey, level);
  }

  int getSound() {
    return _preferences.getInt(soundKey) ?? 1;
  }

  Future<void> setMusic(int level) async {
    await _preferences.setInt(musicKey, level);
  }

  int getMusic() {
    return _preferences.getInt(musicKey) ?? 1;
  }

  Future<void> setMainTutor() async {
    await _preferences.setBool(mainTutorKey, false);
  }

  bool getMainTutor() {
    return _preferences.getBool(mainTutorKey) ?? true;
  }

  Future<void> setShopTutor() async {
    await _preferences.setBool(shopTutorKey, false);
  }

  bool getShopTutor() {
    return _preferences.getBool(shopTutorKey) ?? true;
  }

  Future<void> setCoins(int coins) async {
    await _preferences.setInt(coinsKey, coins);
  }

  int getCoins() {
    return _preferences.getInt(coinsKey) ?? 0;
  }

  Future<void> setPotions(Map<String, int> potions) async {
    await _preferences.setString(potionsKey, jsonEncode(potions));
  }

  Map<String, int> getPotions() {
    final str = _preferences.getString(potionsKey);
    final Map<String, int> json = {};

    if (str == null) {
      for (var item in ShopItems.firstRow) {
        json[item.name] = 0;
      }

      for (var item in ShopItems.secondRow) {
        json[item.name] = 0;
      }
    } else {
      final temp = jsonDecode(str) as Map<String, dynamic>;

      for (var k in temp.keys) {
        json[k] = temp[k];
      }
    }

    return json;
  }

  Future<void> setLevel(int level) async {
    await _preferences.setInt(levelKey, level);
  }

  int getLevel() {
    return _preferences.getInt(levelKey) ?? 0;
  }

  Future<void> setLastDate() async {
    final currentDate = DateTime.now();
    final str = "${currentDate.day}/${currentDate.month}/${currentDate.year}";
    await _preferences.setString(lastActiveKet, str);
  }

  DateTime? getLastDate() {
    final str = _preferences.getString(lastActiveKet) ?? '';
    if (str.isEmpty) return null;

    final list = str.split('/');
    final date = DateTime(
      int.parse(list[2]),
      int.parse(list[1]),
      int.parse(list[0]),
    );

    return date;
  }
}
