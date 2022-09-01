import 'dart:async';

import 'package:cook_it/DatabaseHelper/database_helper.dart';
import 'package:cook_it/extensions/capitalize.dart';
import 'package:cook_it/models/product.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<Product> productsList = [];
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getData(category) async {
    var dbHelper = DBHelper();
    List<Product> productList = await dbHelper.getProductsByCategory(category);
    setState(() {
      productsList = productList;
    });
  }

  Future<void> addProduct(product) async {
    var dbHelper = DBHelper();
    await dbHelper.addProduct(product);
  }

  Future<void> removeProduct(product) async {
    var dbHelper = DBHelper();
    await dbHelper.removeProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    String category = arguments["list"];
    setState(() {
      getData(category);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          "Products",
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
            ),
          )
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
                productsList[index].product.capitalize(),
                style: const TextStyle(
                    fontFamily: "Comfort", color: Colors.white54, fontSize: 15),
              ),
              trailing: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                value: productsList[index].is_in_fridge == 0 ? false : true,
                onChanged: (val) {
                  setState(
                    () {
                      productsList[index].is_in_fridge = val! ? 1 : 0;
                      if (val) {
                        addProduct(productsList[index].product);
                      } else {
                        removeProduct(productsList[index].product);
                      }
                    },
                  );
                },
                activeColor: Colors.deepOrangeAccent,
                checkColor: Colors.grey[900],
              ),
            ),
            color: Colors.grey[900],
          );
        },
        itemCount: productsList.length,
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
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
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => Container();

  Future<List<Product>> getSuggestions() async {
    var dbHelper = DBHelper();
    List<Product> productList = await dbHelper.getAllProducts();
    return productList;
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
