import 'package:flutter/material.dart';

class RecipeActions extends StatelessWidget {
  String recipe_actions;

  RecipeActions({required this.recipe_actions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
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
    );
  }
}
