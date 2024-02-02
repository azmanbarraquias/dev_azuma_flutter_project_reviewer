import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../x_experiment/flutter_lifecycle.dart';
import '../provider/product.dart';
import '../provider/products.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { all, favorite, sale }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  static String routeName = '/product-overview-screen';


  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions filOp) {
              switch (filOp) {
                case FilterOptions.all:
                  {

                  }
                case FilterOptions.favorite:
                  {

                  }
                case FilterOptions.sale:
                  {}
                default:
                  {}
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (ctx) => FilterOptions.values
                .map((val) => PopupMenuItem(
                      value: val,
                      child: Text(val.name),
                    ))
                .toList(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: const ProductGrid(showFavs: false,),
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    return Future.delayed(const Duration(seconds: 1))
        .then((value) => xPrint('Refresh'));
  }
}
