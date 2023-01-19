import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    IconData icon;
    if (appState.favorites.contains(appState.current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // center main axis / vertical
          children: [
            BigCard(appState: appState),
            SizedBox(height: 10), // just for space between two widgets
            Row(
              mainAxisSize: MainAxisSize.min, // width to wrap content
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                    print('favorit: ${appState.favorites}');
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                    print('eh kepencet ${appState.current.asLowerCase}');
                  },
                  child: Text('Lanjut Mang'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.appState,
  }) : super(key: key);

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); // get the current them of the app

    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    // theme.textTheme access app font theme
    // dispayMedium usually for short text and important
    // copyWith method returns a copy of the text style with the changes you define, in other words, a way to customize the textStyle
    // color: "theme.colorScheme.onPrimary" defines a color that is a good fit for use on the app's primary color

    final pair = appState.current;

    return Card(
      color:
          theme.colorScheme.primary, // get primary color from them color scheme
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}
