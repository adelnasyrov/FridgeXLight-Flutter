import 'package:cook_it/DatabaseHelper/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:cook_it/models/product.dart';
import 'dart:async';
import 'package:cook_it/models/category.dart';
import 'package:cook_it/extentions/capitalize.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<ProductCategory> categoryList = [];
  List<String> categoriesImages = [];
  List<Product> productsList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<ProductCategory> categories = await dbHelper.getCategories();
    List<String> productsCategories = await getImages(categories);
    setState(
      () {
        categoryList = categories;
        categoriesImages = productsCategories;
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
                categoryList[index].category.capitalize(),
                style: const TextStyle(
                    fontFamily: "Comfort", color: Colors.white54, fontSize: 15),
              ),
              trailing: ImageIcon(
                AssetImage(categoriesImages[index]),
                color: Colors.white54,
                size: 30,
              ),
              onTap: () {
                // categoryList = [];
                // fillCategoryList(categoryList[index].category);
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

  Future<List<String>> getImages(List<ProductCategory> categoryList) async {
    List<String> productsCategories = [];
    for (int i = 0; i < categoryList.length; i++) {
      if (categoryList[i].category == "Мясные изделия" ||
          categoryList[i].category == "Meat") {
        productsCategories.add("assets/images/category1.png");
      } else if (categoryList[i].category == "Рыба" ||
          categoryList[i].category == "Fish") {
        productsCategories.add("assets/images/category2.png");
      } else if (categoryList[i].category == "Молочные продукты" ||
          categoryList[i].category == "Dairy products") {
        productsCategories.add("assets/images/category3.png");
      } else if (categoryList[i].category == "Яйца" ||
          categoryList[i].category == "Eggs") {
        productsCategories.add("assets/images/category4.png");
      } else if (categoryList[i].category == "Овощи" ||
          categoryList[i].category == "Vegetables") {
        productsCategories.add("assets/images/category5.png");
      } else if (categoryList[i].category == "Фрукты" ||
          categoryList[i].category == "Fruits") {
        productsCategories.add("assets/images/category6.png");
      } else if (categoryList[i].category == "Мучные изделия" ||
          categoryList[i].category == "Flour products") {
        productsCategories.add("assets/images/category7.png");
      } else if (categoryList[i].category == "Крупы" ||
          categoryList[i].category == "Cereals") {
        productsCategories.add("assets/images/category8.png");
      } else if (categoryList[i].category == "Приправы" ||
          categoryList[i].category == "Condiments") {
        productsCategories.add("assets/images/category9.png");
      } else if (categoryList[i].category == "Сладости" ||
          categoryList[i].category == "Sweets") {
        productsCategories.add("assets/images/category21.png");
      } else if (categoryList[i].category == "Безалкогольные напитки" ||
          categoryList[i].category == "Soft drinks") {
        productsCategories.add("assets/images/category10.png");
      } else if (categoryList[i].category == "Бобовые культуры" ||
          categoryList[i].category == "Legumes") {
        productsCategories.add("assets/images/category11.png");
      } else if (categoryList[i].category == "Грибы" ||
          categoryList[i].category == "Mushrooms") {
        productsCategories.add("assets/images/category12.png");
      } else if (categoryList[i].category == "Морепродукты" ||
          categoryList[i].category == "Seafood") {
        productsCategories.add("assets/images/category13.png");
      } else if (categoryList[i].category == "Мука" ||
          categoryList[i].category == "Flour") {
        productsCategories.add("assets/images/category14.png");
      } else if (categoryList[i].category == "Орехи и семечки" ||
          categoryList[i].category == "Nuts and seeds") {
        productsCategories.add("assets/images/category15.png");
      } else if (categoryList[i].category == "Сухофрукты" ||
          categoryList[i].category == "Dried fruits") {
        productsCategories.add("assets/images/category16.png");
      } else if (categoryList[i].category == "Сыр" ||
          categoryList[i].category == "Cheese") {
        productsCategories.add("assets/images/category17.png");
      } else if (categoryList[i].category == "Ягоды" ||
          categoryList[i].category == "Berries") {
        productsCategories.add("assets/images/category18.png");
      } else if (categoryList[i].category == "Масла" ||
          categoryList[i].category == "Oils") {
        productsCategories.add("assets/images/category19.png");
      } else if (categoryList[i].category == "Другое" ||
          categoryList[i].category == "Others") {
        productsCategories.add("assets/images/category20.png");
      }
    }
    return productsCategories;
  }
  
  Future<void> fillCategoryList(category) async{
    var dbHelper = DBHelper();
    List<Product> productList = await dbHelper.getProductsByCategory(category);
    setState(
          () {
        productsList = productList;
      },
    );
  }
}
