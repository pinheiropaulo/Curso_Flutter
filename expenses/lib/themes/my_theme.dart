import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.purple,
  ).copyWith(
    secondary: Colors.amber,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headline6: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    button: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
