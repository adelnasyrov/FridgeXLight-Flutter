import 'package:flutter/material.dart';

import '../../models/recipe.dart';

class RecipeImage extends StatelessWidget {
  Recipe recipe;

  RecipeImage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
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
        ],
      ),
    );
  }
}
