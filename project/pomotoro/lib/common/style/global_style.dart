import 'package:flutter/material.dart';

final themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 231, 98, 108),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color.fromARGB(255, 35, 43, 85),
    ),
    titleMedium: TextStyle(
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFFF4EDDB),
  ),
);

class GlobalStyle extends StatelessWidget {
  final Widget widget;

  const GlobalStyle({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: widget,
    );
  }
}
