import 'dart:async';
import 'package:flutter/material.dart';

const defaultTimerSeconds = 1500;

class TimerModel extends ChangeNotifier {
  int totalTimerSecond;
  int currentTimer;
  int cycleCount = 0;
  bool isTimerStart = false;
  Timer? timer;

  TimerModel({
    required this.totalTimerSecond,
  }) : currentTimer = totalTimerSecond;

  void updatePomodoroCycle() {
    final isTimerEnd = currentTimer == 0;
    if (isTimerEnd) {
      cycleCount += 1;
      currentTimer = totalTimerSecond;

      notifyListeners();
    }
  }

  void tickTimer(Timer timer) {
    currentTimer -= 1;
    updatePomodoroCycle();

    notifyListeners();
  }

  void onTimerStart() {
    isTimerStart = true;
    timer ??= Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      tickTimer,
    );

    notifyListeners();
  }

  void onTimerStop() {
    timer?.cancel();

    isTimerStart = false;
    timer = null;

    notifyListeners();
  }

  String _getTimeString({required int time}) {
    int minute = Duration(seconds: time).inMinutes;
    int second = Duration(seconds: time % 60).inSeconds;

    String timeString = '$minute:${second <= 9 ? '0$second' : second}';

    return timeString;
  }

  String get timeString {
    return _getTimeString(time: currentTimer);
  }
}
