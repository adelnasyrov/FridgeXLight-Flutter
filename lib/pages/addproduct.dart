import 'package:cook_it/DatabaseHelper/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:cook_it/models/product.dart';
import 'dart:async';
import 'package:cook_it/extentions/capitalize.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  List<Product> productList = [];
  String category = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<Product> productsList = await dbHelper.getProductsByCategory(category);
    setState(
          () {
        productList = productsList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    category = arguments["category"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            category,
            style: const TextStyle(
              fontFamily: "Comfort",
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
              )),
        ],
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              title: Text(
                productList[index].product.capitalize(),
                style: const TextStyle(
                    fontFamily: "Comfort", color: Colors.white54, fontSize: 15),
              ),
            ),
            color: Colors.grey[900],
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
