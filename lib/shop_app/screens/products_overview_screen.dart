import 'package:dev_azuma/shop_app/provider/cart.dart';
import 'package:dev_azuma/shop_app/screens/cart_screen.dart';
import 'package:dev_azuma/shop_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../x_experiment/flutter_lifecycle.dart';
import '../provider/product.dart';
import '../provider/products.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart' as xBadge;

enum FilterOptions { all, favorite, sale }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  static String routeName = '/product-overview-screen';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          Consumer<Cart>(
            builder: (_, value, child) {
              return xBadge.Badge(
                value: value.itemCount.toString(),
                child: child!,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions filOp) {
              setState(() {
                switch (filOp) {
                  case FilterOptions.all:
                    {
                      _showOnlyFavorites = false;
                    }
                  case FilterOptions.favorite:
                    {
                      _showOnlyFavorites = true;
                    }
                  case FilterOptions.sale:
                    {
                      _showOnlyFavorites = false;
                    }
                  default:
                    {
                      _showOnlyFavorites = false;
                    }
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (ctx) => FilterOptions.values
                .map((val) => PopupMenuItem(
                      value: val,
                      child: Text(val.name),
                    ))
                .toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ProductGrid(
            showFavs: _showOnlyFavorites,
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }

  Future<void> onRefresh() async {
    return Future.delayed(const Duration(seconds: 1))
        .then((value) => xPrint('Refresh'));
  }
}
