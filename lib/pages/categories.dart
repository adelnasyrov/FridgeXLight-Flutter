import 'dart:async';

import 'package:cook_it/DatabaseHelper/database_helper.dart';
import 'package:cook_it/extensions/capitalize.dart';
import 'package:cook_it/models/category.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<ProductCategory> categoryList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<ProductCategory> categories = await dbHelper.getCategories();
    setState(
      () {
        categoryList = categories;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          "Categories",
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
              )),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              title: Text(
                categoryList[index].category.capitalize(),
                style: const TextStyle(
                    fontFamily: "Comfort", color: Colors.white54, fontSize: 15),
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
            color: Colors.grey[900],
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
