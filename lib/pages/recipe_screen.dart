import 'package:cook_it/models/recipe.dart';
import 'package:flutter/material.dart';

import '../DatabaseHelper/dbhelper.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<Recipe> recipeList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<Recipe> recipesList = await dbHelper.getRecipes();
    setState(
      () {
        recipeList = recipesList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        title: const Text(
          "Search",
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
