import 'package:flutter/material.dart';
import '../provider/orders.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(itemBuilder: (ctx, i) {
        return const Text('');
      }),
    );
  }
}
