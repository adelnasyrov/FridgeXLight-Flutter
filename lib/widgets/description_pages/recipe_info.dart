import 'package:cook_it/widgets/info_cards/calories_card.dart';
import 'package:cook_it/widgets/info_cards/carbohydrates_card.dart';
import 'package:cook_it/widgets/info_cards/categories_card.dart';
import 'package:cook_it/widgets/info_cards/fats_card.dart';
import 'package:cook_it/widgets/info_cards/proteins_card.dart';
import 'package:cook_it/widgets/info_cards/source_card.dart';
import 'package:cook_it/widgets/info_cards/time_card.dart';
import 'package:flutter/cupertino.dart';

import '../../models/recipe.dart';

class RecipeInfo extends StatelessWidget {
  Recipe recipe;

  RecipeInfo({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  TimeCard(recipe: recipe),
                  ProteinsCard(recipe: recipe),
                  CarbohydratesCard(recipe: recipe),
                  SourceCard(recipe: recipe),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  CaloriesCard(recipe: recipe),
                  FatsCard(recipe: recipe),
                  CategoriesCard(recipe: recipe),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
