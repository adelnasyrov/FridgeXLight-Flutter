import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeTabbar extends StatelessWidget {
  TabController tabController;

  RecipeTabbar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 50,
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.deepOrangeAccent,
          indicatorColor: Colors.deepOrangeAccent,
          labelStyle: TextStyle(fontFamily: "Comfort", fontSize: 15),
          controller: tabController,
          tabs: [
            Tab(text: "Ingredients"),
            Tab(text: "Recipe"),
            Tab(text: "Info"),
          ],
        ),
      ),
    );
  }
}
