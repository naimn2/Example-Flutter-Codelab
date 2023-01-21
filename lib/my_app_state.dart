import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAppState extends ChangeNotifier {
  // data share seluruh aplikasi
  var current = WordPair.random();
  // var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    if (await hasLiked(current)) {
      await _remove();
    } else {
      await _add();
    }
    notifyListeners();
  }

  Future<bool> hasLiked(WordPair current) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    CollectionReference favorites = db.collection('favorites');

    try {
      var favoritesQuery =
          await favorites.where('word', isEqualTo: current.asPascalCase).get();
      if (favoritesQuery.docs.isNotEmpty) return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<void> _add() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    CollectionReference favorites = db.collection('favorites');

    try {
      await favorites
          .doc(current.asPascalCase)
          .set({'word': current.asPascalCase});
    } catch (e) {
      print(e);
    }
  }

  Future<void> _remove() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    CollectionReference favorites = db.collection('favorites');

    await favorites.doc(current.asPascalCase).delete();
  }

  Future<List<String>> getFavorites() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<String> list = [];

    CollectionReference favorites = db.collection('favorites');

    try {
      var favoritesQuery = await favorites.get();
      favoritesQuery.docs.forEach((element) => list.add(element.get('word')));
    } catch (e) {
      print(e);
    }

    return list;
  }
}
