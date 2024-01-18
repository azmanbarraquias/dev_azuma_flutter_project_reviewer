import 'package:dev_azuma/navigations/screen/filters_screen.dart';
import 'package:dev_azuma/navigations/screen/tab_screen.dart';
import 'package:dev_azuma/x_experiment/flutter_lifecycle.dart';
import 'package:flutter/material.dart';

import 'screen/categories_screen.dart';
import 'screen/category_meals_details_screen.dart';
import 'screen/meal_detail_screen.dart';

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
        tabBarTheme: const TabBarTheme(
            tabAlignment: TabAlignment.fill,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(100, 500),
                topRight: Radius.elliptical(100, 500),
              ),
            ),
            indicatorColor: Colors.black),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      initialRoute: '/',
      // default is /
      // home: const CategoriesScreen(),
      routes: {
        '/': (ctx) => const TabScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen(),
      },
      onGenerateRoute: (setting) {
        xPrint(setting.arguments.toString());
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
      onUnknownRoute: (setting) {
        //404
        xPrint(setting.arguments.toString());
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
