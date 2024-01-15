import 'package:dev_azuma/navigations/widgets/category_meals_details_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  final String id;
  final String title;
  final Color color;

  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title, 'color': color},
      // .push(MaterialPageRoute(
      //   builder: (_) {
      //     return CategoryMealsScreen(
      //       categoryId: id,
      //       categoryTitle: title,
      //     );
      //   },
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
