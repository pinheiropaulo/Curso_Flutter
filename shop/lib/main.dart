import 'package:flutter/material.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/themes/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: myTheme,
      home: ProductsOverviewPage(),
    );
  }
}
