import 'package:cook_it/models/recipe_category_global.dart';
import 'package:cook_it/widgets/app_bar.dart';
import 'package:cook_it/widgets/recipe_local_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../database/database_helper.dart';
import '../../models/recipe_category_local.dart';

class LocalCatalog extends StatefulWidget {
  const LocalCatalog({Key? key}) : super(key: key);

  @override
  State<LocalCatalog> createState() => _LocalCatalog();
}

class _LocalCatalog extends State<LocalCatalog> {
  List<RecipeCategoryLocal> localCategoriesList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> getData(String category_global_name) async {
    var dbHelper = DBHelper();
    List<RecipeCategoryLocal> localList = await dbHelper
        .getCategoriesLocalByCategoriesGlobal(category_global_name);
    setState(
      () {
        localCategoriesList = localList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    RecipeCategoryGlobal category_global = arguments["category_global"];
    getData(category_global.category_global);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBar(
        heading: category_global.category_global,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: localCategoriesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: RecipeLocalCategory(
                    categoryLocal: localCategoriesList[index],
                    image_address: "assets/images/local_categories/podcateg_" +
                        localCategoriesList[index].id.toString() +
                        ".jpg"),
              );
            }),
      ),
    );
  }
}
