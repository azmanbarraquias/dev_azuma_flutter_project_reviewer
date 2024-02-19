import 'package:dev_azuma/shop_app/provider/product.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final Product product;
  final int quantity;

  CartItem({required this.id, required this.product, required this.quantity});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (value) => CartItem(
              id: value.id,
              product: value.product,
              quantity: value.quantity + 1));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
              id: DateTime.now().toString(), product: product, quantity: 1));
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });

    return total;
  }
}
