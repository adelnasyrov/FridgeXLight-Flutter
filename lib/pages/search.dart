import 'package:cook_it/extensions/capitalize.dart';
import 'package:cook_it/models/recipe.dart';
import 'package:flutter/material.dart';

import '../DatabaseHelper/database_helper.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Recipe> recipeList = [];

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        title: const Text(
          "Search",
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
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
                    Navigator.pushNamed(context, '/recipe_screen');
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 7, left: 10, right: 10, bottom: 7),
                    height: 70,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Positioned.fill(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/recipes/recipe_' +
                                (recipeList[index].id).toString() +
                                '.jpg',
                            fit: BoxFit.cover,
                          ),
                        )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                            )),
                        Row(
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
                                                            recipeList[index]
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
                      ],
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
