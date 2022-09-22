import 'package:flutter/material.dart';

import '../models/recipe.dart';

class CaloriesCard extends StatelessWidget {
  Recipe recipe;

  CaloriesCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        color: Colors.grey[850],
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text("Калории",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Comfort", fontSize: 12),
                  textAlign: TextAlign.center)),
          Image.asset(
            'assets/images/calories.png',
            height: 24,
            width: 24,
            color: Colors.white54,
            fit: BoxFit.cover,
          ),
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(recipe.calories.toString() + " ккал/100г",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Comfort", fontSize: 12),
                  textAlign: TextAlign.center)),
        ]),
      ),
    );
  }
}
