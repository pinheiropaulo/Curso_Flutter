import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/cart_model.dart';
import 'package:shop/src/models/order_list.dart';
import 'package:shop/src/models/product_list_model.dart';
import 'package:shop/src/pages/cart_page.dart';
import 'package:shop/src/pages/orders_page.dart';
import 'package:shop/src/pages/products_detail_page.dart';
import 'package:shop/src/pages/products_form_page.dart';
import 'package:shop/src/pages/products_overview_page.dart';
import 'package:shop/src/pages/products_page.dart';
import 'package:shop/src/routes/app_routes.dart';
import 'package:shop/src/themes/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: myTheme,
        // home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
      ),
    );
  }
}
