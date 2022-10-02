import 'dart:async';

import 'package:cook_it/database/database_helper.dart';
import 'package:cook_it/extensions/capitalize.dart';
import 'package:cook_it/models/category.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../widgets/search_delegate.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Product> suggestionList = [];
  List<ProductCategory> categoryList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<ProductCategory> categories = await dbHelper.getCategories();
    List<Product> suggestions = await dbHelper.getAllProducts();
    setState(
      () {
        categoryList = categories;
        suggestionList = suggestions;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text(
          "Categories",
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MySearchDelegate(suggestionList));
              },
            ),
          )
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Text(
                  categoryList[index].category.capitalizator(),
                  style: const TextStyle(
                      fontFamily: "Comfort",
                      color: Colors.white54,
                      fontSize: 15),
                ),
                trailing: ImageIcon(
                  AssetImage("assets/images/category" +
                      categoryList[index].id.toString() +
                      ".png"),
                  color: Colors.white54,
                  size: 30,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/addproduct',
                      arguments: {"list": categoryList[index].category});
                },
              ),
              color: Colors.grey[850],
            ),
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
