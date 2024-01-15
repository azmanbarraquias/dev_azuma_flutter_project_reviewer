import 'package:dev_azuma/navigations/widgets/category_meals_item_menu.dart';
import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Category'),
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map((e) => CategoryItem(
                    title: e.title,
                    color: e.color,
                    id: e.id,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
