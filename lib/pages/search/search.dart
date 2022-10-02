import 'package:cook_it/models/recipe.dart';
import 'package:cook_it/widgets/app_bar.dart';
import 'package:cook_it/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

import '../../database/database_helper.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Recipe> recipeList = [];
  bool waiting = true;

  loadingAsyncTask() async {
    await getData();

    setState(() {
      waiting = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadingAsyncTask();
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
      backgroundColor: Colors.grey[900],
      body: Container(
        child: waiting
            ? Center(
          child:
                    CircularProgressIndicator(color: Colors.deepOrangeAccent),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SearchListView(
                      recipeList: recipeList,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
