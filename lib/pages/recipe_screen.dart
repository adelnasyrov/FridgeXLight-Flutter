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
    String recipe_actions = recipe.actions.replaceAll("\n", "\n\n");
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
            height: 200,
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
            padding: EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Container(
              width: double.maxFinite,
              height: 480,
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
                    child: Text(
                      recipe_actions,
                      style: TextStyle(
                        color: Colors.white54,
                        fontFamily: "Comfort",
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 230,
                                height: 90,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Column(children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: Text("Время приготовления",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Comfort",
                                                fontSize: 12),
                                            textAlign: TextAlign.center)),
                                    Image.asset(
                                      'assets/images/timer.png',
                                      height: 24,
                                      width: 24,
                                      color: Colors.white54,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: Text(
                                            recipe.time.toString() + " мин",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Comfort",
                                                fontSize: 12),
                                            textAlign: TextAlign.center)),
                                  ]),
                                  color: Colors.grey[800],
                                ),
                              ),
                              Container(
                                width: 230,
                                height: 90,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Column(children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: Text("Белки",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Comfort",
                                                fontSize: 12),
                                            textAlign: TextAlign.center)),
                                    Image.asset(
                                      'assets/images/proteins.png',
                                      height: 24,
                                      width: 24,
                                      color: Colors.white54,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: Text(
                                            recipe.proteins.toString() +
                                                " г/100г",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Comfort",
                                                fontSize: 12),
                                            textAlign: TextAlign.center)),
                                  ]),
                                  color: Colors.grey[800],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 230,
                                height: 90,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  color: Colors.grey[800],
                                  child: Column(children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: Text("Калории",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Comfort",
                                                fontSize: 12),
                                            textAlign: TextAlign.center)),
                                    Image.asset(
                                      'assets/images/calories.png',
                                      height: 24,
                                      width: 24,
                                      color: Colors.white54,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: Text(
                                            recipe.calories.toString() +
                                                " ккал/100г",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Comfort",
                                                fontSize: 12),
                                            textAlign: TextAlign.center)),
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
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
