import 'package:dev_azuma/shop_app/models/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});

  final CartProduct cart;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(cart);
      },
      key: ValueKey(cart.id),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('x${cart.quantity}'),
              ),
              title: Text(cart.product.title),
              subtitle: Text('\$${cart.product.price}'),
              trailing: Text('Total: \$${cart.total.toStringAsFixed(2)}'),
            ),
          )),
    );
  }
}
