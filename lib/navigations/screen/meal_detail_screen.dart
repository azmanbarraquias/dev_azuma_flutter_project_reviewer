import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = '/meal-details';

  _buildSectionTitle(String mealTitle, context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        mealTitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal =
        (ModalRoute.of(context)?.settings.arguments as Set<Meal>).first;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(meal);
        },
        child: const Icon(Icons.delete),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(meal.id),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: 'meal',
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildSectionTitle('Ingredients', context),
            _buildContainer(list: meal.ingredients),
            _buildSectionTitle('Steps', context),
            _buildContainer(list: meal.steps),
          ],
        ),
      ),
    );
  }
}

class _buildContainer extends StatelessWidget {
  const _buildContainer({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.grey,
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (ctx, index) {
            return Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  list[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
    );
  }
}
