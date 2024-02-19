import 'dart:ui';

import 'package:dev_azuma/shop_app/provider/cart.dart';
import 'package:dev_azuma/shop_app/provider/products.dart';
import 'package:dev_azuma/shop_app/screens/cart_screen.dart';
import 'package:dev_azuma/shop_app/screens/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) {
            return Products();
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) {
            return Cart();
          },
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.blue,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium?.fontSize)),
            primarySwatch: Colors.blue),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}
