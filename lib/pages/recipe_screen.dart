import 'package:cook_it/models/recipe.dart';
import 'package:cook_it/widgets/ingridient_info.dart';
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
          Container(
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Container(
                width: double.maxFinite,
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
                    Padding(
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
                    ),
                    IngridientInfo(recipe: recipe),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
