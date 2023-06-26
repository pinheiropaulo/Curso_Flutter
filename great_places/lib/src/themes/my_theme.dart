import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.indigo,
  ).copyWith(
    secondary: Colors.deepOrange,
  ),
);
