import 'package:flutter/material.dart';
import 'package:webtoon/router/app_router.dart';
import 'package:webtoon/screens/home/screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webtoon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: AppRouter.routes,
      initialRoute: AppRouter.initialRoute,
    );
  }
}

// Go router