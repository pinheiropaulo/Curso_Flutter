import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/components/cart_item_component.dart';
import 'package:shop/src/models/cart_model.dart';
import 'package:shop/src/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 25,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: colorTheme.colorScheme.primary,
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: colorTheme.primaryTextTheme.titleLarge?.color,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    child: items.isEmpty
                        ? TextButton(
                            onPressed: null,
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                color: colorTheme.colorScheme.primary,
                              ),
                            ),
                            child: const Text('COMPRAR'),
                          )
                        : TextButton(
                            onPressed: () {
                              Provider.of<OrderList>(
                                context,
                                listen: false,
                              ).addOrder(cart);

                              cart.clear();
                            },
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                color: colorTheme.colorScheme.primary,
                              ),
                            ),
                            child: const Text('COMPRAR'),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CartItemComponent(
                cartItem: items[i],
              ),
            ),
          )
        ],
      ),
    );
  }
}
