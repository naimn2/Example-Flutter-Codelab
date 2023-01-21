import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app_state.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> favorites = [];
  bool hasOnceGetFavorites = false;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    appState.getFavorites().then((value) {
      print('favorites $favorites');
      print('value $value');
      print('hasOnceGetFavorites $hasOnceGetFavorites');
      if (!hasOnceGetFavorites) {
        print('set state favorite');
        setState(() => favorites = value);
        hasOnceGetFavorites = true;
      }
    });

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorites.length} favorites:'),
        ),
        ..._getListFavoriteTiles(context, favorites),
      ],
    );
  }

  List<Widget> _getListFavoriteTiles(
      BuildContext context, List<String> favorites) {
    List<Widget> favoriteTiles = [];
    for (var i = 0; i < favorites.length; i++) {
      favoriteTiles.add(
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(favorites[i])));
          },
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text(favorites[i]),
          ),
        ),
      );
    }
    return favoriteTiles;
  }
}
