import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_azuma/flutter_rest_api/models/pokemon_list.dart';
import 'package:dev_azuma/flutter_rest_api/models/yugioh_card.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/remote_service.dart';

class HomePagePokemon extends StatefulWidget {
  const HomePagePokemon({super.key});

  @override
  State<HomePagePokemon> createState() => _HomePagePokemonState();
}

class _HomePagePokemonState extends State<HomePagePokemon> {
  PokemonList? pokemonList;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Pokemon List: ${pokemonList?.count ?? 0}'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: pokemonList?.results?.length,
            itemBuilder: (ctx, index) {
              var currentPokemonList = pokemonList?.results?[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {},
                  leading: FutureBuilder(
                    future: getUrl(currentPokemonList?.url ?? ''),
                    builder:
                        (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      return CachedNetworkImage(
                        imageUrl: snapshot.data ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    },
                  ),
                  title: Text(
                    '${index + 1} ${currentPokemonList?.name}' ?? '',
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    currentPokemonList?.url ?? '',
                    maxLines: 2,
                  ),
                ),
              );
            }),
      ),
    );
  }

  getData() async {
    pokemonList = await RemoteService().getPokemonList();
    if (pokemonList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getUrl(String url) async {
    return RemoteService().getPokemon(url);
  }
}
