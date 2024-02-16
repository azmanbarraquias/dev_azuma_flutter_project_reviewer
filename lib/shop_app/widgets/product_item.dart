import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_azuma/shop_app/screens/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../x_experiment/flutter_lifecycle.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: true); // rerun build
    // xPrint('rerun product');

    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // only rerun subpart of widget
      child: Consumer<Product>(
        builder: (_, product, __) {
          return GridTile(
            footer: GridTileBar(
              leading: IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
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
          );
        },
      ),
    );
  }
}
