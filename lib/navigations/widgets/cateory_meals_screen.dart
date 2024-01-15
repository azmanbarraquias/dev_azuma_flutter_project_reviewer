import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: Text('The Recipes for the category $categoryTitle'),
      ),
    );
  }
}
