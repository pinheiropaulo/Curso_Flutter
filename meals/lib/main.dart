import 'package:flutter/material.dart';
import 'package:meals/routes/app_routes.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/themes/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: myTheme,
      routes: {
        AppRoutes.HOME: (ctx) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
      },
    );
  }
}
