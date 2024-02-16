import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';
import '../provider/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static String routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;

    final productProvider =  Provider.of<Products>(context, listen: false).findById(product);
    return Scaffold(
      appBar: AppBar(
        title: Text(productProvider.title),
      ),
      body: CachedNetworkImage(
        placeholder: (ctx, str) => const CircularProgressIndicator(),
        imageUrl: productProvider.imageUrl,
      ),
    );
  }
}
