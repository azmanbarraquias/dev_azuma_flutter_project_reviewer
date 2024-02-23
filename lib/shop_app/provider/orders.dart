import 'package:flutter/cupertino.dart';

import '../models/cart_product.dart';

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartProduct> cartProduct, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProduct,
            dateTime: DateTime.now()));
    notifyListeners();
  }

  void clear() {
    _orders.clear();
    notifyListeners();
  }
}

class OrderItem {
  final String id;
  final double amount;
  final List<CartProduct> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}
