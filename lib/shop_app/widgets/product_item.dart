import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_azuma/shop_app/screens/products_details_screen.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            icon: const Icon(
                false ? Icons.favorite : Icons.favorite_border_outlined),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: const Icon(
                false ? Icons.shopping_cart : Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          backgroundColor: Colors.black45,
          title: Text(product.title),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: product,
            );
          },
          child: CachedNetworkImage(
            placeholder: (ctx, str) => const CircularProgressIndicator(),
            imageUrl: product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
