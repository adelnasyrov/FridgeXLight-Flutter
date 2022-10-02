import 'package:cook_it/models/recipe.dart';
import 'package:cook_it/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class MySearchDelegate2 extends SearchDelegate {
  List<Recipe> suggestionList;

  MySearchDelegate2(this.suggestionList);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {
                if (query.isEmpty) {
                  close(context, null);
                } else {
                  query = '';
                }
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.deepOrangeAccent,
              )),
        )
      ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.deepOrangeAccent,
        cursorColor: Colors.deepOrangeAccent,
      ),
      hintColor: Colors.white54,
      textTheme: TextTheme(
        headline6: TextStyle(
          decorationThickness: 0.0000001,
          color: Colors.white,
          fontSize: 20,
          fontFamily: "Comfort",
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.grey[800],
      ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.deepOrangeAccent,
        ),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    List<Recipe> results = suggestionList.where((searchResult) {
      final result = searchResult.recipe_name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return query.length == 0
        ? Container(color: Colors.grey[900])
        : StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.grey[900],
                child: SearchListView(
                  recipeList: results,
                ),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Recipe> results = suggestionList.where((searchResult) {
      final result = searchResult.recipe_name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return query.length == 0
        ? Container(color: Colors.grey[900])
        : StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.grey[900],
                child: SearchListView(
                  recipeList: results,
                ),
              );
            },
          );
  }

  Future<void> addProduct(product) async {
    var dbHelper = DBHelper();
    await dbHelper.addProduct(product);
  }

  Future<void> removeProduct(product) async {
    var dbHelper = DBHelper();
    await dbHelper.removeProduct(product);
  }
}
