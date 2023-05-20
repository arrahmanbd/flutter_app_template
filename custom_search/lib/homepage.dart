import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: randomColor,
      appBar: AppBar(
        backgroundColor: randomColor,
        elevation: 0,
        title: const Text('Search App'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: const Padding(
        padding:  EdgeInsets.all(10.0),
        child:  Center(
          child: Text(
            'Hello\?\nSearching\nAnything',
            style: TextStyle(
                fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        setState(() { 
       randomColor =Colors.primaries[Random().nextInt(Colors.primaries.length)];
        });
      },
      backgroundColor: Colors.white,
      child: Icon(Icons.palette,color: randomColor,),
      ),
    );
  }
}

//Custom Seach Functions
class MySearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        // Use this to change the query's text style
        headline6: TextStyle(fontSize: 24.0, color: Colors.white),
      ),
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.teal, elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,

        // Use this change the placeholder's text style
        hintStyle: TextStyle(fontSize: 24.0,color: Colors.white),
      ),
    );
  }

  //Update suggestion on type
  List<String> searchResults = ['Orkitt', 'Google', 'Facebook', 'Twitter'];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear)),
      ];

  @override
  Widget buildResults(BuildContext context) => Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Text(
              query,
              style: const TextStyle(
                  fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
            )),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    /* 
    List<String> suggestions = ['Orkitt', 'Google', 'Facebook', 'Twitter']; */

    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            //display on result
            showResults(context);
          },
        );
      },
    );
  }
}
