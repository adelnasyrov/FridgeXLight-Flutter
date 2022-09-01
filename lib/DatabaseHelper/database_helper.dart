import 'dart:async';
import "dart:io" as io;

import 'package:cook_it/models/category.dart';
import 'package:cook_it/models/product.dart';
import 'package:cook_it/models/recipe.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documnetsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documnetsDirectory.path, "FridgeXX.db");
    bool dbExists = await io.File(path).exists();
    if (!dbExists) {
      ByteData data = await rootBundle.load(join("assets", "FridgeXX.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    var db = await openDatabase(path, version: 1);
    return db;
  }

  Future<List<Product>> getProducts() async {
    var dbCursor = await db;
    List<Map> mappedList = await dbCursor!
        .rawQuery('SELECT * FROM products WHERE is_in_fridge = 1');
    List<Product> fridgeProducts = [];
    for (int i = 0; i < mappedList.length; i++) {
      fridgeProducts.add(Product(
          id: mappedList[i]["id"],
          category: mappedList[i]["category"],
          product: mappedList[i]["product"],
          is_in_fridge: mappedList[i]["is_in_fridge"],
          is_in_cart: mappedList[i]["is_in_cart"],
          amount: mappedList[i]["amount"],
          is_starred: mappedList[i]["is_starred"],
          banned: mappedList[i]["banned"]));
    }
    return fridgeProducts;
  }

  Future<List<Product>> getAllProducts() async {
    var dbCursor = await db;
    List<Map> mappedList = await dbCursor!.rawQuery('SELECT * FROM products');
    List<Product> fridgeProducts = [];
    for (int i = 0; i < mappedList.length; i++) {
      fridgeProducts.add(Product(
          id: mappedList[i]["id"],
          category: mappedList[i]["category"],
          product: mappedList[i]["product"],
          is_in_fridge: mappedList[i]["is_in_fridge"],
          is_in_cart: mappedList[i]["is_in_cart"],
          amount: mappedList[i]["amount"],
          is_starred: mappedList[i]["is_starred"],
          banned: mappedList[i]["banned"]));
    }
    return fridgeProducts;
  }

  Future<List<ProductCategory>> getCategories() async {
    var dbCursor = await db;
    List<Map> mappedList = await dbCursor!.rawQuery('SELECT * FROM categories');
    List<ProductCategory> categories = [];
    for (int i = 0; i < mappedList.length; i++) {
      categories.add(ProductCategory(
          id: mappedList[i]["id"],
          category: mappedList[i]["category"],
          value: mappedList[i]["value"]));
    }
    return categories;
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    var dbCursor = await db;
    List<Map> mappedList = await dbCursor!
        .rawQuery('SELECT * FROM products WHERE category = "$category"');
    List<Product> categoryProducts = [];
    for (int i = 0; i < mappedList.length; i++) {
      categoryProducts.add(Product(
          id: mappedList[i]["id"],
          category: mappedList[i]["category"],
          product: mappedList[i]["product"],
          is_in_fridge: mappedList[i]["is_in_fridge"],
          is_in_cart: mappedList[i]["is_in_cart"],
          amount: mappedList[i]["amount"],
          is_starred: mappedList[i]["is_starred"],
          banned: mappedList[i]["banned"]));
    }
    return categoryProducts;
  }

  Future<void> addProduct(String product) async {
    var dbCursor = await db;
    await dbCursor!.rawQuery(
        'UPDATE products SET is_in_fridge = 1 WHERE product = "$product"');
  }

  Future<void> removeProduct(String product) async {
    var dbCursor = await db;
    await dbCursor!.rawQuery(
        'UPDATE products SET is_in_fridge = 0 WHERE product = "$product"');
  }

  Future<List<Recipe>> getRecipes() async {
    var dbCursor = await db;
    List<Map> mappedList = await dbCursor!.rawQuery('SELECT * FROM recipes');
    List<Recipe> recipes = [];
    List<Product> productsHave = await getProducts();
    List<String> ids = [];
    for (var elem in productsHave) {
      ids.add(elem.id.toString());
    }
    for (int i = 0; i < mappedList.length; i++) {
      int amount = 0;
      var products = mappedList[i]["recipe"].toString().split(" ");
      int max_amount = products.length;
      for (var elem in products) {
        if (ids.contains(elem)) amount += 1;
      }
      if (amount / max_amount > 0.15) {
        recipes.add(Recipe(
            id: mappedList[i]["id"],
            category_global: mappedList[i]["category_global"],
            category_local: mappedList[i]["category_local"],
            recipe_name: mappedList[i]["recipe_name"],
            recipe: mappedList[i]["recipe"],
            recipe_value: mappedList[i]["recipe_value"],
            time: mappedList[i]["time"],
            is_starred: mappedList[i]["is_starred"],
            actions: mappedList[i]["actions"],
            source: mappedList[i]["source"].toString(),
            calories: mappedList[i]["calories"],
            proteins: mappedList[i]["proteins"].toDouble(),
            fats: mappedList[i]["fats"].toDouble(),
            carboh: mappedList[i]["carboh"].toDouble(),
            banned: mappedList[i]["banned"],
            amountHave: amount,
            percentageAmountHave: amount / max_amount));
      }
    }
    recipes.sort(
        (a, b) => a.percentageAmountHave.compareTo(b.percentageAmountHave));
    recipes = recipes.reversed.toList();
    return recipes;
  }
}