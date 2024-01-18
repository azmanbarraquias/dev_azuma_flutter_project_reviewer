import 'package:dev_azuma/navigations/screen/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const routeName = '/filter-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Filter'),
        ),
        drawer: const MainDrawer(),
        body: const Placeholder());
  }
}
