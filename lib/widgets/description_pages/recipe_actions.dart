import 'package:flutter/material.dart';

import '../../models/recipe.dart';

class RecipeActions extends StatelessWidget {
  Recipe recipe;

  RecipeActions({required this.recipe});

  @override
  Widget build(BuildContext context) {
    List<String> recipeActions = recipe.actions.split("\n");
    return Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: recipeActions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  recipeActions[index],
                  style: TextStyle(
                    color: Colors.white54,
                    fontFamily: "Comfort",
                    fontSize: 15,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
              );
            }));
  }
}
