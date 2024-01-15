import 'package:dev_azuma/navigations/widgets/category_meals_details_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/categories_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yakitati Recipe\'s',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        hintColor: Colors.amber,
        canvasColor: Colors.blueAccent,
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              titleMedium:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              titleSmall:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      // default is /
      // home: const CategoriesScreen(),
      routes: {
        '/': (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
      },
    );
  }
}
