import 'package:flutter/material.dart';
import 'package:shop/src/utils/custom_route.dart';

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
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomPageTransitionsBuilder(),
    },
  ),
);
