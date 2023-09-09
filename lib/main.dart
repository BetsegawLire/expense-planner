import 'package:flutter/material.dart';

import 'widgets/expenses.dart';

var kcolorScheme = ColorScheme.fromSeed(seedColor: Colors.purpleAccent);
var kDarkColorTheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorTheme,
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorTheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorTheme.primaryContainer,
          foregroundColor: kDarkColorTheme.onPrimaryContainer,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kcolorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kcolorScheme.onPrimaryContainer,
        foregroundColor: kcolorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kcolorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kcolorScheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
    ),
    home: const Expenses(),
  ));
}
