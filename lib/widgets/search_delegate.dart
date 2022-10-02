import 'package:cook_it/extensions/capitalize.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/product.dart';

class MySearchDelegate extends SearchDelegate {
  List<Product> suggestionList;

  MySearchDelegate(this.suggestionList);

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
          )),
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
    List<Product> results = suggestionList.where((searchResult) {
      final result = searchResult.product.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return query.length == 0
        ? Container(color: Colors.grey[900])
        : StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.grey[900],
                child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final suggestion = results[index];
                      return Padding(
                        padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            title: Text(
                              suggestion.product.capitalize(),
                              style: const TextStyle(
                                  fontFamily: "Comfort",
                                  color: Colors.white54,
                                  fontSize: 15),
                            ),
                            trailing: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.deepOrangeAccent,
                              ),
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                value:
                                    suggestion.is_in_fridge == 0 ? false : true,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      suggestion.is_in_fridge = val! ? 1 : 0;
                                      if (val) {
                                        addProduct(suggestion.product);
                                      } else {
                                        removeProduct(suggestion.product);
                                      }
                                    },
                                  );
                                },
                                activeColor: Colors.deepOrangeAccent,
                                checkColor: Colors.grey[900],
                              ),
                            ),
                          ),
                          color: Colors.grey[850],
                        ),
                      );
                    }),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> results = suggestionList.where((searchResult) {
      final result = searchResult.product.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return query.length == 0
        ? Container(color: Colors.grey[900])
        : StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.grey[900],
                child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final suggestion = results[index];
                      return Padding(
                        padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            title: Text(
                              suggestion.product.capitalize(),
                              style: const TextStyle(
                                  fontFamily: "Comfort",
                                  color: Colors.white54,
                                  fontSize: 15),
                            ),
                            trailing: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.deepOrangeAccent,
                              ),
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                value:
                                    suggestion.is_in_fridge == 0 ? false : true,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      suggestion.is_in_fridge = val! ? 1 : 0;
                                      if (val) {
                                        addProduct(suggestion.product);
                                      } else {
                                        removeProduct(suggestion.product);
                                      }
                                    },
                                  );
                                },
                                activeColor: Colors.deepOrangeAccent,
                                checkColor: Colors.grey[900],
                              ),
                            ),
                          ),
                          color: Colors.grey[850],
                        ),
                      );
                    }),
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
