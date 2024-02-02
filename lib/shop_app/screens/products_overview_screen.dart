import 'package:flutter/material.dart';

import '../../x_experiment/flutter_lifecycle.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({super.key});

  static String routeName = '/product-overview-screen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: const ProductGrid(),
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    return Future.delayed(const Duration(seconds: 1))
        .then((value) => xPrint('Refresh'));
  }
}
