import 'package:flutter/material.dart';

class RecipeIngredients extends StatelessWidget {
  List<String> ingredientsList;

  RecipeIngredients({required this.ingredientsList});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: ingredientsList.length,
            itemBuilder: (context, index) {
              return Text(
                ingredientsList[index],
                style: TextStyle(
                  color: Colors.white54,
                ),
              );
            }));
  }
}
