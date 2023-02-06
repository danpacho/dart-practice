import 'package:flutter/material.dart';
import 'package:pomotoro/model/timer_model.dart';
import 'package:provider/provider.dart';

class TimerProvider extends StatelessWidget {
  final Widget child;

  const TimerProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(
        totalTimerSecond: 1500,
      ),
      child: child,
    );
  }
}
