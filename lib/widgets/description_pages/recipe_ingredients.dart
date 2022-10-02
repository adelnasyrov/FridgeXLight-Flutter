import 'package:cook_it/extensions/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/recipe.dart';

class RecipeIngredients extends StatelessWidget {
  List<String> ingredientsList;
  List<String> ingredientsMeasure;
  Recipe recipe;

  RecipeIngredients(
      {required this.ingredientsList,
      required this.ingredientsMeasure,
      required this.recipe});

  @override
  Widget build(BuildContext context) {
    List<String> recipeValues = recipe.recipe_value.split(' ');
    for (var i = 0; i < ingredientsMeasure.length; i++) {
      if (recipeValues[i] == "-1") {
        recipeValues[i] = "";
        ingredientsMeasure[i] = "to_taste".tr;
      }
    }
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
          child: ListView.builder(
              itemCount: ingredientsList.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      ingredientsList[index].capitalizator(),
                      style: TextStyle(
                          color: Colors.white54,
                          fontFamily: "Comfort",
                          fontSize: 15),
                    ),
                  ),
                  Flexible(
                      child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "..................................................................................................",
                            style:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        recipeValues[index] + ingredientsMeasure[index],
                        style: TextStyle(color: Colors.white54, fontSize: 15),
                      ))
                ]);
              })),
    );
  }
}
