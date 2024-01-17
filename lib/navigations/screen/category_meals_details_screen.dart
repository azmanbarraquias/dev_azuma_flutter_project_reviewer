import 'package:dev_azuma/navigations/models/category_model.dart';
import 'package:dev_azuma/navigations/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../other/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Category>;
    final category = routeArgs['category'] as Category;
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          var currentMeal = categoryMeals[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MealItem(meal: currentMeal),
          );
        },
      ),
    );
  }
}
