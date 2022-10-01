import 'package:cook_it/models/recipe_category_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeLocalCategory extends StatelessWidget {
  RecipeCategoryLocal categoryLocal;
  String image_address;

  RecipeLocalCategory(
      {required this.categoryLocal, required this.image_address});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / 5.2,
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
                child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                    )),
              ),
            )),
            Positioned(
                left: 10,
                bottom: 10,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    child: Text(
                      categoryLocal.category_local,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Comfort",
                        fontSize: 15,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
