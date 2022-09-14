import 'dart:async';

import 'package:cook_it/models/recipe.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with TickerProviderStateMixin {
  List<String> ingredientsList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<String>> getData(recipe) async {
    var dbHelper = DBHelper();
    final recipe_ingredients = recipe.recipe.split(" ");
    List<String> ingredients = [];
    for (int i = 0; i < recipe_ingredients.length; i++) {
      int id = int.parse(recipe_ingredients[i]);
      String product = await dbHelper.getProductById(id);
      ingredients.add(product);
    }
    return ingredients;
  }

  // Future<List> convertFutureListToList(recipe) async {
  //   Future<List> _futureOfList = getData(recipe);
  //   List list = await _futureOfList ;
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Recipe recipe = arguments["recipe"];
    // List<String> ingredientsList = convertFutureListToList(recipe) as List<String>;
    // getData(recipe);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        title: Text(
          recipe.recipe_name,
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child:
                Stack(alignment: AlignmentDirectional.centerStart, children: [
              Positioned.fill(
                  child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/recipes/recipe_' +
                        (recipe.id).toString() +
                        '.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 50,
              child: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.deepOrangeAccent,
                indicatorColor: Colors.deepOrangeAccent,
                labelStyle: TextStyle(fontFamily: "Comfort", fontSize: 15),
                controller: _tabController,
                tabs: [
                  Tab(text: "Ingredients"),
                  Tab(text: "Recipe"),
                  Tab(text: "Info"),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              width: double.maxFinite,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                      child: ListView.builder(
                          itemCount: ingredientsList.length,
                          itemBuilder: (context, index) {
                            return Text(
                              ingredientsList[index],
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            );
                          })),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(recipe.actions,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Text("тут будет инфа", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
