import 'package:flutter/material.dart';
import 'package:pomotoro/common/style/global_style.dart';
import 'package:pomotoro/providers/timer_provider.dart';
import 'package:pomotoro/screens/home_screen.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalStyle(
      widget: TimerProvider(
        child: HomeScreen(),
      ),
    );
  }
}
