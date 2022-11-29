import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  canvasColor: const Color.fromRGBO(255, 254, 229, 1),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
  ).copyWith(
    secondary: Colors.amber,
  ),
  textTheme: const TextTheme(
    headline6: TextStyle(
      fontFamily: 'RobotoCondensed',
      fontSize: 20,
    ),
  ),
);
