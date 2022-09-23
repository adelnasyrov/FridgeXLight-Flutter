import 'package:cook_it/models/recipe.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Recipe recipe = arguments["recipe"];
    String recipe_actions = recipe.actions.replaceAll("\n", "\n\n");
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
          RecipeImage(recipe: recipe),
          RecipeTabbar(tabController: _tabController),
          RecipeDescription(
              tabController: _tabController,
              ingredientsList: ingredientsList,
              recipe_actions: recipe_actions,
              recipe: recipe),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
