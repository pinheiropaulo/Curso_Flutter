import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.purple,
  ).copyWith(
    secondary: Colors.deepOrange,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Lato',
    ),
  ),
);
