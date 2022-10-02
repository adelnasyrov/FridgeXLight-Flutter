import 'package:cook_it/models/recipe_category_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeGlobalCategoryDisabled extends StatelessWidget {
  RecipeCategoryGlobal category;
  String image_address;

  RecipeGlobalCategoryDisabled(
      {required this.category, required this.image_address});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / 5.4,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Positioned.fill(
                child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image_address,
                  fit: BoxFit.cover,
                ),
              ),
            )),
            Positioned(
              left: 15,
              bottom: 15,
              child: Container(
                child: Text(
                  category.category_global,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Comfort",
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Positioned(
                child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.8),
                      ],
                    )),
              ),
            )),
            Positioned(
              right: 0,
              left: 0,
              child: Icon(
                Icons.lock,
                color: Colors.white54,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
