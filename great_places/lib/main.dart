import 'package:flutter/material.dart';
import 'package:great_places/src/routes/app_routes.dart';
import 'package:great_places/src/screens/places/place_form_screen.dart';
import 'package:great_places/src/screens/places/places_list_screen.dart';
import 'package:great_places/src/themes/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: myTheme,
      home: const PlacesListScreen(),
      routes: {
        AppRoutes.placeForm: (ctx) => const PlaceFormScreen(),
      },
    );
  }
}
