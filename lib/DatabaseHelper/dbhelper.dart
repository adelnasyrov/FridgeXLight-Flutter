import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import "dart:io" as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cook_it/models/product.dart';
import 'package:cook_it/models/category.dart';
import 'dart:async';
import 'package:flutter/services.dart';

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
        .rawQuery('SELECT * FROM products WHERE is_in_fridge = 0');
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
        .rawQuery('SELECT * FROM products WHERE category = $category');
    List<Product> categoriedProducts = [];
    for (int i = 0; i < mappedList.length; i++) {
      categoriedProducts.add(Product(
          id: mappedList[i]["id"],
          category: mappedList[i]["category"],
          product: mappedList[i]["product"],
          is_in_fridge: mappedList[i]["is_in_fridge"],
          is_in_cart: mappedList[i]["is_in_cart"],
          amount: mappedList[i]["amount"],
          is_starred: mappedList[i]["is_starred"],
          banned: mappedList[i]["banned"]));
    }
    return categoriedProducts;
  }
}
