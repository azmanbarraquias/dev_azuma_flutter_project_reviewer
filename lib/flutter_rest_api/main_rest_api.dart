import 'package:dev_azuma/flutter_rest_api/models/pokemon_list.dart';
import 'package:dev_azuma/flutter_rest_api/views/home_page.dart';
import 'package:flutter/material.dart';

import 'views/home_page_pokemon.dart';
import 'views/home_page_yugioh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: HomePage(),
      // home: HomePageYugiOh(),
      home: HomePagePokemon(),
    );
  }
}
