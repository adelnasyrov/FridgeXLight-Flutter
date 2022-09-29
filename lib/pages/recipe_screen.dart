import 'package:cook_it/database/database_helper.dart';
import 'package:cook_it/models/recipe.dart';
import 'package:cook_it/widgets/app_bar.dart';
import 'package:cook_it/widgets/description_pages/recipe_image.dart';
import 'package:cook_it/widgets/recipe_description.dart';
import 'package:cook_it/widgets/recipe_tabbar.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with TickerProviderStateMixin {
  List<String> ingredientsList = [];
  List<String> ingredientsMeasures = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> fillIngredientsList(String recipe) async {
    var dbHelper = DBHelper();
    List<String> ingrList = await dbHelper.getProductsByRecipe(recipe);
    List<String> ingrMeasure = await dbHelper.getVolumeMeasureByRecipe(recipe);
    setState(() {
      ingredientsList = ingrList;
      ingredientsMeasures = ingrMeasure;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Recipe recipe = arguments["recipe"];
    if (ingredientsList.length == 0) {
      setState(() {
        fillIngredientsList(recipe.recipe);
      });
    }
    String recipe_actions = recipe.actions.replaceAll("\n", "\n\n");
    print(ingredientsList);
    return Scaffold(
      appBar: CustomAppBar(heading: recipe.recipe_name),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RecipeImage(recipe: recipe),
          RecipeTabbar(tabController: _tabController),
          RecipeDescription(
              tabController: _tabController,
              ingredientsList: ingredientsList,
              ingredientsMeasure: ingredientsMeasures,
              recipe_actions: recipe_actions,
              recipe: recipe),
        ],
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
