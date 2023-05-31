import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/cart/cart_item_model.dart';
import 'package:shop/src/models/cart/cart_model.dart';

class CartItemComponent extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemComponent({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);

    const margin = EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 4,
    );

    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: colorTheme.colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: margin,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Tem Certeza?'),
            content: const Text('Quer remover o item do carrinho?'),
            actions: [
              TextButton(
                child: const Text('Não'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              TextButton(
                child: const Text('Sim'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              )
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
        margin: margin,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: colorTheme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Text(
                  '${cartItem.price}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text(
            'Total: R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
          ),
          trailing: Text('${cartItem.quantity} x'),
        ),
      ),
    );
  }
}
