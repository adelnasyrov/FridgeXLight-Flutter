import 'package:cook_it/extensions/capitalize.dart';
import 'package:cook_it/models/recipe.dart';
import 'package:cook_it/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Recipe> recipeList = [];
  List<String> ingredientsList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<Recipe> recipesList = await dbHelper.getRecipes();
    setState(
      () {
        recipeList = recipesList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        heading: "Search",
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: recipeList.length,
              itemBuilder: (BuildContext ctx, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/recipe_screen', arguments: {
                      "recipe": recipeList[index],
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Positioned.fill(
                              left: 0,
                              right: 270,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/recipes/recipe_' +
                                      (recipeList[index].id).toString() +
                                      '.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Positioned.fill(
                            left: 140,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    recipeList[index].recipe_name.capitalize(),
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        fontFamily: "Comfort"),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/fridge_button.png',
                                            height: 20,
                                            width: 20,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            recipeList[index]
                                                    .amountHave
                                                    .toString() +
                                                "/" +
                                                (" "
                                                            .allMatches(
                                                                recipeList[
                                                                        index]
                                                                    .recipe_value)
                                                            .length +
                                                        1)
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                                fontFamily: "Comfort"),
                                          ),
                                          SizedBox(
                                            width: 36,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/timer.png',
                                            height: 20,
                                            width: 20,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            recipeList[index].time.toString() +
                                                "мин",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                                fontFamily: "Comfort"),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          )
                                        ],
                                      )
                                    ])
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
