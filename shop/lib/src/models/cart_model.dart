import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/src/models/cart_item_model.dart';
import 'package:shop/src/models/product_model.dart';

class Cart with ChangeNotifier {
  Map<String, CartItemModel> _items = {};

  Map<String, CartItemModel> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItemModel(
            id: existingItem.id,
            productId: existingItem.productId,
            name: existingItem.name,
            quantity: existingItem.quantity + 1,
            price: existingItem.price),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItemModel(
            id: Random().nextDouble().toString(),
            productId: product.id,
            name: product.name,
            quantity: 1,
            price: product.price),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
