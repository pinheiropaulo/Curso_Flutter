import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/auth/auth.dart';
import 'package:shop/src/models/cart/cart_model.dart';
import 'package:shop/src/models/order/order_list.dart';
import 'package:shop/src/models/product/product_list_model.dart';
import 'package:shop/src/pages/auth/auth_or_home_page.dart';
import 'package:shop/src/pages/cart/cart_page.dart';
import 'package:shop/src/pages/orders/orders_page.dart';
import 'package:shop/src/pages/products/products_detail_page.dart';
import 'package:shop/src/pages/products/products_form_page.dart';
import 'package:shop/src/pages/products/products_page.dart';
import 'package:shop/src/routes/app_routes.dart';
import 'package:shop/src/themes/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductsList>(
          create: (_) => ProductsList(),
          update: (ctx, auth, previous) {
            return ProductsList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previous) {
            return OrderList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: myTheme,
        // home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.authOrHome: (ctx) => const AuthOrHomePage(),
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
