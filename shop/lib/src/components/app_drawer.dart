import 'package:flutter/material.dart';
import 'package:shop/src/routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem Vindo Usuário'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.home,
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Divider(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.orders,
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Divider(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Gerenciar Produtos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.products,
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
