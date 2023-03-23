import 'package:flutter/material.dart';
import 'package:meals/components/create_item.dart';
import 'package:meals/routes/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomCenter,
            child: Text(
              "Vamos Cozinhar ?",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CreateItem(
            icon: Icons.restaurant,
            label: "Refeições",
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.home,
            ),
          ),
          CreateItem(
            icon: Icons.settings,
            label: "Configurações",
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.settings,
            ),
          ),
        ],
      ),
    );
  }
}
