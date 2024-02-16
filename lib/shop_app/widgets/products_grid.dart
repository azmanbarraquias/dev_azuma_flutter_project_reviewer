import 'package:dev_azuma/shop_app/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';
import '../screens/products_overview_screen.dart';
import 'product_item.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key, required this.showFavs});

  final bool showFavs;

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {

  @override
  Widget build(BuildContext context) {
    final Products productsProv = Provider.of<Products>(context);
    final List<Product> products = widget.showFavs ? productsProv.favoritesItem : productsProv.products;

    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider<Product>(
            create: (BuildContext context) {
              return products[i];
            },
            child: const ProductItem());
      },
    );
  }
}
