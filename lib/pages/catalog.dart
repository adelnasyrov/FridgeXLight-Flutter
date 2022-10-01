import 'package:cook_it/models/recipe_category_global.dart';
import 'package:cook_it/widgets/recipe_category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<RecipeCategoryGlobal> categoriesList = [];

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
    List<RecipeCategoryGlobal> categoryList =
        await dbHelper.getRecipeCategoriesGlobal();
    setState(
      () {
        categoriesList = categoryList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            "Catalog",
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
                onPressed: () {},
              ),
            )
          ],
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[900],
        body: waiting
            ? Center(
                child:
                    CircularProgressIndicator(color: Colors.deepOrangeAccent),
              )
            : Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            RecipeCategory(
                                category: categoriesList[0],
                                image_address:
                                    "assets/images/recipe_categories/categ_1.jpg"),
                            RecipeCategory(
                                category: categoriesList[2],
                                image_address:
                                    "assets/images/recipe_categories/categ_3.jpg"),
                            RecipeCategory(
                                category: categoriesList[4],
                                image_address:
                                    "assets/images/recipe_categories/categ_5.jpg"),
                            RecipeCategory(
                                category: categoriesList[6],
                                image_address:
                                    "assets/images/recipe_categories/categ_7.jpg"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            RecipeCategory(
                                category: categoriesList[1],
                                image_address:
                                    "assets/images/recipe_categories/categ_2.jpg"),
                            RecipeCategory(
                                category: categoriesList[3],
                                image_address:
                                    "assets/images/recipe_categories/categ_4.jpg"),
                            RecipeCategory(
                                category: categoriesList[5],
                                image_address:
                                    "assets/images/recipe_categories/categ_6.jpg"),
                            RecipeCategory(
                                category: categoriesList[7],
                                image_address:
                                    "assets/images/recipe_categories/categ_8.jpg"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}
