import 'dart:async';

import 'package:cook_it/database/database_helper.dart';
import 'package:cook_it/extensions/capitalize.dart';
import 'package:cook_it/models/product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Fridge extends StatefulWidget {
  const Fridge({Key? key}) : super(key: key);

  @override
  State<Fridge> createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  List<Product> fridgeList = [];
  List<String> categoriesImage = [];
  bool waiting = true;

  loadingAsyncTask() async {
    await getData();

    setState(() {
      waiting = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadingAsyncTask();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<Product> productsList = await dbHelper.getProducts();
    List<String> productsCategories = await getImages(productsList);
    setState(
      () {
        fridgeList = productsList;
        categoriesImage = productsCategories;
      },
    );
  }

  Future<void> clearFridge() async {
    var dbHelper = DBHelper();
    await dbHelper.clearFridge();
  }

  Future<void> removeProduct(product) async {
    var dbHelper = DBHelper();
    await dbHelper.removeProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    var scaffold = Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        title: Text(
          "fridge".tr,
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  AlertDialog remove = AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.grey[900],
                    title: Text(
                      'clear_fridge'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Comfort",
                          fontSize: 18),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                            'do_you_want_to'.tr,
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: "Comfort",
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          'no'.tr,
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          'yes'.tr,
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                        onPressed: () {
                          setState(() {
                            clearFridge();
                            fridgeList = [];
                            categoriesImage = [];
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return remove;
                      });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
              )),
        ],
      ),
      body: Container(
        child: waiting
            ? Center(
                child:
                    CircularProgressIndicator(color: Colors.deepOrangeAccent),
              )
            : fridgeList.length == 0
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'tap_plus'.tr,
                        style: TextStyle(
                            color: Colors.white54,
                            fontFamily: "Comfort",
                            fontSize: 15),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            Fluttertoast.showToast(
                                msg: "product_deleted1".tr +
                                    '"' +
                                    "${fridgeList[index].product.capitalizator()}" +
                                    '" ' +
                                    "product_deleted2".tr, // message
                                toastLength: Toast.LENGTH_SHORT, // length
                                gravity: ToastGravity.BOTTOM, // location
                                timeInSecForIosWeb: 1 // duration
                                );
                            setState(() {
                              removeProduct(fridgeList[index].product);
                              fridgeList.removeAt(index);
                              categoriesImage.removeAt(index);
                            });
                          },
                          key: Key(fridgeList[index].product),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Text(
                                fridgeList[index].product.capitalizator(),
                                style: TextStyle(
                                    fontFamily: "Comfort",
                                    color: Colors.white54,
                                    fontSize: 15),
                              ),
                              trailing: ImageIcon(
                                AssetImage(categoriesImage[index]),
                                color: Colors.white54,
                                size: 30,
                              ),
                            ),
                            color: Colors.grey[850],
                          ),
                        ),
                      );
                    },
                    itemCount: fridgeList.length,
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/categories');
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.grey[900],
          size: 35,
        ),
      ),
    );
    return scaffold;
  }

  Future<List<String>> getImages(List<Product> productsList) async {
    List<String> productsCategories = [];
    for (int i = 0; i < productsList.length; i++) {
      if (productsList[i].category == "Мясные изделия" ||
          productsList[i].category == "Meat products") {
        productsCategories.add("assets/images/category1.png");
      } else if (productsList[i].category == "Рыба" ||
          productsList[i].category == "Fish") {
        productsCategories.add("assets/images/category2.png");
      } else if (productsList[i].category == "Молочные продукты" ||
          productsList[i].category == "Dairy products") {
        productsCategories.add("assets/images/category3.png");
      } else if (productsList[i].category == "Яйца" ||
          productsList[i].category == "Eggs") {
        productsCategories.add("assets/images/category4.png");
      } else if (productsList[i].category == "Овощи" ||
          productsList[i].category == "Vegetables") {
        productsCategories.add("assets/images/category5.png");
      } else if (productsList[i].category == "Фрукты" ||
          productsList[i].category == "Fruits") {
        productsCategories.add("assets/images/category6.png");
      } else if (productsList[i].category == "Мучные изделия" ||
          productsList[i].category == "Flour products") {
        productsCategories.add("assets/images/category7.png");
      } else if (productsList[i].category == "Крупы" ||
          productsList[i].category == "Cereals") {
        productsCategories.add("assets/images/category8.png");
      } else if (productsList[i].category == "Приправы" ||
          productsList[i].category == "Condiments") {
        productsCategories.add("assets/images/category9.png");
      } else if (productsList[i].category == "Сладости" ||
          productsList[i].category == "Sweets") {
        productsCategories.add("assets/images/category10.png");
      } else if (productsList[i].category == "Безалкогольные напитки" ||
          productsList[i].category == "Soft drinks") {
        productsCategories.add("assets/images/category11.png");
      } else if (productsList[i].category == "Бобовые культуры" ||
          productsList[i].category == "Legumes") {
        productsCategories.add("assets/images/category12.png");
      } else if (productsList[i].category == "Грибы" ||
          productsList[i].category == "Mushrooms") {
        productsCategories.add("assets/images/category13.png");
      } else if (productsList[i].category == "Морепродукты" ||
          productsList[i].category == "Seafood") {
        productsCategories.add("assets/images/category14.png");
      } else if (productsList[i].category == "Мука" ||
          productsList[i].category == "Flour") {
        productsCategories.add("assets/images/category15.png");
      } else if (productsList[i].category == "Орехи и семечки" ||
          productsList[i].category == "Nuts and seeds") {
        productsCategories.add("assets/images/category16.png");
      } else if (productsList[i].category == "Сухофрукты" ||
          productsList[i].category == "Dried fruits") {
        productsCategories.add("assets/images/category17.png");
      } else if (productsList[i].category == "Сыр" ||
          productsList[i].category == "Cheese") {
        productsCategories.add("assets/images/category18.png");
      } else if (productsList[i].category == "Ягоды" ||
          productsList[i].category == "Berries") {
        productsCategories.add("assets/images/category19.png");
      } else if (productsList[i].category == "Масла" ||
          productsList[i].category == "Oils") {
        productsCategories.add("assets/images/category20.png");
      } else if (productsList[i].category == "Другое" ||
          productsList[i].category == "Others") {
        productsCategories.add("assets/images/category21.png");
      } else {
        productsCategories.add("assets/images/proteins.png");
      }
    }
    return productsCategories;
  }
}
