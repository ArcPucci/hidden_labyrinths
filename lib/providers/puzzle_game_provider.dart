import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hidden_labyrinths/providers/providers.dart';

class PuzzleGameProvider extends ChangeNotifier {
  PuzzleGameProvider({
    required ConfigProvider configProvider,
    this.showResult,
    this.onPause,
  }) : _configProvider = configProvider {
    init();
  }

  final ConfigProvider _configProvider;
  final void Function(bool, VoidCallback?)? showResult;
  final VoidCallback? onPause;

  final List<List<int>> _matrix = [[], [], [], []];

  List<int> get matrix => _matrix.reduce((a, b) => a + b);

  Timer? _timer;

  int _seconds = _duration;

  static const int _duration = 180;

  String get _minutes => (_seconds ~/ 60).toString();

  String get _sec => (_seconds % 60).toString().padLeft(2, '0');

  String get time => "$_minutes:$_sec";

  void init() {
    _seconds = _duration;
    _generateNumbers();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_seconds == 0) {
          _timer?.cancel();

          showResult?.call(false, newGame);
          return;
        }

        _seconds--;
        notifyListeners();
      },
    );
  }

  void _generateNumbers() {
    final numbers = List.generate(16, (index) => index);

    numbers.shuffle();

    for (int i = 0; i < 4; i++) {
      while (_matrix[i].length < 4) {
        _matrix[i].add(numbers.last);
        numbers.removeLast();
      }

      numbers.shuffle();
    }
  }

  void onTap(int index) async {
    final i = index ~/ 4;
    final j = index % 4;

    if (i > 0 && _matrix[i - 1][j] == 0) {
      _matrix[i - 1][j] = _matrix[i][j];
      _matrix[i][j] = 0;
    }

    if (i < _matrix.length - 1 && _matrix[i + 1][j] == 0) {
      _matrix[i + 1][j] = _matrix[i][j];
      _matrix[i][j] = 0;
    }

    if (j > 0 && _matrix[i][j - 1] == 0) {
      _matrix[i][j - 1] = _matrix[i][j];
      _matrix[i][j] = 0;
    }

    if (j < _matrix[i].length - 1 && _matrix[i][j + 1] == 0) {
      _matrix[i][j + 1] = _matrix[i][j];
      _matrix[i][j] = 0;
    }

    if (await _checkMatrix()) {
      _timer?.cancel();

      _configProvider.addCoins(200);
      showResult?.call(true, newGame);
      return;
    }

    notifyListeners();
  }

  Future<bool> _checkMatrix() async {
    for (int i = 0; i < _matrix.length; i++) {
      for (int j = 0; j < _matrix[i].length; j++) {
        final number = i * _matrix.length + j + 1;
        if (number == 16) return true;
        if (_matrix[i][j] != number) return false;
      }
    }

    return false;
  }

  void pauseGame() {
    _timer?.cancel();
  }

  void resumeGame() {
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void newGame() {
    init();
    notifyListeners();
  }
}
