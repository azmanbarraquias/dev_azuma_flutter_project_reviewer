import 'package:dev_azuma/navigations/models/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final categoryId = routeArgs['id'] as String;
    final categoryTitle = routeArgs['title'] as String;
    final categoryColor = routeArgs['color'] as Color;
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: categoryColor,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          var currentMeal = categoryMeals[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(currentMeal.title),
            ),
          );
        },
      ),
    );
  }
}
